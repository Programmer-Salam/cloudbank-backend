<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ForgotPasswordOtpNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     */
      public $otp;

    public function __construct($otp)
    {
        $this->otp = $otp;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
     public function via($notifiable)
    {
        return ['mail'];
    }

   public function toMail($notifiable)
{
    return (new MailMessage)
        ->subject('CloudBank - Password Reset Verification')
        ->view('emails.otp-forgot-verification', [
            'otp' => $this->otp,
            'notifiable' => $notifiable
        ]);
}

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}







