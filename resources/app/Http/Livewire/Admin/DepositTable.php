<?php

namespace App\Http\Livewire\Admin;

use App\Models\Deposit;
use App\Models\LogBalance;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\WithPagination;

class DepositTable extends Component
{
    public $perPage = 10;
    public $search = '';
    public $status = false;
    public $type = false;
    public $delete_id;
    public $deposit_id;
    protected $listeners = ['ubahStatus' => 'ubahStatuss', 'konfirmasi' => 'confirm'];
    use WithPagination;
    public $paginationTheme = 'bootstrap';
    public function pending()
    {
        $this->status = 'pending';
        $this->type = false;
    }
    public function all()
    {
        $this->status = false;
        $this->type = false;
    }
    public function canceled()
    {
        $this->status = 'canceled';
        $this->type = false;
    }
    public function error()
    {
        $this->status = 'error';
        $this->type = false;
    }
    public function success()
    {
        $this->status = 'done';
        $this->type = false;
    }
    public function otomatis()
    {
        $this->type = 'auto';
        $this->status = false;
    }
    public function manual()
    {
        $this->type = 'manual';
        $this->status = false;
    }
    public function ubahStatus($status, $id)
    {
        $deposit = Deposit::find($id);
        if ($deposit) {
            $this->dispatchBrowserEvent('swal:confirm', [
                'type' => 'warning',
                'title' => 'Apakah anda yakin?',
                'text' => 'Status deposit akan diubah',
                'status' => $status,
                'id' => $id
            ]);
        } else {
            $this->dispatchBrowserEvent('swal:modal', [
                'type' => 'error',
                'title' => 'Gagal',
                'text' => 'Status deposit gagal diubah'
            ]);
        }
    }
    public function ubahStatuss($status, $id)
    {
        $deposit = Deposit::where('id', $id)->first();
        if ($deposit) {
            $deposit->update([
                'status' => $status
            ]);
            if ($status == 'done') {
                $user = User::find($deposit->user_id);
                if ($user) {
                    $total = $user->balance + $deposit->diterima;
                    LogBalance::create([
                        'user_id' => $user->id,
                        'type' => 'debit',
                        'kategori' => 'deposit',
                        'jumlah' => $deposit->diterima,
                        'before_balance' => $user->balance,
                        'after_balance' => $total,
                        'description' => 'Deposit saldo berhasil via ' . $deposit->code . ' ' . $deposit->name_payment . ' Sebesar Rp ' . number_format($deposit->diterima, 0, ',', '.') . ''
                    ]);
                    // number format
                    $user->balance = $user->balance + $deposit->diterima;
                    $user->save();
                }
            }
            $this->dispatchBrowserEvent('swal:modal', [
                'type' => 'success',
                'title' => 'Berhasil',
                'text' => 'Status deposit berhasil diubah'
            ]);
        } else {
            $this->dispatchBrowserEvent('swal:modal', [
                'type' => 'error',
                'title' => 'Gagal',
                'text' => 'Status deposit gagal diubah'
            ]);
        }
    }
    public function konfirmasi($id)
    {
        $this->deposit_id = $id;
        $this->dispatchBrowserEvent('show-confirmation');
    }
    public function confirm()
    {
        $deposit = Deposit::where('id', $this->deposit_id)->first();
        if ($deposit) {
            $deposit->update([
                'status' => 'done'
            ]);
            $user = User::where('id', $deposit->user_id)->first();
            $user->balance = $user->balance + $deposit->amount;
            $user->save();
            LogBalance::create([
                'user_id' => $user->id,
                'type' => 'Debit',
                'kategori' => 'deposit',
                'jumlah' => $deposit->amount,
                'before_balance' => $user->balance - $deposit->amount,
                'after_balance' => $user->balance,
                'description' => 'Deposit saldo berhasil via ' . $deposit->code . ' ' . $deposit->name_payment
            ]);
            $this->dispatchBrowserEvent('layananConfirm');
        } else {
            $this->dispatchBrowserEvent('failedConfirm');
        }
    }

    public function render()
    {
        $history = Deposit::search($this->search)->with('user')->where('status', 'like', '%' . $this->status . '%')
            ->orderBy('id', 'desc')
            ->where('process', 'like', '%' . $this->type . '%')
            ->Paginate($this->perPage);
        return view('livewire.admin.deposit-table', [
            'history' => $history
        ]);
    }
}
