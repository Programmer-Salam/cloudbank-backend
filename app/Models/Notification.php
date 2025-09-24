<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
// use DB;
class Notification extends Model
{
    protected $fillable = ['user_id', 'title', 'message', 'is_read', 'type'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
//     public function senderAccount()
// {
//     // Assuming account number is in the message like "CB1750493410256"
//     // Extract the account number and find the matching account
//     return $this->hasOne(Account::class, 'account_number', 
//         DB::raw("SUBSTRING_INDEX(SUBSTRING_INDEX(message, ' ', -2), ' ', 1)"));
// }

}
