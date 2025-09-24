<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Transaction;

class AccountController extends Controller
{
 public function dashboard()
{
    try {
        $user = Auth::user();
        $account = $user->account;

        return response()->json([
            'user' => $user,
            'balance' => $account?->balance ?? null,
            'recent_transactions' => $account?->transactions()
                ?->latest()
                ->take(5)
                ->get() ?? [],
            'notifications' => $user->notifications()
                ->where('is_read', false)
                ->latest()
                ->get()
        ]);

    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Something went wrong',
            'error' => $e->getMessage(),
            'line' => $e->getLine(),
            'file' => $e->getFile()
        ], 500);
    }
}




public function transactions(Request $request)
{
    $user = Auth::user();
    // Log::info('Authenticated User ID: ' . $user->id);

    // Get user's account
    $account = $user->account;
    if (!$account) {
        Log::error('No account found for user ID: ' . $user->id);
        return response()->json(['message' => 'No account found for user'], 404);
    }

// Build your query first (DON'T call get() yet)
$query = Transaction::with(['account.user', 'recipientAccount.user'])
    ->where(function ($q) use ($account) {
        $q->where('account_id', $account->id)
          ->orWhere('recipient_account_id', $account->id);
    });

if ($request->filled('type')) {
    $query->where('type', $request->type);
}

if ($request->filled('status')) {
    $query->where('status', $request->status);
}

if ($request->filled('reference')) {
    $query->where('reference', $request->reference);
}

if ($request->filled('start_date') && $request->filled('end_date')) {
    try {
        $start = Carbon::parse($request->start_date)->startOfDay();
        $end = Carbon::parse($request->end_date)->endOfDay();
        
        $query->whereBetween('created_at', [$start, $end]);
    } catch (\Exception $e) {
        // Handle invalid date format
        return response()->json([
            'error' => 'Invalid date format. Use YYYY-MM-DD'
        ], 400);
    }
}



// Then execute (comment out the dd() when done debugging)
$transactions = $query->get();

    // Log::info('Found ' . $transactions->count() . ' transactions');

    // Transform data
    $data = $transactions->map(function ($txn) use ($account) {
        $isSender = $txn->account_id === $account->id;

        $otherUser = $isSender
            ? optional($txn->recipientAccount)->user
            : optional($txn->account)->user;

        $action = $isSender ? 'Transfer to' : 'Fund received from';
        $otherName = $otherUser ? $otherUser->name : 'Unknown';

       return [
    'amount' => $txn->amount,
    'type' => $txn->type,
    'status' => $txn->status,
    'description' => $txn->description,
    'software_description' => $txn->software_description,
    'reference' => $txn->reference,
    'completed_at' => $txn->completed_at,
    'other_party_user' => $otherUser ? [
        'name' => $otherUser->name,
        'email' => $otherUser->email,
        'account_number' => $isSender
            ? optional($txn->recipientAccount)->account_number
            : optional($txn->account)->account_number,
    ] : null,
    'summary' => $txn->admin_id 
        ? 'Transfer from admin to ' . $otherName
        : $action . ' ' . $otherName
];
    });

    return response()->json([
        'message' => 'Transactions retrieved successfully',
        'data' => $data
    ]);
}


}
