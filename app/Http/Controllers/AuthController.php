<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Document;
use App\Models\LoginAttempt;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Mail\WelcomeVerificationMail;
use App\Mail\ForgotVerificationMail;
use App\Mail\EmailVerificationMail;
use App\Mail\ResendVerificationMail;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{

   public function register(Request $request)
{
    try {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'phone_number' => 'nullable|string|max:20|unique:users,phone_number',
            'dob' => 'nullable|date_format:d/m/Y',
            'address' => 'nullable|string|max:255',
            'city' => 'nullable|string|max:100',
            'state' => 'nullable|string|max:100',
        ]);

        if (!empty($validated['dob'])) {
            $validated['dob'] = \Carbon\Carbon::createFromFormat('d/m/Y', $validated['dob'])->format('Y-m-d');
        }

        $validated['password'] = Hash::make($validated['password']);
        $otp = rand(100000, 999999);

        $user = User::create($validated + [
            'verification_otp' => $otp,
            'otp_expires_at' => now()->addMinutes(5),
        ]);

        $user->account()->create([
     'account_number' => substr(str_shuffle(str_repeat('0123456789', 10)), 0, 10),
            'balance' => 0.00
        ]);
        
$user->notifications()->create([
            'title' => 'User Registration',
            'message' => 'New user registration',
            'type' => 'register'
        ]);
        
        Mail::to($user->email)->send(new EmailVerificationMail($otp));

        return response()->json([
            'message' => 'Registration successful. Please check your email for OTP',
            'user' => $user
        ]);
    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Registration not successful',
            'error' => $e->getMessage()
        ], 500);
    }
}

public function mytransactstatus(){
     $user = User::where('id', Auth::id())->first();
  return response()->json([
            'message' => 'User transact',
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'transact' => $user->transact
            ]
        ]);

}

//   public function login(Request $request)
// {
//     try {
//         $request->validate([
//             'email' => 'required|email',
//             'password' => 'required',
//         ]);

//         if (!Auth::attempt($request->only('email', 'password'))) {
//             return response()->json(['message' => 'Invalid credentials'], 401);
//         }

//         $user = User::where('email', $request->email)->first();

//         $user->notifications()->create([
//             'title' => 'Login Notification',
//             'message' => 'You have successfully logged in to your account.',
//             'type' => 'login'
//         ]);

//         return response()->json([
//             'token' => $user->createToken('auth_token')->plainTextToken,
//             'user' => $user
//         ]);

//     } catch (\Throwable $e) {
//         return response()->json([
//             'message' => 'Something went wrong',
//             // 'error' => $e->getMessage(), // For debugging, remove in production
//             // 'trace' => $e->getTrace(),   // Optional: full stack trace
//         ], 500);
//     }
// }

public function login(Request $request)
{
    $credentials = $request->validate([
        'email' => 'required|email',
        'password' => 'required'
    ]);

    // Record login attempt
    $attempt = LoginAttempt::create([
        'email' => $credentials['email'],
        'ip_address' => $request->ip(),
        'user_agent' => $request->userAgent(),
        'successful' => false
    ]);

    if (!Auth::attempt($credentials)) {
        return response()->json(['message' => 'Invalid credentials'], 401);
    }

    // Update attempt as successful if user exists
    $user = User::where('email', $credentials['email'])->first();
    if ($user) {
        $attempt->update([
            'successful' => true,
            'user_id' => $user->id
        ]);

        $user->notifications()->create([
            'title' => 'Login Notification',
            'message' => 'You have successfully logged in to your account.',
            'type' => 'login'
        ]);

        return response()->json([
            'token' => $user->createToken('auth_token')->plainTextToken,
            'user' => $user
        ]);
    }

    return response()->json(['message' => 'Invalid credentials'], 401);
}

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logged out successfully']);
    }

    public function verifyEmail(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'otp' => 'required|digits:6'
    ]);

    $user = User::where('email', $request->email)
                ->where('verification_otp', $request->otp)
                ->where('otp_expires_at', '>', now())
                ->first();

    if (!$user) {
        return response()->json(['message' => 'Invalid OTP or expired'], 400);
    }
        $user->update([
        'is_verified' => true,
        'verification_otp' => null,
        'otp_expires_at' => null
    ]);

Mail::to($user)->send(new WelcomeVerificationMail($user));

    return response()->json([
        'message' => 'Email verified successfully',
        'token' => $user->createToken('auth_token')->plainTextToken
    ]);
    
}

    public function resendOtp(Request $request)
{
    $request->validate(['email' => 'required|email']);

    $user = User::where('email', $request->email)->first();

    if (!$user) {
        return response()->json(['message' => 'User not found'], 404);
    }

    if ($user->is_verified) {
        return response()->json(['message' => 'Email already verified'], 400);
    }
     $otp = rand(100000, 999999);
    $user->update([
        'verification_otp' => $otp,
        'otp_expires_at' => now()->addMinutes(15)
    ]);

    // $user->notify(new EmailVerificationNotification($user->verification_otp));
       Mail::to($user->email)->send(new ResendVerificationMail($otp));

    return response()->json(['message' => 'OTP resent successfully', 'data' => $user ]);
}

public function checkSuspiciousActivity($user)
{
    $recentFailedAttempts = LoginAttempt::where('email', $user->email)
        ->where('successful', false)
        ->where('created_at', '>', now()->subMinutes(30))
        ->count();

    if ($recentFailedAttempts > 3) {
        // Trigger security alert
        $user->notifications()->create([
            'title' => 'Security Alert',
            'message' => 'Multiple failed login attempts detected',
            'type' => 'security'
        ]);
        return true;
    }
    return false;
}

public function sendOtp(Request $request)
{
    try{
    $request->validate([
        'email' => 'required|email|exists:users,email',
    ]);

    $user = User::where('email', $request->email)->first();
$otp = rand(100000, 999999);
    $user->verification_otp = $otp;
    $user->otp_expires_at = now()->addMinutes(5);
    $user->save();

    // $user->notify(new ForgotPasswordOtpNotification($user->verification_otp));
Mail::to($user->email)->send(new ForgotVerificationMail($otp));
    return response()->json([
        'message' => 'Forgot password OTP sent to your email.',
        'data' => $user
        
        ], 200);
    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Otp sending not successful',
            'error' => $e->getMessage()
            // 'trace' => $e->getTrace(),   // Optional: full stack trace
        ], 500);
    }
}

public function resetPasswordWithOtp(Request $request)
{
    try{
    $request->validate([
        'email' => 'required|email',
        'otp' => 'required|digits:6',
        'password' => 'required|string|min:8',
    ]);

    $user = User::where('email', $request->email)
                ->where('verification_otp', $request->otp)
                ->where('otp_expires_at', '>', now())
                ->first();

    if (!$user) {
        return response()->json(['message' => 'Invalid or expired OTP.'], 400);
    }

    $user->password = Hash::make($request->password);
    $user->verification_otp = null;
    $user->otp_expires_at = null;
    $user->save();

    return response()->json(['message' => 'Password has been reset successfully, Go back to Log in.'], 200);
    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Resetting not successful',
            'error' => $e->getMessage()
            // 'trace' => $e->getTrace(),   // Optional: full stack trace
        ], 500);
    }
}


public function updateProfile(Request $request)
{
    try{
    $user = auth()->user();

    $validated = $request->validate([
        'name' => 'sometimes|required|string|max:255',
        'phone_number' => 'nullable|string|max:20',
        'dob' => 'nullable|date_format:d/m/Y',
        'address' => 'nullable|string|max:255',
        'city' => 'nullable|string|max:100',
        'state' => 'nullable|string|max:100',
    ]);

    $user->update($validated);

    return response()->json(['message' => 'Profile updated successfully.'], 200);
    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Updating not successful',
            'error' => $e->getMessage()
            // 'trace' => $e->getTrace(),   // Optional: full stack trace
        ], 500);
    }
}

public function updatePassword(Request $request)
{
    try{
    $request->validate([
        'old_password' => 'required|string',
        'new_password' => 'required|string|min:8|confirmed',
    ]);

    $user = auth()->user();

    if (!Hash::check($request->old_password, $user->password)) {
        return response()->json(['message' => 'Old password is incorrect.'], 422);
    }

    $user->update([
        'password' => Hash::make($request->new_password),
    ]);

    return response()->json(['message' => 'Password updated successfully.'], 200);
    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Password updating not successful',
            'error' => $e->getMessage()
            // 'trace' => $e->getTrace(),   // Optional: full stack trace
        ], 500);
    }
}


 public function upload(Request $request)
    {
        try{
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'document' => 'required|file|mimes:pdf,docx,txt,jpg,png'
        ]);

        $path = $request->file('document')->store('documents', 'public');

        $doc = Document::create([
            'user_id' => auth()->id(),
            'title' => $validated['title'],
            'document' => $path,
        ]);

        return response()->json(['message' => 'Document uploaded', 'data' => $doc], 201);
        } catch (\Exception $e) {
        return response()->json([
            'message' => 'Uploading not successful',
            'error' => $e->getMessage()
            // 'trace' => $e->getTrace(),   // Optional: full stack trace
        ], 500);
    }
    }

  
    public function myUploads()
    {
        $docs = Document::where('user_id', auth()->id())->get();
        return response()->json($docs);
    }

  

}
