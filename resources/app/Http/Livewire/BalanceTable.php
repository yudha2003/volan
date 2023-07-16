<?php

namespace App\Http\Livewire;

use App\Models\LogBalance;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class BalanceTable extends Component
{
    public $search;
    public $perPage = 10;
    public $type = false;
    public $kategori = false;
    public function all()
    {
        $this->type = false;
        $this->kategori = false;
        return false;
    }
    public function debit()
    {
        $this->type = 'debit';
        $this->kategori = false;
        return true;
    }
    public function credit()
    {
        $this->type = 'kredit';
        $this->kategori = false;
        return true;
    }
    public function order()
    {
        $this->kategori = 'order';
        $this->type = false;
        return true;
    }
    public function deposit()
    {
        $this->kategori = 'deposit';
        $this->type = false;
        return true;
    }
    public function refund()
    {
        $this->kategori = 'refund';
        $this->type = false;
        return true;
    }
    public function render()
    {
        $log = LogBalance::search($this->search)->where('user_id', Auth::user()->id)->orderBy('id', 'desc')
            ->where('user_id', Auth::user()->id)
            ->where('type', $this->type)
            ->where('kategori', $this->kategori)
            ->Paginate($this->perPage);
        return view('livewire.balance-table', compact('log'));
    }
}
