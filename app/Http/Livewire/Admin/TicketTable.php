<?php

namespace App\Http\Livewire\Admin;

use App\Models\Ticket;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\WithPagination;

class TicketTable extends Component
{
    public $perPage = 10;
    public $search = '';
    public $status = false;
    public $ticket_id = false;
    protected $listeners = ['closeTicket' => 'closeTickets'];

    use WithPagination;
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
    public function  closeTicket($id)
    {
        $this->ticket_id = $id;
        $this->dispatchBrowserEvent('show-closed-confirmation');
    }
    public function closeTickets()
    {
        $layanan = Ticket::where('id', $this->ticket_id)->first();
        if ($layanan) {
            $layanan->update([
                'status' => 'closed'
            ]);
            $this->dispatchBrowserEvent('closeTickets');
        } else {
            $this->dispatchBrowserEvent('failedClosed');
        }
    }

    public function render()
    {
        // history search where status
        $history = Ticket::search($this->search)->with('user')->where('status', 'like', '%' . $this->status . '%')
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.admin.ticket-table', compact('history'));
    }
}
