<!DOCTYPE html>
<html lang="en">

@php
    $config = App\Models\Configs::first();
@endphp

<head>
    <meta charset="utf-8" />
    <title>{{ $config->title_website }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="{{ $config->description_website }}" name="description" />
    <meta content="{{ $config->keyword_website }}" name="keyword" />
    <meta content="ENGINE MEDIA DIGITAL INDONESIA" name="author" />
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
                                    style="font-size: 20px; font-weight: bold; letter-spacing: 0.1em;">{{ $config->name_panel }}
                                    LOGIN</span></a>
                        </div>
                        <div class="card-body p-4">
                            <form class="form-horizontal" action="{{ url('login') }}" method="POST">
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
                                            <label class="form-label" for="username">Username</label>
                                            <input type="text" class="form-control" name="username" id="username">
                                        </div>
                                        <div class="mb-4">
                                            <label class="form-label" for="password">Password</label>
                                            <a href="{{ url('forgot-password') }}"
                                                class="text-muted float-end"><small>Lupa Password?</small></a>
                                            <input type="password" class="form-control" name="password" id="password">
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="remember"
                                                        name="remember" value="something">
                                                    <label class="form-check-label" for="remember">Ingatkan saya</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-grid mt-3">
                                            <button class="btn btn-primary waves-effect waves-light"
                                                type="submit">Masuk</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="mt-3 text-center">
                        <p class="text-dark-50">Belum punya akun? <a href="{{ url('/') }}/auth/register"
                                class="fw-medium text-primary"> Daftar </a> </p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="footer footer-alt" style="left: 0; border: none; text-align: center; background-color: transparent;">
        <p class="text-dark-50">
            <script>
                document.write(new Date().getFullYear())
            </script>© Copyright JUSTPEDIA. All Rights Reserved. {{ $config->title_website }}.
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
