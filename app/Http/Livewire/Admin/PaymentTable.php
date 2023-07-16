<?php

namespace App\Http\Livewire\Admin;

use App\Models\MetodePembayaran;
use Livewire\Component;
use Livewire\Livewire;

class PaymentTable extends Component
{
    public $search;
    public $status = false;
    public $perPage = 10;
    public $saved_id, $delete_id;
    public $stat = false;
    public $provider, $code, $name, $rate_type, $rate, $account_number, $account_name, $description, $type;
    public $edit_id;
    public $paginationTheme = 'bootstrap';
    public $listeners = ['saved' => 'saveds', 'savenew' => 'savednews', 'nonaktifkan' => 'nonaktifkan', 'aktifkan' => 'aktifkan', 'deleteMetode' => 'deleteMetodes', 'saved_a', 'saved_as'];
    public function active()
    {
        $this->status = 'active';
    }
    public function nonaktif()
    {
        $this->status = 'inactive';
    }
    public function all()
    {
        $this->status = false;
    }
    public function saved($id)
    {
        $this->saved_id = $id;
        $this->dispatchBrowserEvent('save-confirmation', ['id' => $id]);
    }
    public function saveds($id, $code, $name, $rate, $account_number, $account_name, $description, $process)
    {
        $list = MetodePembayaran::find($id);
        if ($list) {
            $list->code = $code;
            $list->name = $name;
            $list->rate = $rate;
            $list->account_number = $account_number;
            $list->account_name = $account_name;
            $list->description = $description;
            $list->process = $process;
            $list->save();

            $this->code = '';
            $this->name = '';
            $this->rate = '';
            $this->account_number = '';
            $this->account_name = '';
            $this->description = '';
            $this->type = '';
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil menyimpan data']);
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Gagal menyimpan data']);
        }
    }
    public function savenew()
    {
        $this->dispatchBrowserEvent('savedNews');
    }
    public function savednews()
    {
        $this->validate(
            [
                'provider' => 'required',
                'code' => 'required',
                'name' => 'required',
                'rate_type' => 'required',
                'rate' => 'required|numeric',
                'account_number' => 'required',
                'account_name' => 'required',
                'description' => 'required',
                'type' => 'required',
            ],
            [
                'provider.required' => 'Provider harus diisi',
                'code.required' => 'Kode payment harus diisi',
                'name.required' => 'Nama payment harus diisi',
                'rate_type.required' => 'Tipe rate payment harus diisi',
                'rate.required' => 'Rate payment harus diisi',
                'rate.numeric' => 'Rate payment harus berupa angka',
                'account_number.required' => 'Nomor rekening harus diisi',
                'account_name.required' => 'Nama rekening harus diisi',
                'description.required' => 'Deskripsi harus diisi',
                'type.required' => 'Tipe harus diisi',
            ]
        );
        $search = MetodePembayaran::where('name', $this->name)->first();
        if ($search) {
            $this->dispatchBrowserEvent('failed', ['message' => 'Nama payment sudah ada']);
        } else {
            $list = new MetodePembayaran();
            $list->provider = strtolower($this->provider);
            $list->code = $this->code;
            $list->name = $this->name;
            $list->rate = $this->rate;
            $list->rate_type = $this->rate_type;
            $list->account_number = $this->account_number;
            $list->account_name = $this->account_name;
            $list->description = $this->description;
            $list->process = $this->type;
            $list->save();
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil menyimpan data']);
            $this->clear();
        }
    }
    public function editPayment($id)
    {
        $metod = MetodePembayaran::find($id);
        if ($metod) {
            $this->edit_id = $metod->id;
            $this->provider = $metod->provider;
            $this->code = $metod->code;
            $this->name = $metod->name;
            $this->rate = $metod->rate;
            $this->rate_type = $metod->rate_type;
            $this->account_number = $metod->account_number;
            $this->account_name = $metod->account_name;
            $this->description = $metod->description;
            $this->type = $metod->process;
        }
    }
    public function SaveEdit()
    {
        $payment = MetodePembayaran::find($this->edit_id);
        if ($payment) {
            $payment->provider = strtolower($this->provider);
            $payment->code = $this->code;
            $payment->name = $this->name;
            $payment->rate = $this->rate;
            $payment->rate_type = $this->rate_type;
            $payment->account_number = $this->account_number;
            $payment->account_name = $this->account_name;
            $payment->description = $this->description;
            $payment->process = $this->type;
            $payment->save();
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil menyimpan data']);
            $this->dispatchBrowserEvent('HideModal');
            $this->clear();
            return;
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Gagal menyimpan data']);
        }
    }
    public function nonaktifkan($id)
    {
        $this->stat = 'inactive';
        $metode = MetodePembayaran::find($id);
        if ($metode) {
            $metode->status = 'inactive';
            $metode->save();
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil menonaktifkan payment']);
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Gagal menonaktifkan payment']);
        }
    }
    public function aktifkan($id)
    {
        $list = MetodePembayaran::find($id);
        if ($list) {
            $list->status = 'active';
            $list->save();
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil mengaktifkan payment']);
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Gagal mengaktifkan payment']);
        }
    }
    public function deleteMetode($id)
    {
        $this->delete_id = $id;
        $this->dispatchBrowserEvent('delete-confirmation', ['id' => $id]);
    }
    public function deleteMetodes()
    {
        $list = MetodePembayaran::find($this->delete_id);
        if ($list) {
            $list->delete();
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil menghapus payment']);
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Gagal menghapus payment']);
        }
    }
    public function saved_as($id, $code, $name, $rate_type, $rate, $account_number, $account_name, $description, $process)
    {
        $list = MetodePembayaran::find($id);
        if ($list) {
            $list->code = $code;
            $list->name = $name;
            $list->rate_type = $rate_type;
            $list->rate = $rate;
            $list->account_number = $account_number;
            $list->account_name = $account_name;
            $list->description = $description;
            $list->process = $process;
            if ($list->save()) {
                $this->emit('refreshParent');
                $this->dispatchBrowserEvent('success', ['message' => 'Berhasil menyimpan data']);
            } else {
                $this->dispatchBrowserEvent('failed', ['message' => 'Gagal menyimpan data']);
            }
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Gagal menyimpan data']);
        }
    }
    public function render()
    {
        $list = MetodePembayaran::search($this->search)->where('status', 'like', '%' . $this->status . '%')
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.admin.payment-table', compact('list'));
    }
    private function clear()
    {
        $this->edit_id = '';
        $this->code = '';
        $this->name = '';
        $this->rate = '';
        $this->account_number = '';
        $this->account_name = '';
        $this->description = '';
        $this->type = '';
        $this->rate_type = '';
        $this->status = '';
        $this->provider = '';
    }
}
