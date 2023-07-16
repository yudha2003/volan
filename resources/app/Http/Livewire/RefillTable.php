<?php

namespace App\Http\Livewire;

use App\Models\History;
use App\Models\HistoryRefill;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\Livewire;
use Livewire\WithPagination;

class RefillTable extends Component
{
    public $perPage = 10;
    public $search = '';
    public $status = false;
    // handle event click with value
    public function pending()
    {
        $this->status = 'pending';
    }
    public function all()
    {
        $this->status = false;
    }
    public function processing()
    {
        $this->status = 'process';
    }
    public function error()
    {
        $this->status = 'error';
    }
    public function success()
    {
        $this->status = 'done';
    }
    public function partial()
    {
        $this->status = 'partial';
    }

    // public $history = '';
    use WithPagination;

    public function render()
    {
        // history search where status
        $refill = HistoryRefill::search($this->search)->where('status', 'like', '%' . $this->status . '%')
            ->where('user_id', Auth::user()->id)
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.refill-table', compact('refill'));
    }
}
