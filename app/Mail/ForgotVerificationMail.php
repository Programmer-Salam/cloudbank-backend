<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ForgotVerificationMail extends Mailable
{
    use Queueable, SerializesModels;

    public $otp;

    public function __construct($otp)
    {
        $this->otp = $otp;
    }

    public function build()
    {
        return $this->subject('CloudBank - Password Reset Verification')
                    ->view('emails.otp-forgot-verification')
                    ->with([
                        'otp' => $this->otp
                    ]);
    }
}
