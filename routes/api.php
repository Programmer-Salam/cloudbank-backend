<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AccountController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SupportController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\NotificationController;
use Illuminate\Support\Facades\DB;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::get('/debug/all-records', function() {
    $tables = DB::select('SHOW TABLES');
    $output = [];
    
    foreach ($tables as $table) {
        $tableName = reset($table);
        $output[$tableName] = DB::table($tableName)->get()->toArray();
    }
    
    return response()->json($output);
});


Route::get('test', function(){
    return 'Api working';
}
);

 Route::get('faqs', [AdminController::class, 'manageFaqs']);

Route::get('/test-mail', function () {
    \Illuminate\Support\Facades\Mail::raw('It works!', function ($message) {
        $message->to('abdulsalambadmus955@gmail.com')
                ->subject('Test Email');
    });
});


Route::prefix('auth')->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('verify-email', [AuthController::class, 'verifyEmail']);
    Route::post('resend-otp', [AuthController::class, 'resendOtp']);
    Route::post('/forgot-password', [AuthController::class, 'sendOtp']);
    Route::post('/reset-password', [AuthController::class, 'resetPasswordWithOtp']);

    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
    
    
});


Route::prefix('profile')->group(function () {
    Route::put('/', [ProfileController::class, 'update'])->middleware('auth:sanctum');
});

Route::prefix('support')->group(function () {
    Route::post('tickets', [SupportController::class, 'createTicket'])->middleware('auth:sanctum');
    Route::get('tickets', [SupportController::class, 'myTickets'])->middleware('auth:sanctum');
});



Route::middleware('auth:sanctum')->group(function () {
    // User routes
    Route::get('/verify-account/{account_number}', [ProfileController::class, 'verifyAccount']);
    Route::get('checkPIN', [ProfileController::class, 'checkPIN']); 
    Route::get('checkDOCUMENT', [ProfileController::class, 'checkDOCUMENT']); 

    Route::get('dashboard', [AccountController::class, 'dashboard']);
    Route::get('transactions', [AccountController::class, 'transactions']);
    Route::post('transfer', [TransactionController::class, 'transfer']);
    
    Route::post('usersetpin', [ProfileController::class, 'setPin']);
    Route::post('userupdatepin', [ProfileController::class, 'updatePin']); 

    // Notification routes
    Route::get('notifications', [NotificationController::class, 'index']);
    Route::post('notifications/{notification}/read', [NotificationController::class, 'markAsRead']);
    
    // Profile updating
    Route::put('/profile/update', [AuthController::class, 'updateProfile']);
    Route::put('/profile/password', [AuthController::class, 'updatePassword']);
    
    // Document
    Route::post('/documents/upload', [AuthController::class, 'upload']);
    Route::get('/mydocuments', [AuthController::class, 'myUploads']);
    
       Route::get('/mytransactstatus', [AuthController::class, 'mytransactstatus']);


    // Admin routes
    Route::prefix('admin')->group(function () {
        
     
        // Route::prefix('banks')->middleware(['auth:sanctum', 'admin'])->group(function () {
        //     Route::get('/', [AdminController::class, 'index']);
        //     Route::post('/', [AdminController::class, 'store']);
        //     Route::put('/{bank}/toggle-status', [AdminController::class, 'toggleStatus']);
        // });
        
        Route::get('notifications', [AdminController::class, 'index']);
    Route::post('notifications/{notification}/read', [AdminController::class, 'markAsRead']);
        
          Route::post('change-password', [AdminController::class, 'updatePassword']);
       
 Route::match(['get', 'post'], 'setusermessage', [AdminController::class, 'setUsermsg']);
 
  Route::match(['get', 'post'], 'setUserTransact', [AdminController::class, 'setUserTransact']);
        
         Route::get('dashboard', [AdminController::class, 'dashboard']);
        Route::post('setpin', [AdminController::class, 'setPin']);
        Route::post('updatepin', [AdminController::class, 'updatePin']);  
        
        
        Route::get('users', [AdminController::class, 'users']);
        Route::post('users/{user}/manage', [AdminController::class, 'manageUser']);
        Route::post('users/{user}/credit', [AdminController::class, 'creditUser']);
        Route::get('transactions', [AdminController::class, 'transactions']);
        Route::get('analytics', [AdminController::class, 'analytics']);

                // Add to admin routes group
        Route::get('flagged-activities', [AdminController::class, 'flaggedActivities']);
        Route::get('suspicious-activities', [AuthController::class, 'checkSuspiciousActivity']); 
        Route::get('tickets', [AdminController::class, 'manageTickets']);
        Route::post('tickets/{ticket}/respond', [AdminController::class, 'respondToTicket']);
        // Route::match(['get', 'post'], 'faqs', [AdminController::class, 'manageFaqs']);
        Route::match(['post', 'put', 'delete'], 'faqs', [AdminController::class, 'manageFaqs']);

        Route::match(['get', 'post'], 'banners', [AdminController::class, 'manageBanners']);
        
        // Document
          Route::get('/documents/{status?}', [AdminController::class, 'documentsByStatus']);

            Route::put('/documents/{document}/status', [AdminController::class, 'updateStatus']);
    });
});
