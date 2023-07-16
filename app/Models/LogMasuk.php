<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class LogMasuk extends Model
{
    use HasFactory;
    protected $table = 'log_masuk';
    protected $guarded = ['id'];
    public static function search($search)
    {
        $src = trim($search);
        return empty($src) ? static::query()
            : static::query()->where([['id', 'like', '%' . $src . '%'], ['user_id', Auth::user()->id]])
            ->orWhere('ip', 'like', '%' . $src . '%')
            ->orWhere('user_agent', 'like', '%' . $src . '%');
    }
    // class where userid
    public function scopeUser($query)
    {
        return $query->where('user_id', Auth::user()->id);
    }
}
