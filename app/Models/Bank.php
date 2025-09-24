<?php

// app/Models/Bank.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    protected $fillable = [
        'name', 
        'code',
        'message',
        'is_active'
    ];

    protected $casts = [
        'is_active' => 'boolean'
    ];

    // Scope for active banks
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}