<?php

namespace App\Http\Livewire;

use App\Models\LogMasuk;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class LogLoginTable extends Component
{
    public $search;
    public $perPage = 10;
    public function render()
    {
        $log = LogMasuk::search($this->search)->where('user_id', Auth::user()->id)->orderBy('id', 'desc')
            ->where('user_id', Auth::user()->id)
            ->Paginate($this->perPage);
        return view('livewire.log-login-table', compact('log'));
    }
}
