<?php

namespace App\Http\Controllers;

use App\Models\Faq;
use App\Models\User;
use App\Models\Banner;
use App\Models\Bank;
use App\Models\Account;
use App\Models\Document;
use App\Models\Transaction;
use App\Models\LoginAttempt;
use Illuminate\Http\Request;
use App\Models\SupportTicket;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\Notification;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
  public function index()
{
    // Check if user is not admin
    if (!Auth::user()->is_admin) {
        return response()->json([
            'message' => 'User must be an Admin! Please login as an admin'
        ], 403); // Added 403 Forbidden status code
    }

    $notifications = Notification::with(['user:id,name,created_at,updated_at'])
        ->where('type', 'register')
        ->latest()
        ->paginate(10);

    $activities = Notification::with(['user:id,name,created_at,updated_at'])
        ->where('type', 'transfer')
        ->latest()
        ->paginate(10);

    return response()->json([
        'notifications' => $notifications,
        'activities' => $activities
    ]);
}

    public function markAsRead(Notification $notification)
    {
     // Check if the authenticated user owns this notification
  if (!Auth::user()->is_admin) {
        return response()->json([
            'message' => 'User must be an Admin! Please login as an admin'
        ], 403); // Added 403 Forbidden status code
    }

    $notification->update(['is_read' => true]);

    return response()->json(['message' => 'Notification marked as read']);
    }
    
    
    
     public function setPin(Request $request)
    {
        try{
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
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
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
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
    
    public function users()
    {
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
        return response()->json(User::where('is_admin', 0)->with('account')->latest()->get());
    } 

    public function manageUser(Request $request, User $user)
    {
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
        $validated = $request->validate([
            'action' => 'required|in:verify,suspend,delete',
        ]);

        switch ($validated['action']) {
            case 'verify':
                $user->update(['is_verified' => true]);
                break;
            case 'suspend':
                $user->update(['is_active' => !$user->is_active]);
                break;
            case 'delete':
                $user->delete();
                break;
        }

        return response()->json(['message' => 'Action completed']);
    }

   public function creditUser(Request $request, User $user)
{
     if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
     
    try {
         $validated = $request->validate([
        'amount' => 'required|numeric|min:0.01',
        'description' => 'nullable|string|max:255',
        'pin' => 'required|digits:4'
    ]);

    $admin = auth()->user();

    // Check if PIN is locked
    if ($admin->pin_locked_at && $admin->pin_locked_at->addMinutes(5)->isFuture()) {
        return response()->json([
            'message' => 'PIN locked. Try again after ' 
                . $admin->pin_locked_at->addMinutes(5)->diffForHumans()
        ], 423); // 423 = Locked status code
    }

    // Verify PIN
    if (!Hash::check($request->pin, $admin->pin)) {
        
        $admin->increment('pin_attempts');
        
        if ($admin->pin_attempts >= 3) {
            $admin->update([
                'pin_locked_at' => now(),
                'pin_attempts' => 0
            ]);
            
            return response()->json([
                'message' => 'Too many failed attempts. PIN locked for 5 minutes.'
            ], 423);
        }
        
        return response()->json([
            'message' => 'Invalid PIN. Attempts left: ' . (3 - $admin->pin_attempts)
        ], 401);
    }

    // Reset attempts on success
    $admin->update(['pin_attempts' => 0]);

    DB::transaction(function () use ($user, $validated) {
     
            $account = $user->account;

            if (!$account) {
                throw new \Exception('User has no account.');
            }

            $account->increment('balance', $validated['amount']);

            $account->transactions()->create([
                'amount' => $validated['amount'],
                'type' => 'credit',
                'status' => 'completed',
                'description' => $validated['description'] ?? NULL,
                  'software_description' => 'Transfer from Admin',
                'reference' => 'cloudbank' . now()->timestamp,
                'admin_id' => Auth::id(),
                'completed_at' => now()
            ]);

            $user->notifications()->create([
                'title' => 'Account Credited From Admin',
                'message' => 'Your account has been credited with $' . $validated['amount'],
                'type' => 'admin'
            ]);
        });

        return response()->json(['message' => 'Account credited successfully']);

    } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Something went wrong',
            'error' => $e->getMessage(),
            'line' => $e->getLine(),
            'file' => $e->getFile()
        ], 500);
    }
}


    public function transactions()
    {
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
        return response()->json(Transaction::with(['account.user'])->latest()->paginate(15));
    }

    public function analytics()
    {
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
        return response()->json([
            'total_users' => User::count(),
            'active_users' => User::where('is_active', true)->count(),
            'verified_users' => User::where('is_verified', true)->count(),
            'daily_transactions' => Transaction::whereDate('created_at', today())->count(),
            'total_balance' => Account::sum('balance'),
        ]);
    }

    //  public function flaggedActivities()
    // {
    //     return response()->json([
    //         'suspicious_logins' => LoginAttempt::where('successful', false)
    //             ->where('created_at', '>', now()->subDays(7))
    //             ->with('user')
    //             ->get(),
    //         'flagged_transactions' => Transaction::where('status', 'failed')
    //             ->orWhere('amount', '>', 10000) // Example threshold
    //             ->with(['account.user'])
    //             ->latest()
    //             ->get()
    //     ]);
    // }
    public function flaggedActivities()
{
     if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
    return response()->json([
        'suspicious_logins' => LoginAttempt::where('successful', false)
            ->where('created_at', '>', now()->subDays(7))
            ->with('user')
            ->get(),
        'flagged_transactions' => Transaction::where('status', 'failed')
            ->orWhere('amount', '>', 10000) // Example threshold
            ->with(['account.user'])
            ->latest()
            ->get()
    ]);
}

    public function manageTickets()
    {
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
        return response()->json(SupportTicket::with(['user'])
            ->latest()
            ->paginate(15));
    }

    public function respondToTicket(Request $request, SupportTicket $ticket)
    {
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
        $validated = $request->validate(['response' => 'required|string']);

        $ticket->update([
            'response' => $validated['response'],
            'status' => 'resolved',
            'admin_id' => Auth::id()
        ]);

        return response()->json(['message' => 'Response submitted']);
    }

public function updatePassword(Request $request)
{
    if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
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

   public function manageFaqs(Request $request)
{
   if (empty(Auth::user()->is_admin) || $request->isMethod('get')) {
  return response()->json(Faq::orderBy('order')->get());
}

    if ($request->isMethod('post')) {
        $validated = $request->validate([
            'question' => 'required|string',
            'answer' => 'required|string',
        ]);
        Faq::create($validated);
        return response()->json(['message' => 'FAQ added']);
    }

    if ($request->isMethod('put')) {
        $validated = $request->validate([
            'id' => 'required|exists:faqs,id',
            'question' => 'required|string',
            'answer' => 'required|string',
        ]);

        $faq = Faq::find($validated['id']);
        $faq->update([
            'question' => $validated['question'],
            'answer' => $validated['answer'],
        ]);

        return response()->json(['message' => 'FAQ updated']);
    }

    if ($request->isMethod('delete')) {
        $request->validate([
            'id' => 'required|exists:faqs,id',
        ]);

        Faq::destroy($request->id);
        return response()->json(['message' => 'FAQ deleted']);
    }

  
}


    public function manageBanners(Request $request)
    {
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
        if ($request->isMethod('post')) {
            $validated = $request->validate([
                'title' => 'required|string',
                'content' => 'required|string',
                'is_active' => 'boolean'
            ]);
            Banner::create($validated);
            return response()->json(['message' => 'Banner added']);
        }
        return response()->json(Banner::orderBy('order')->get());
    }
    
    
public function dashboard(Request $request)
{
    $admin = Auth::user();
    
    if (!$admin->is_admin) {
        return response()->json(['message' => 'Unauthorized access'], 403);
    }

    // Get admin's own transactions
    $transactions = Transaction::where('admin_id', $admin->id)
        ->orWhereHas('account', function($q) use ($admin) {
            $q->where('user_id', $admin->id);
        })
        ->with(['account.user:id,name', 'recipientAccount.user:id,name'])
        ->latest()
        ->take(10)
        ->get();

    // Get admin notifications
    // $notifications = $admin->notifications()
    //     ->latest()
    //     ->take(10)
    //     ->get();

    // Get security alerts (failed logins, flagged transactions)
    $securityAlerts = [
        'failed_logins' => LoginAttempt::where('successful', false)
            ->where('created_at', '>', now()->subDays(7))
            ->with('user:id,name,email')
            ->latest()
            ->take(5)
            ->get(),
            
        'flagged_transactions' => Transaction::where('status', 'flagged')
            ->with(['account.user:id,name', 'admin:id,name'])
            ->latest()
            ->take(5)
            ->get(),
            
        'new_users' => User::where('created_at', '>', now()->subDays(7))
            // ->where('is_verified', false)
            ->select(['id', 'name', 'email', 'created_at'])
            ->latest()
            ->take(5)
            ->get()
    ];

    return response()->json([
        'admin' => [
            'id' => $admin->id,
            'name' => $admin->name,
            'email' => $admin->email
        ],
        'transactions' => $transactions->map(function ($tx) {
            return [
                'id' => $tx->id,
                'amount' => $tx->amount,
                'type' => $tx->type,
                'status' => $tx->status,
                'reference' => $tx->reference,
                'date' => $tx->created_at->format('Y-m-d H:i'),
                'counterparty' => $tx->type === 'credit' 
                    ? $tx->account->user->name 
                    : ($tx->recipientAccount ? $tx->recipientAccount->user->name : 'System')
            ];
        }),
        // 'notifications' => $notifications,
        'security_alerts' => $securityAlerts,
        'stats' => [
            'total_transactions_today' => Transaction::whereDate('created_at', today())->count(),
            'pending_actions' => [
                'unverified_users' => User::where('is_verified', false)->count(),
                'flagged_transactions' => Transaction::where('status', 'flagged')->count()
            ]
        ]
    ]);
}
    
  
   public function documentsByStatus($status = null)
{
    if (Auth::user()->is_admin == '0') {
        return response()->json(['message' => 'User must be an Admin! Please login as an admin'], 403);
    }

    $query = Document::with('user');

    if (filled($status)) {
        $query->whereRaw('LOWER(status) = ?', [strtolower($status)]);
    }

    $documents = $query->get()->map(function ($doc) {
        return [
            'id' => $doc->id,
            'title' => $doc->title,
            'document' => $doc->document,
            'status' => $doc->status,
            'user_name' => $doc->user->name ?? 'Unknown',
            'created_at' => $doc->created_at,
            'updated_at' => $doc->updated_at
        ];
    });

    return response()->json($documents);
}


  
    public function updateStatus(Document $document, Request $request)
    {
    
         if(Auth::user()->is_admin == '0'){
               return response()->json(['message' => 'User must be an Admin! Please login as an admin ']);
      }
      try{
          
      
        $request->validate([
            'status' => 'required|in:approved,rejected'
        ]);

        $document->update(['status' => $request->status]);

        return response()->json([
            'message' => 'Status updated',
            'data' => $document
            ]);
      } catch (\Throwable $e) {
        return response()->json([
            'message' => 'Updating document not successful',
            'error' => $e->getMessage()
            // 'trace' => $e->getTrace(),   // Optional: full stack trace
        ], 500);
    }
    }
    
  public function setUsermsg(Request $request)
{
    // Verify admin privileges
    if (!auth()->user()->is_admin) {
        return response()->json([
            'message' => 'Unauthorized. Only admins can perform this action.'
        ], 403);
    }

    // Handle GET request - Fetch messages
    if ($request->isMethod('get')) {
        $userMessages = User::where('is_admin', false)
            ->select(['id', 'name', 'err_msg'])
            ->get();
            
        return response()->json($userMessages);
    }

    // Handle POST request - Update message
    $validated = $request->validate([
        'user_id' => 'required|integer|exists:users,id',
        'message' => 'required|string|max:255'
    ]);

    try {
        $user = User::where('id', $validated['user_id'])
            ->where('is_admin', false)
            ->firstOrFail();

        $user->update([
            'err_msg' => $validated['message']
        ]);

        return response()->json([
            'message' => 'User message updated successfully',
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'err_msg' => $user->err_msg
            ]
        ]);

    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Failed to update user message',
            'error' => $e->getMessage()
        ], 500);
    }
}


  public function setUserTransact(Request $request)
{
    // Verify admin privileges
    if (!auth()->user()->is_admin) {
        return response()->json([
            'message' => 'Unauthorized. Only admins can perform this action.'
        ], 403);
    }

    // Handle GET request - Fetch messages
    if ($request->isMethod('get')) {
        $userMessages = User::where('is_admin', false)
            ->select(['id', 'name', 'email', 'transact'])
            ->get();
            
        return response()->json($userMessages);
    }

    // Handle POST request - Update message
    $validated = $request->validate([
        'user_id' => 'required|integer|exists:users,id',
        'status' => 'required|string|max:255'
    ]);

    try {
        $user = User::where('id', $validated['user_id'])
            ->where('is_admin', false)
            ->firstOrFail();

        $user->update([
            'transact' => $validated['status']
        ]);

        return response()->json([
            'message' => 'User transact updated successfully',
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'transact' => $user->transact
            ]
        ]);

    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Failed to update user message',
            'error' => $e->getMessage()
        ], 500);
    }
}
    
    // bank
    //   public function getbanks()
    // {
    //     return response()->json(Bank::latest()->get());
    // }

    // Create new bank
    // public function storeBank(Request $request)
    // {
    //     $validated = $request->validate([
    //         'name' => 'required|string|max:255',
    //         'code' => 'required|string|max:10|unique:banks',
    //         'message' => 'nullable|string',
    //         'is_active' => 'boolean'
    //     ]);

    //     $bank = Bank::create($validated);

    //     return response()->json([
    //         'message' => 'Bank created successfully',
    //         'bank' => $bank
    //     ], 201);
    // }

    // Toggle bank status
    // public function toggleStatus(Bank $bank)
    // {
    //     $bank->update(['is_active' => !$bank->is_active]);

    //     return response()->json([
    //         'message' => 'Bank status updated',
    //         'is_active' => $bank->is_active
    //     ]);
    // }
}
