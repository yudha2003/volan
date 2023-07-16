<?php

namespace App\Http\Livewire\Admin;

use App\Models\History;
use App\Models\LogBalance;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\Livewire;
use Livewire\WithPagination;

class HistoryTable extends Component
{
    public $perPage = 10;
    public $search = '';
    public $status = false;
    // handle event click with value
    public $listeners = ['konfirmasi', 'confirm', 'refund', 'refunds'];
    use WithPagination;
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

    public function konfirmasi($id)
    {
        $this->dispatchBrowserEvent('show-confirmation', ['id' => $id, 'text' => 'Apakah anda yakin ingin mengkonfirmasi transaksi ini?']);
    }
    public function confirm($id)
    {
        $history = History::find($id);
        $history->status = 'done';
        $history->save();
        $this->dispatchBrowserEvent('success', ['message' => 'Konfirmasi Berhasil']);
    }
    public function refund($id)
    {
        $this->dispatchBrowserEvent('show-confirmations', ['id' => $id, 'text' => 'Apakah anda yakin ingin merefund transaksi ini?']);
    }
    public function refunds($id)
    {
        $history = History::find($id);
        $history->status = 'error';
        $history->save();
        $user = User::find($history->user_id);
        $data = [
            'user_id' => Auth::user()->id,
            'type' => 'Debit',
            'kategori' => 'order',
            'jumlah' => $history->price,
            'before_balance' => $user->balance - $history->price,
            'after_balance' => $user->balance,
            'description' => 'Refund Order #' . $history->trxid
        ];
        LogBalance::create($data);
        $user->balance = $user->balance + $history->price;
        $user->omzet = $user->omzet - $history->price;
        $this->dispatchBrowserEvent('success', ['message' => 'Refund Berhasil']);
    }
    public function render()
    {
        // history search where status
        $history = History::search($this->search)->where('status', 'like', '%' . $this->status . '%')
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.admin.history-table', [
            'history' => $history
        ]);
    }
}
