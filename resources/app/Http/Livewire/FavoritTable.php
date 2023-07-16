<?php

namespace App\Http\Livewire;

use App\Models\Favorit;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\Livewire;
use Livewire\WithPagination;

class FavoritTable extends Component
{
    public $perPage = 10;
    public $search = '';
    public $status = false;
    // public $history = '';
    use WithPagination;
    public $delete_id;
    protected $listeners = ['deleteConfirmation' => 'deleteLayanan'];
    public function  deleteConfirmation($id)
    {
        $this->delete_id = $id;
        $this->dispatchBrowserEvent('show-delete-confirmation');
    }
    public function deleteLayanan()
    {
        $layanan = Favorit::where('id', $this->delete_id)->where('user_id', Auth::user()->id)->first();
        if ($layanan) {
            $layanan->delete();
            $this->dispatchBrowserEvent('layananDeleted');
        } else {
            $this->dispatchBrowserEvent('failedDeleted');
        }
    }
    public function render()
    {
        // history search where status
        $history = Favorit::search($this->search)
            ->where('user_id', Auth::user()->id)
            ->orderBy('id', 'desc')
            ->Paginate($this->perPage);
        return view('livewire.favorit-table', [
            'history' => $history
        ]);
    }
}
