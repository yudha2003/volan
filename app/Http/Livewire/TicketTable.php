<?php

namespace App\Http\Livewire;

use App\Models\Ticket;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\WithPagination;

class TicketTable extends Component
{
    public $perPage = 10;
    public $search = '';
    public $status = false;
    // handle event click with value
    public function open()
    {
        $this->status = 'open';
    }
    public function all()
    {
        $this->status = false;
    }
    public function closed()
    {
        $this->status = 'closed';
    }
    // public $history = '';
    use WithPagination;

    public function render()
    {
        // history search where status
        $history = Ticket::search($this->search)->where('status', 'like', '%' . $this->status . '%')
            ->where('user_id', Auth::user()->id)
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.ticket-table', compact('history'));
    }
}
