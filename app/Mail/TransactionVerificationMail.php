<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class TransactionVerificationMail extends Mailable
{
    use Queueable, SerializesModels;

    public $user;

    public function __construct($user)
    {
        $this->user = $user;
    }

    public function build()
    {
        return $this->subject('Action required: Transfer Initiation From Dormant Account!')
                    ->view('emails.transfer')
                    ->with([
                        'user' => $this->user,
                    ]);
    }
}

