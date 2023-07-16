<?php

namespace App\Http\Livewire;

use App\Models\Favorit;
use App\Models\History;
use App\Models\HistoryRefill;
use App\Models\Medans;
use App\Models\Smm;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\Livewire;
use Livewire\WithPagination;

class AllLayananTable extends Component
{
    use WithPagination;

    public $perPage = 10;
    public $search = '';
    public $refill = false;
    public $custom = false;
    public $category = false;
    protected $listeners = ['category' => 'Categorys'];
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
    public function Categorys($category)
    {
        $this->category = $category;
    }
    public function render()
    {
        $layanan = Smm::search($this->search)
            ->where('refill', $this->refill ? '1' : '0')
            ->where('type', $this->custom ?? false)
            ->where('category', $this->category ?? false)
            ->Paginate($this->perPage);
        $this->category = false;
        $kategori = Smm::distinct()->orderBy('category', 'asc')
            ->get(['category']);
        return view('livewire.all-layanan-table', compact('layanan', 'kategori'));
    }
}
