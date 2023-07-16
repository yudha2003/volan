<?php

namespace App\Http\Livewire;

use App\Models\Deposit;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\WithPagination;

class DepositTable extends Component
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
    public function canceled()
    {
        $this->status = 'canceled';
    }
    public function error()
    {
        $this->status = 'error';
    }
    public function success()
    {
        $this->status = 'done';
    }

    public $delete_id;
    protected $listeners = ['dibatalkan' => 'batalDeposit'];
    public function  dibatalkan($id)
    {
        $this->delete_id = $id;
        $this->dispatchBrowserEvent('show-delete-confirmation');
    }
    public function batalDeposit()
    {
        $layanan = Deposit::where('id', $this->delete_id)->where('user_id', Auth::user()->id)->first();
        if ($layanan) {
            $layanan->update([
                'status' => 'canceled'
            ]);
            $this->dispatchBrowserEvent('layananDeleted');
        } else {
            $this->dispatchBrowserEvent('failedDeleted');
        }
    }
    // public $history = '';
    use WithPagination;

    public function render()
    {
        // history search where status
        $history = Deposit::search($this->search)->where('status', 'like', '%' . $this->status . '%')
            ->where('user_id', Auth::user()->id)
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.deposit-table', [
            'history' => $history
        ]);
    }
}
