<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Notification;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $fillable = ['name', 'email', 'password', 'err_msg', 'is_verified', 'state', 'dob', 'address','phone_number','city', 'is_active', 'verification_otp', 'otp_expires_at', 'is_admin', 'pin', 'transact'];
    
     
    protected $hidden = ['password', 'remember_token', 'pin'];

    public function account()
    {
        return $this->hasOne(Account::class);
    }

    public function transactions()
    {
        return $this->hasManyThrough(Transaction::class, Account::class);
    }

    /**
 * @return \Illuminate\Database\Eloquent\Relations\HasMany
 */
    public function notifications()
    {
        return $this->hasMany(Notification::class);
    }

    public function supportTickets()
{
    return $this->hasMany(SupportTicket::class);
}

public function loginAttempts()
{
    return $this->hasMany(LoginAttempt::class);
}
}
