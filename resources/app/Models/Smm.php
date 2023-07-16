<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Smm extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    protected $table = 'smm';
    public static function search($search)
    {
        $src = $search;
        return empty($src) ? static::query()
            : static::query()->where([['id', 'like', '%' . $src . '%']])
            ->orWhere('service', 'like', '%' . $src . '%')
            ->orWhere('category', 'like', '%' . $src . '%')
            ->orWhere('name', 'like', '%' . $src . '%')
            ->orWhere('price', 'like', '%' . $src . '%')
            ->orWhere('min', 'like', '%' . $src . '%')
            ->orWhere('max', 'like', '%' . $src . '%')
            ->orWhere('type', 'like', '%' . $src . '%')
            ->orWhere('refill', 'like', '%' . $src . '%')
            ->orWhere('created_at', 'like', '%' . $src . '%')
            ->orWhere('updated_at', 'like', '%' . $src . '%');
    }
}
