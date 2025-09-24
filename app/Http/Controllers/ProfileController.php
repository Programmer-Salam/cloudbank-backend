<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Hash;
use App\Models\Document;
use App\Models\Account;
class ProfileController extends Controller
{
    //
    public function verifyAccount($accountNumber)
{
    try {
        // Validate account number format
        if (!preg_match('/^[A-Za-z0-9]{10,20}$/', $accountNumber)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid account number format'
            ], 400);
        }

        $account = Account::with('user:id,name')
                    ->where('account_number', $accountNumber)
                    ->first();

        if (!$account) {
            return response()->json([
                'success' => false,
                'message' => 'Account not found'
            ], 404);
        }

        // Mask name for privacy (show first letter and last name)
        $nameParts = explode(' ', $account->user->name);
        $maskedName = count($nameParts) > 1 
            ? substr($nameParts[0], 0, 1) . '. ' . end($nameParts)
            : $account->user->name;

        return response()->json([
            'success' => true,
            'account' => [
                'number' => $account->account_number,
                'name' => $maskedName,
                'full_name' => $account->user->name, // Only for debugging/development
                'is_verified' => $account->user->is_verified
            ]
        ]);

    } catch (\Exception $e) {
        return response()->json([
            'success' => false,
            'message' => 'Verification failed',
            'error' => $e->getMessage()
        ], 500);
    }
}

    public function checkPIN(Request $request){
        if(Auth::user()->pin != NULL){
                    return response()->json(['message' => 'User has set PIN'], 200);
        }
        return response()->json(['message' => 'User hasn\'t set PIN'], 400);
    }
    
public function checkDOCUMENT(Request $request)
{
    $doc = Document::where('user_id', Auth::id())->first();

    if ($doc) {
        return response()->json(['message' => 'User has set DOCUMENT'], 200);
    }

    return response()->json(['message' => 'User hasn\'t set DOCUMENT'], 400);
}

  public function update(Request $request)
{

    try {
        $user = Auth::user();

        $validated = $request->validate([
            'name' => 'sometimes|string|max:255',
            'email' => 'sometimes|email|unique:users,email,' . $user->id,
            'current_password' => 'required_with:password',
            'password' => 'sometimes|min:8|confirmed',
        ]);

        if ($request->has('password')) {
            if (!Hash::check($validated['current_password'], $user->password)) {
                return response()->json(['message' => 'Current password is incorrect'], 400);
            }

            $validated['password'] = bcrypt($validated['password']);
        }

        $user->update($validated);

        return response()->json(['message' => 'Profile updated successfully']);

    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Something went wrong',
            'error' => $e->getMessage(),
            // 'line' => $e->getLine(),
            // 'file' => $e->getFile()
        ], 500);
    }
}


  public function setPin(Request $request)
    {
        try{
        if(Auth::user()->is_admin == '1'){
               return response()->json(['message' => 'You must be a User! Please login as an user ']);
      }
        $request->validate([
            'pin' => 'required|digits:4|confirmed',
        ]);

        auth()->user()->update([
            'pin' => bcrypt($request->pin)
        ]);

        return response()->json(['message' => 'PIN set successfully']);
        
        } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Something went wrong',
            'error' => $e->getMessage(),
            'line' => $e->getLine(),
            'file' => $e->getFile()
        ], 500);
    }
    }


    public function updatePin(Request $request)
    {
         if(Auth::user()->is_admin == '1'){
               return response()->json(['message' => 'You must be a User! Please login as an user ']);
      }
        $request->validate([
            'current_pin' => 'required|digits:4',
            'new_pin' => 'required|digits:4|confirmed',
        ]);

        if (!Hash::check($request->current_pin, auth()->user()->pin)) {
            return response()->json(['message' => 'Incorrect current PIN'], 401);
        }

        auth()->user()->update([
            'pin' => bcrypt($request->new_pin)
        ]);

        return response()->json(['message' => 'PIN updated successfully']);
    }

}
