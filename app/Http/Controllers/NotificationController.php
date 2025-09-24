<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function index()
    {
        $notification = Notification::where('user_id', Auth::id())->latest()->get();
        return response()->json($notification);
    }

    public function markAsRead(Notification $notification)
    {
     // Check if the authenticated user owns this notification
    if ($notification->user_id != Auth::id()) {
        return response()->json(['message' => 'Unauthorized, You`re not the owner of the notification, Thereby you can`t mark as read'], 403);
    }

    $notification->update(['is_read' => true]);

    return response()->json(['message' => 'Notification marked as read']);
    }
}
