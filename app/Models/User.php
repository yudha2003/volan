<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public static function search($search)
    {
        $src = trim($search);
        return empty($src) ? static::query()
            : static::query()->where([['id', 'like', '%' . $src . '%']])
            ->orWhere('name', 'like', '%' . $src . '%')
            ->orWhere('username', 'like', '%' . $src . '%')
            ->orWhere('email', 'like', '%' . $src . '%')
            ->orWhere('balance', 'like', '%' . $src . '%')
            ->orWhere('omzet', 'like', '%' . $src . '%')
            ->orWhere('role', 'like', '%' . $src . '%')
            ->orWhere('status', 'like', '%' . $src . '%');
    }
}
