<form action="{{ url('admin/save/edit-user') }}" method="POST">
    @csrf
    <input type="hidden" name="id" value="{{ $user->id }}">
    <div class="row">
        <div class="col-md">
            <div class="mb-3">
                <label for="">Name</label>
                <input type="text" class="form-control" name="name" id="name" value="{{ $user->name }}">
            </div>
        </div>
        <div class="col-md">
            <div class="mb-3">
                <label for="">Email</label>
                <input type="text" class="form-control" name="email" id="email" value="{{ $user->email }}">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md">
            <label>Balance<span class="text-danger">*</span></label>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="input-group-text">Rp</span>
                </div>
                <input class="form-control" name="balance" value="{{ number_format($user->balance, 0, ',', '.') }}">
            </div>
        </div>
        <div class="form-group col-md">
            <label>Omzet<span class="text-danger">*</span></label>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="input-group-text">Rp</span>
                </div>
                <input name="omzet" class="form-control" name="omzet"
                    value="{{ number_format($user->omzet, 0, ',', '.') }}">
            </div>
        </div>
    </div>
    <label class="mt-2">Role <span class="text-danger">*</span></label>
    <select name="role" class="form-control">
        <option value="admin" {{ $user->role == 'admin' ? 'selected' : '' }}>Admin</option>
        <option value="reseller" {{ $user->role == 'reseller' ? 'selected' : '' }}>Reseller</option>
        <option value="user" {{ $user->role == 'user' ? 'selected' : '' }}>User</option>
    </select>
    <div class="row mt-3">
        <div class="d-grid gap-2 col-6">
            <button type="button" name="cancel" data-bs-dismiss="modal" class="btn btn-danger btn-block"> Close
            </button>
        </div>
        <div class="d-grid gap-2 col-6">
            <button type="submit" class="btn btn-primary btn-block"> Save Changes </button>
        </div>
    </div>
</form>