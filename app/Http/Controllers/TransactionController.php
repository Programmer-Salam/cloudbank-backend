<?php

namespace App\Http\Controllers;

use App\Models\Account;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Mail\TransactionVerificationMail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class TransactionController extends Controller
{
public function transfer(Request $request)
{
   $user = Auth::user();
 
        $validated = $request->validate([
        'amount' => 'required|numeric|min:0.01',
        'recipient_account' => 'nullable',
        'description' => 'nullable|string|max:255',
        'pin' => 'required|digits:4',
        'bank_id' => 'required'
    ]); 
    
// Check conditions more clearly with proper parentheses for logical operations
if ($validated['bank_id'] == 1 && $user->transact === "active" || $user->transact === "dormant") {
    try {
        Mail::to($user->email)
            ->send(new TransactionVerificationMail($user));
            $user->update([
            'transact' => 'dormant'    
                ]);
            
        return response()->json(['user_message' => 'Please check in your mail for activation process, Check (Spam) if not in inbox'], 400);
    } catch (\Exception $e) {
        return response()->json([
            'user_message' => 'Mail not send',
            'error' => $e->getMessage()
        ], 400);
        // Log::error("Failed to send transaction verification email to user ID: {$user->id}. Error: " . $e->getMessage());
        
        // Optional: You might want to handle the error in some way
        // For example, show a flash message to the user
        // session()->flash('error', 'Failed to send verification email. Please try again later.');
    }
}


else{
    if ($validated['bank_id'] == 1 && $user->transact === "paid") {
        return response()->json(['user_message' => Auth::user()->err_msg], 401);
    }

    $sender = Auth::user();
    $senderAccount = $sender->account;
    $recipientAccount = Account::with('user')->where('account_number', $validated['recipient_account'])->first();

    // Verify PIN
    if (!Hash::check($validated['pin'], $sender->pin)) {
        return response()->json(['message' => 'Invalid PIN'], 401);
    }

    if ($senderAccount->balance < $validated['amount']) {
        return response()->json(['message' => 'Insufficient funds'], 400);
    }

    $transferDetails = DB::transaction(function () use ($sender, $senderAccount, $recipientAccount, $validated) {
        // Debit sender
        $senderAccount->decrement('balance', $validated['amount']);
        $senderTransaction = $senderAccount->transactions()->create([
            'amount' => $validated['amount'],
            'type' => 'debit',
            'status' => 'completed',
            'description' => $validated['description'] ?? NULL,
            'software_description' => 'Transfer to ' . $recipientAccount->account_number,
            'recipient_account_id' => $recipientAccount->id,
            'reference' => 'DB-TRF' . now()->timestamp,
            'completed_at' => now()
        ]);

        // Credit recipient
        $recipientAccount->increment('balance', $validated['amount']);
        $recipientTransaction = $recipientAccount->transactions()->create([
            'amount' => $validated['amount'],
            'type' => 'credit',
            'status' => 'completed',
            'description' => $validated['description'] ?? NULL,
            'software_description' => 'Transfer from ' . $senderAccount->account_number,
            'recipient_account_id' => $senderAccount->id,
            'reference' => 'CR-TRF' . now()->timestamp,
            'completed_at' => now()
        ]);
 
        // Notifications 
        $sender->notifications()->create([
            'title' => 'Transfer Completed',
            'message' => 'You transferred $' . $validated['amount'] . ' to ' . $recipientAccount->account_number,
            'type' => 'transfer'
        ]);

        $recipientAccount->user->notifications()->create([
            'title' => 'Funds Received',
            'message' => 'You received $' . $validated['amount'] . ' from ' . $senderAccount->account_number,
            'type' => 'transfer'
        ]);

        return [
            'amount' => $validated['amount'],
            'recipient_name' => $recipientAccount->user->name,
            'recipient_account' => $recipientAccount->account_number,
            'reference' => $senderTransaction->reference,
            'date_time' => now()->format('Y-m-d H:i:s')
        ];
    });

    return response()->json([
        'message' => 'Transfer successful',
        'data' => $transferDetails
    ]);
    }
    
    
    
    
    
}
}
