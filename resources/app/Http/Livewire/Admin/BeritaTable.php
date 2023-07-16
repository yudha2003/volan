<?php

namespace App\Http\Livewire\Admin;

use App\Models\Announcement;
use Livewire\Component;

class BeritaTable extends Component
{
    public $search = '';
    protected $listeners = ['update' => 'updates', 'deleteConfirm' => 'deleteConfirms', 'save' => 'saves'];
    public function deleteConfirm($id)
    {
        $this->dispatchBrowserEvent('delete-confirm', ['id' => $id]);
    }
    public function deleteConfirms($id)
    {
        $berita = Announcement::where('id', $id)->first();
        if ($berita) {
            $berita->delete();
            $this->dispatchBrowserEvent('success', ['message' => 'Berita berhasil dihapus!']);
        } else {
            $this->dispatchBrowserEvent('error', ['message' => 'Berita tidak ditemukan!']);
        }
    }
    public function updates($id, $type, $message)
    {
        $berita = Announcement::where('id', $id)->first();
        if ($berita) {
            $berita->update([
                'type' => $type,
                'message' => $message
            ]);
            // refresh data livewire
            $this->emit('refresh');
            $this->dispatchBrowserEvent('success', ['message' => 'Berita berhasil diupdate!']);
        } else {
            $this->dispatchBrowserEvent('error', ['message' => 'Berita tidak ditemukan!']);
        }
    }
    public function saves($type, $message)
    {
        $berita = new Announcement();
        $berita->type = $type;
        $berita->message = $message;
        if ($berita->save()) {
            $this->emit('refresh');
            $this->dispatchBrowserEvent('success', ['message' => 'Berita berhasil ditambahkan!']);
        } else {
            $this->dispatchBrowserEvent('error', ['message' => 'Berita gagal ditambahkan!']);
        }
    }
    public function render()
    {
        $berita = Announcement::search($this->search)->orderby('id', 'desc')->paginate(10);
        return view('livewire.admin.berita-table', compact('berita'));
    }
}
