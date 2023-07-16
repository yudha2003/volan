<?php

namespace App\Http\Livewire\Admin;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\WithPagination;

class UserTable extends Component
{
    use WithPagination;
    public $perPage = 10;
    public $search = '';
    public $status = '';
    public $id_banned;
    public $delete_id;
    public $users_id, $name, $email, $phone, $address, $stat;
    protected $listeners = ['bannedUser' => 'bannedUsers', 'unbannedUser' => 'unbannedUsers', 'deleteConfirmation' => 'deleteUser'];
    public function bannedUser($id)
    {
        $this->id_banned = $id;
        $this->dispatchBrowserEvent('show-banned-confirmation');
    }
    public function bannedUsers()
    {
        $user = User::where('id', $this->id_banned)->first();
        if ($user) {
            $user->status = 'banned';
            $user->save();
            $this->dispatchBrowserEvent('bannedUsers');
        } else {
            $this->dispatchBrowserEvent('failedBanned');
        }
    }
    public function unbannedUser($id)
    {
        $this->id_banned = $id;
        $this->dispatchBrowserEvent('show-unbanned-confirmation');
    }
    public function unbannedUsers()
    {
        $user = User::where('id', $this->id_banned)->first();
        if ($user) {
            $user->status = 'active';
            $user->save();
            $this->dispatchBrowserEvent('unbannedUsers');
        } else {
            $this->dispatchBrowserEvent('failedBanned');
        }
    }
    public function  deleteConfirmation($id)
    {
        $this->delete_id = $id;
        $this->dispatchBrowserEvent('show-delete-confirmation');
    }
    public function deleteUser()
    {
        $user = User::where('id', $this->delete_id)->first();
        if ($user) {
            $user->delete();
            $this->dispatchBrowserEvent('userDeleted');
        } else {
            $this->dispatchBrowserEvent('failedDeleted');
        }
    }
    public function active()
    {
        $this->status = 'active';
    }
    public function notverify()
    {
        $this->status = 'nonverif';
    }
    public function banned()
    {
        $this->status = 'banned';
    }
    public function all()
    {
        $this->status = false;
    }
    public function render()
    {
        $users = User::search($this->search)->where('status', 'like', '%' . $this->status . '%')->orderBy('id', 'desc')->Paginate($this->perPage);
        return view('livewire.admin.user-table', compact('users'));
    }
}
