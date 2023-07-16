<?php

namespace App\Http\Livewire\Admin;

use App\Models\Favorit;
use App\Models\History;
use App\Models\HistoryRefill;
use App\Models\Smm;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\Livewire;
use Livewire\WithPagination;

class LayananTable extends Component
{
    use WithPagination;
    public $perPage = 10;
    public $search = '';
    public $refill = false;
    public $custom = false;
    public $delete_id, $edit_id;
    public $provider, $service_id, $category, $name, $price, $min, $type, $max, $description, $average_time;
    public $providerd, $service_idd, $categoryd, $named, $priced, $mind, $typed, $maxd, $descriptiond, $average_timed;
    protected $rules = [
        'provider' => 'required',
        'service_id' => 'required|numeric',
        'category' => 'required',
        'name' => 'required',
        'price' => 'required',
        'min' => 'required',
        'max' => 'required',
        'description' => 'required',
    ];
    protected $messages = [
        'provider.required' => 'Provider harus diisi',
        'service_id.required' => 'ID layanan harus diisi',
        'service_id.numeric' => 'ID layanan harus berupa angka',
        'category.required' => 'Kategori layanan harus diisi',
        'name.required' => 'Nama layanan harus diisi',
        'price.required' => 'Harga layanan harus diisi',
        'min.required' => 'Minimal pembelian harus diisi',
        'max.required' => 'Maksimal pembelian harus diisi',
        'description.required' => 'Deskripsi layanan harus diisi',
    ];
    public $listeners = ['deleteLayanan' => 'deleteConfirmed'];
    public function all()
    {
        $this->refill = false;
        $this->custom = false;
    }
    public function refill()
    {
        $this->refill = '1';
        $this->custom = false;
    }
    public function custom_comments()
    {
        $this->refill = false;
        $this->custom = 'custom_comments';
    }
    public function custom_link()
    {
        $this->refill = false;
        $this->custom = 'custom_link';
    }
    public function deleteLayanan($id)
    {
        $this->delete_id = $id;
        $this->dispatchBrowserEvent('confirm-delete');
    }
    public function deleteConfirmed()
    {
        $layanan = Smm::where('service', $this->delete_id)->first();
        $layanan->delete();
        $this->dispatchBrowserEvent('deleted');
    }
    public function savednews()
    {
        $this->validate();
        $layanan = Smm::where('name', $this->name)->first();
        if ($layanan) {
            $this->dispatchBrowserEvent('failed', ['message' => 'Layanan sudah ada']);
        } else {
            $service = Smm::where('service', $this->service_id)->first();
            if ($service) {
                $this->dispatchBrowserEvent('failed', ['message' => 'ID SERVICE sudah ada']);
                return;
            }
            $data = [
                'provider' => $this->provider,
                'service' => $this->service_id,
                'type' => 'Default',
                'category' => $this->category,
                'name' => $this->name,
                'price' => $this->price,
                'min' => $this->min,
                'max' => $this->max,
                'refill' => 0,
                'description' => $this->description,
                'dripfeed' => 1,
                'refill' => 0,
                'cancel' => 1,
            ];
            Smm::create($data);
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil menambah layanan']);
        }
    }
    public function editProduct($id)
    {
        $smm = Smm::find($id);
        if ($smm) {
            $this->edit_id = $id;
            $this->providerd = $smm->provider;
            $this->service_idd = $smm->service;
            $this->categoryd = $smm->category;
            $this->named = $smm->name;
            $this->priced = $smm->price;
            $this->typed = $smm->type;
            $this->mind = $smm->min;
            $this->maxd = $smm->max;
            $this->descriptiond = $smm->description;
            $this->average_timed = $smm->average_time;
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Layanan tidak ditemukan']);
        }
    }
    public function editProducts()
    {
        $smm = Smm::find($this->edit_id);
        if ($smm) {
            $smm->provider = $this->providerd;
            $smm->service = $this->service_idd;
            $smm->category = $this->categoryd;
            $smm->name = $this->named;
            $smm->price = $this->priced;
            $smm->type = $this->typed;
            $smm->min = $this->mind;
            $smm->max = $this->maxd;
            $smm->description = $this->descriptiond;
            $smm->average_time = $this->average_timed;
            $smm->save();
            $this->dispatchBrowserEvent('success', ['message' => 'Berhasil mengubah layanan']);
            return;
        } else {
            $this->dispatchBrowserEvent('failed', ['message' => 'Layanan tidak ditemukan']);
            return;
        }
    }
    public function render()
    {
        $favorit = Favorit::where('user_id', Auth::user()->id)->get();
        $favorit_id = [];
        foreach ($favorit as $key => $value) {
            $favorit_id[] = $value->layanan_id;
        }
        $layanan = Smm::search($this->search)
            ->where('refill', $this->refill ? '1' : '0')
            ->where('type', $this->custom ?? false)
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.admin.layanan-table', compact('layanan'));
    }
}
