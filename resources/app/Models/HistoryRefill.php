<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class HistoryRefill extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public static function search($search)
    {
        $src = trim($search);
        return empty($src) ? static::query()
            : static::query()->where([['id', 'like', '%' . $src . '%'], ['user_id', Auth::user()->id]])
            ->orWhere('trxid', 'like', '%' . $src . '%')
            ->orWhere('layanan', 'like', '%' . $src . '%')
            ->orWhere('target', 'like', '%' . $src . '%')
            ->orWhere('quantity', 'like', '%' . $src . '%')
            ->orWhere('price', 'like', '%' . $src . '%')
            ->orWhere('start_count', 'like', '%' . $src . '%')
            ->orWhere('remains', 'like', '%' . $src . '%')
            ->orWhere('refill', 'like', '%' . $src . '%')
            ->orWhere('status', 'like', '%' . $src . '%')
            ->orWhere('created_at', 'like', '%' . $src . '%')
            ->orWhere('updated_at', 'like', '%' . $src . '%');
    }
    // class where userid
    public function scopeUser($query)
    {
        return $query->where('user_id', Auth::user()->id);
    }
}
