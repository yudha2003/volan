@extends('templates.main')
@section('content')
    @php
        use App\Helpers\Encryption;
    @endphp

    @if (session()->has('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>{{ session('error') }}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @elseif(session()->has('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>{{ session('success') }}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif
    @foreach ($errors->all() as $error)
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> {{ $error }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endforeach
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-fire me-1"></i>API</h5>
                <div class="card-body">
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#api_key" role="tab">
                                <i class="mdi mdi-key-wireless me-1 align-middle"></i> <span class="d-md-inline-block">API
                                    Key</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#secret_key" role="tab">
                                <i class="mdi mdi-account-key-outline me-1 align-middle"></i> <span
                                    class="d-md-inline-block">Secret Key</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#whitelist_ip" role="tab">
                                <i class="mdi mdi-shield-lock-outline me-1 align-middle"></i> <span
                                    class="d-md-inline-block">Whitelist IP</span>
                            </a>
                        </li>
                    </ul>
                    @php
                        // $count = strlen(Encryption::decrypt(Auth::user()->api_key)) / 2;
                        
                        // Ambil 15 digit dari depan dan ubah sisa nya menjadi ****
                        $count = strlen(Auth::user()->api_key) - 15;
                    @endphp
                    <div class="tab-content pt-2">
                        <div class="tab-pane active" id="api_key" role="tabpanel">
                            <div class="mb-0">
                                <label class="form-label">API Key</label>
                                <div class="input-group">
                                    <input type="text" class="form-control mb-3"
                                        value="{{ substr_replace(Auth::user()->api_key, '*****', -$count) }}" readonly>
                                    <div class="addon-input-group">
                                        <a href="javascript:;" class="btn btn-primary waves-effect waves-light"
                                            onclick="copy_text('API Key', '{{ Encryption::decrypt(Auth::user()->api_key) }}');"
                                            style="width: 100px;"><i class="mdi mdi-content-copy me-1"></i>Salin</a>
                                    </div>
                                </div>
                                <button onclick="resets()" class="btn btn-primary btn-sm waves-effect waves-light"><i
                                        class="mdi mdi-key-link me-1"></i>Buat Ulang API Key</button>
                            </div>
                        </div>
                        <div class="tab-pane" id="secret_key" role="tabpanel">
                            <form method="POST" action="{{ url('update/secret-key') }}">
                                @csrf
                                <div class="mb-3">
                                    <label class="form-label">Secret Key <span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" name="secret_key">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password Saat Ini <span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" name="password">
                                </div>
                                <div class="mb-0">
                                    <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light"><i
                                            class="mdi mdi-account-key-outline me-1"></i>Ubah Secret Key</button>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane" id="whitelist_ip" role="tabpanel">
                            <form method="POST" action="{{ url('update/whitelist-ip') }}">
                                @csrf
                                <div class="mb-2">
                                    <label class="form-label">Whitelist IP <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="whitelist_ip"
                                        value="{{ Auth::user()->whitelist_ip }}">
                                    <div class="alert alert-info mt-2">
                                        <i class="fas fa-info-circle"></i> Lebih dari 1 IP Statis? <br>
                                        Pisahkan setiap IP dengan koma (,) Contoh: 192.232.11.1,192.455.12.1
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password Saat Ini <span class="text-danger">*</span></label>
                                    <input type="password" class="form-control" name="password">
                                </div>
                                <div class="mb-0">
                                    <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light"><i
                                            class="mdi mdi-shield-lock-outline me-1"></i>Ubah Whitelist IP</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-cog me-1"></i>Ubah Password</h5>
                <div class="card-body">
                    <form method="POST" action="{{ url('user/change-password') }}">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">Password Baru <span class="text-danger">*</span></label>
                            <input type="password" class="form-control" name="npassword">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Konfirmasi Password Baru <span class="text-danger">*</span></label>
                            <input type="password" class="form-control" name="cnpassword">
                        </div>
                        <hr class="mb-2">
                        <div class="mb-3">
                            <label class="form-label">Password Saat Ini <span class="text-danger">*</span></label>
                            <input type="password" class="form-control" name="password">
                        </div>
                        <div class="mb-0">
                            <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light float-end"><i
                                    class="mdi mdi-cog me-1"></i>Ubah Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        function resets() {
            $.ajax({
                url: "{{ url('resetKey') }}",
                type: "POST",
                dataType: "json",
                data: {
                    _token: "{{ csrf_token() }}"
                },
                success: function(data) {
                    if (data.status == true) {
                        Swal.fire({
                            title: 'Berhasil!',
                            text: data.message,
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload();
                            }
                        })
                    } else {
                        Swal.fire({
                            title: 'Gagal!',
                            text: data.message,
                            icon: 'error',
                            confirmButtonText: 'OK'
                        })
                    }
                },
                error: function(data) {
                    Swal.fire({
                        title: 'Gagal!',
                        text: 'Terjadi kesalahan, silahkan coba lagi.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    })
                }
            })
        }
    </script>
@endsection
