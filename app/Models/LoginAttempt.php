<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LoginAttempt extends Model
{
    protected $fillable = [
        'user_id',
        'email',
        'ip_address',
        'successful',
        'user_agent'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
