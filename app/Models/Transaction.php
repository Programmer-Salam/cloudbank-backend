<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = [
        'account_id', 'amount', 'type', 'status',
        'description', 'reference', 'admin_id', 'completed_at', 'software_description'
    ];

    public function account()
    {
        return $this->belongsTo(Account::class);
    }

    public function admin()
    {
        return $this->belongsTo(User::class, 'admin_id');
    }
    
    public function recipientAccount()
{
    return $this->belongsTo(Account::class, 'recipient_account_id');
}
}
