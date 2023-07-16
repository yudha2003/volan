<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>SMM Panel - Daftar - Justpedia.id</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta
        content="{{ env('TITLE_WEB ') }}JustPedia adalah Panel Utama Terbaik di Indonesia. Layanan Termurah, Bergaransi. Dan Terbesar Yang Menyediyakan Berbagai Macam Layanan Platfrom Sosial Media Marketing."
        name="description" />
    <meta
        content="{{ env('TITLE_WEB ') }}, smm indonesia, smm panel indonesia, smm panel termurah, smm panel indonesia termurah, smm panel terbaik, smm panel indonesia terbaik, smm panel terlengkap, panel smm terbaik, smm panel indonesia terlengkap, smm panel terpercaya, smm panel indonesia terpercaya, smm panel termurah di indonesia, smm panel shopee, smm panel tokopedia, followers tokopedia murah, panel instagram, smm panel, followers shopee, followers shopee murah, jasa followers instagram, cara menambah followers instagram, followers instagram gratis, jasa followers tokopedia, jasa followers shopee, jasa followers instagram, panel smm, followers gratis, followers instagram, followers indonesia"
        name="keyword" />
    <meta content="JUSTPEDIA MEDIA DIGITAL" name="author" />
    <link rel="shortcut icon" href="{{ url('/') }}/assets/images/favicon.ico">
    <link href="{{ url('/') }}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('/') }}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ url('/') }}/assets/css/app.min.css" rel="stylesheet" type="text/css" />
</head>

<body class="bg-pattern">
    <div class=""></div>
    <div class="account-pages my-5 pt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="card">
                        <div class="card-header py-4 text-center bg-primary">
                            <a href="javascript:;"><span class="text-white"
                                    style="font-size: 20px; font-weight: bold; letter-spacing: 0.1em;">Daftar
                                    akun</span></a>
                        </div>
                        <div class="card-body p-4">

                            <form action="{{ url('proses/register') }}" method="post">
                                @csrf

                                @if (session()->has('error'))
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <strong>{{ session('error') }}</strong>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                @elseif(session()->has('success'))
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <strong>{{ session('success') }}</strong>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                @endif
                                @foreach ($errors->all() as $error)
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <strong>Error!</strong> {{ $error }}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                @endforeach
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-4">
                                            <label class="form-label" for="username">Full Name</label>
                                            <input type="text" class="form-control" name="name" id="name"
                                                placeholder="Masukkan nama anda">
                                        </div>
                                        <div class="mb-4">
                                            <label class="form-label" for="username">Username</label>
                                            <input type="text" class="form-control" name="username" id="username"
                                                placeholder="Masukkan username anda">
                                        </div>
                                        <div class="mb-4">
                                            <label class="form-label" for="email">Email</label>
                                            <input type="text" class="form-control" name="email" id="email"
                                                placeholder="Masukkan email">
                                        </div>
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="mb-4">
                                                    <label class="form-label" for="password">Password</label>
                                                    <input type="password" class="form-control" name="password"
                                                        id="password" placeholder="Masukkan Password">
                                                </div>
                                            </div>
                                            <div class="col-md">

                                                <div class="mb-4">
                                                    <label class="form-label" for="password">Konfirm Password</label>
                                                    <input type="password" class="form-control" name="konfirm_password"
                                                        id="konfirm_password" placeholder="Konfirmasi Password">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-grid mt-1">
                                    <button class="btn btn-primary waves-effect waves-light"
                                        type="submit">Daftar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="mt-3 text-center">
                        <p class="text-dark-50">Sudah punya akun? <a href="{{ url('/') }}"
                                class="fw-medium text-primary"> Login </a> </p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="footer footer-alt"
        style="left: 0; border: none; text-align: center; background-color: transparent;">
        <p class="text-dark-50">
            <script>
                document.write(new Date().getFullYear())
            </script>© Copyright JUSTPEDIA. All Rights Reserved.{{ env('TITLE_WEB ') }}.
        </p>
    </footer>
    <script src="{{ url('/') }}/assets/libs/jquery/jquery.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/node-waves/waves.min.js"></script>
    <script src="{{ url('/') }}/assets/js/app.js"></script>
    <script type="text/javascript">
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
</body>

</html>
