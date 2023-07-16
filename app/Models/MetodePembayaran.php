<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MetodePembayaran extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public static function search($search)
    {
        $src = trim($search);
        return empty($src) ? static::query()
            : static::query()->where([['id', 'like', '%' . $src . '%']])
            ->orWhere('type', 'like', '%' . $src . '%')
            ->orWhere('kategori', 'like', '%' . $src . '%')
            ->orWhere('jumlah', 'like', '%' . $src . '%')
            ->orWhere('before_balance', 'like', '%' . $src . '%')
            ->orWhere('after_balance', 'like', '%' . $src . '%')
            ->orWhere('description', 'like', '%' . $src . '%');
    }
}
