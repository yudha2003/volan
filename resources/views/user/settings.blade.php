@extends('templates.main')
@section('content')
@if (session()->has('success'))
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong>Success!</strong> {!! session()->get('success') !!}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
@endif
@if (session()->has('error'))
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong>Error!</strong> {{ session()->get('error') }}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
@endif
<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-account-cog-outline me-1"></i>Pengaturan</h5>
            <div class="card-body">
                <form method="POST" action="{{ url('proses/settings') }}">
                    @csrf
                    <div class="mb-2 row">
                        <label class="col-md-3 col-form-label">Email</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" value="{{ Auth::user()->email }}" readonly>
                            <small class="text-muted">* Email tidak dapat diubah</small>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label class="col-md-3 col-form-label">Username</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" value="{{ Auth::user()->username }}" readonly>
                            <small class="text-muted">* Username tidak dapat diubah</small>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">Nama Lengkap <span class="text-danger">*</span></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="full_name" value="{{ Auth::user()->name }}">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-md-3 col-form-label">Password Saat Ini <span
                                class="text-danger">*</span></label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" name="password">
                        </div>
                    </div>
                    <div class="mb-0">
                        <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light float-end"><i
                                class="mdi mdi-account-cog-outline me-1"></i>Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection