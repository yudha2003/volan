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
    <link rel="shortcut icon" href="{{ asset('assets/images/logo/' . $config->url_logo) }}">
    <link href="{{ url('/') }}/assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css">
    <link href="{{ url('/') }}/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    @php
        // Check Cookie dark_theme
        if (isset($_COOKIE['dark_theme'])) {
            if ($_COOKIE['dark_theme'] == 'true') {
                $type = 'dark';
                echo '
    <link href="' .
                    url('/') .
                    '/assets/css/bootstrap-dark.min.css" rel="stylesheet" type="text/css" />';
                echo '
    <link href="' .
                    url('/') .
                    '/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" />';
            } else {
                $type = 'light';
                echo '
    <link href="' .
                    url('/') .
                    '/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />';
                echo '
    <link href="' .
                    url('/') .
                    '/assets/css/app.min.css" rel="stylesheet" type="text/css" />';
            }
        } else {
            $type = 'light';
            echo '
    <link href="' .
                url('/') .
                '/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />';
            echo '
    <link href="' .
                url('/') .
                '/assets/css/app.min.css" rel="stylesheet" type="text/css" />';
        }
    @endphp
    <link href="{{ url('/') }}/assets/css/spectrum.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="{{ url('/') }}/assets/libs/jquery/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"
        integrity="sha512-Tn2m0TIpgVyTzzvmxLNuqbSJH3JP8jm+Cy3hvHrW7ndTDcJ1w5mBiksqDBb8GpE2ksktFvDB/ykZ0mDpsZj20w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="//cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="{{ asset('assets/js/spectrum.js') }}" rel='stylesheet'></script>

    @php
        $config = App\Models\Configs::first();
    @endphp
    <style>
        .topnav {
            background: linear-gradient(to bottom, {{ $config->color_default }}, {{ $config->second_default }});
        }

        a {
            color: {{ $config->color_default }};
        }

        a:hover {
            color: {{ $config->color_default }};
        }

        .btn-primary {
            background-color: {{ $config->color_default }};
            border-color: {{ $config->color_default }};
        }

        .btn-primary:hover {
            background-color: {{ $config->color_default }};
        }

        .btn-outline-primary {
            border-color: {{ $config->color_default }};
            color: {{ $config->color_default }};
        }

        .btn-outline-primary:hover {
            background-color: {{ $config->color_default }};
        }

        .btn-outline-primary:focus {
            background-color: {{ $config->color_default }};
        }

        .btn-outline-primary:hover {
            color: #fff;
            background-color: {{ $config->color_default }};
            border-color: {{ $config->color_default }};
        }

        .topnav .navbar-nav .dropdown-item.active,
        .topnav .navbar-nav .dropdown-item:hover {
            color: {{ $config->color_default }};
        }

        .btn-check:active+.btn-primary,
        .btn-check:checked+.btn-primary,
        .btn-primary.active,
        .btn-primary:active,
        .show>.btn-primary.dropdown-toggle {
            color: #fff;
            background-color: {{ $config->color_default }};
            border-color: {{ $config->color_default }};
        }

        .btn-primary.disabled,
        .btn-primary:disabled {
            color: #fff;
            background-color: {{ $config->color_default }};
            border-color: {{ $config->color_default }};
        }

        .btn-check:focus+.btn-primary,
        .btn-primary:focus {
            color: #fff;
            background-color: {{ $config->color_default }};
            border-color: {{ $config->color_default }};
            -webkit-box-shadow: 0 0 0 0.15rem rgba(23, 122, 230, 0.5);
            box-shadow: 0 0 0 0.15rem rgba(23, 122, 230, 0.5);
        }

        .nav-pills .nav-link.active,
        .nav-pills .show>.nav-link {
            color: #fff;
            background-color: {{ $config->color_default }};
        }

        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: {{ $config->color_default }};
        }

        .select2-container--default .select2-results__option[aria-selected="true"]:hover {
            color: #fff;
            background-color: {{ $config->color_default }};
        }
    </style>
</head>

<body data-topbar="light" data-layout="horizontal">
    <div id="layout-wrapper">
        <header id="page-topbar">
            <div class="navbar-header">
                <div class="d-flex">
                    <div class="navbar-brand-box text-center d-none d-lg-block">
                        <a href="{{ url('dashboard') }}" class="logo logo-dark">
                            <span class="logo-lg">
                                <span style="font-weight: 1000; font-size: 20px;">{{ $config->name_panel }}</span>
                            </span>
                        </a>
                        <a href="{{ url('dashboard') }}" class="logo logo-light">
                            <span class="logo-lg">
                                <span style="font-weight: 1000; font-size: 20px;">{{ $config->name_panel }}</span>
                            </span>
                        </a>
                    </div>
                    <button type="button" class="btn btn-sm px-3 font-size-24 d-lg-none header-item"
                        data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
                        <i class="mdi mdi-view-list"></i>
                    </button>
                </div>
                <div class="d-flex">
                    <div class="dropdown d-inline-block user-dropdown">
                        <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="d-block d-xl-none rounded-circle header-profile-user"
                                src="{{ URL::asset('assets/images/user.png') }}" alt="Header Avatar">
                            <img class="d-none d-xl-inline-block rounded-circle header-profile-user"
                                style="margin-top: -23px;" src="{{ URL::asset('assets/images/user.png') }}"
                                alt="Header Avatar">
                            <span class="d-none d-xl-inline-block me-1"></span>
                            <span class="d-none d-xl-inline-block ms-1"
                                style="margin-top: 1px;">{{ Auth::user()->name }}<br><small>Rp.
                                    {{ number_format(Auth::user()->balance, 0, ',', '.') }}</small></span>
                            <span class="d-none d-xl-inline-block me-1"></span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item" href="{{ url('/') }}/user/security"><i
                                    class="mdi mdi-shield-account align-middle me-1"></i> Keamanan</a>
                            <a class="dropdown-item d-block" href="{{ url('/') }}/user/settings"><i
                                    class="mdi mdi-cog align-middle me-1"></i> Pengaturan</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="javascript:;" onclick="confirm_logout();"><i
                                    class="mdi mdi-power align-middle me-1 text-danger"></i> Keluar</a>
                        </div>
                    </div>

                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                            <i class="mdi mdi-cog"></i>
                        </button>
                    </div>

                </div>
            </div>
        </header>
        <div class="topnav">
            <div class="container-fluid">
                <nav class="navbar navbar-light navbar-expand-lg topnav-menu">
                    <div class="collapse navbar-collapse" id="topnav-menu-content">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown {{ Request::is('admin/index') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('admin/index') }}/"><i
                                        class="mdi mdi-home-variant-outline me-2"></i>Admin</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle arrow-none" href="javascript:;"
                                    data-bs-toggle="dropdown" role="button"><i
                                        class="mdi mdi-history me-2"></i>History
                                    <div class="arrow-down"></div>
                                </a>
                                <div class="dropdown-menu">
                                    <a href="{{ url('/') }}/admin/pesanan" class="dropdown-item">Pesanan</a>
                                    <a href="{{ url('/') }}/admin/refill" class="dropdown-item">Refill</a>
                                </div>
                            </li>
                            <li
                                class="nav-item dropdown {{ Request::is('admin/konfigurasi/website') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('admin/konfigurasi/website') }}/"><i
                                        class="mdi mdi-web me-2"></i>Konfigurasi Website</a>
                            </li>
                            <li class="nav-item dropdown {{ Request::is('admin/berita') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('admin/berita') }}/"><i
                                        class="mdi mdi-email me-2"></i>Berita</a>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle arrow-none" href="javascript:;"
                                    data-bs-toggle="dropdown" role="button"><i
                                        class="mdi mdi-history me-2"></i>Kelola Users
                                    <div class="arrow-down"></div>
                                </a>
                                <div class="dropdown-menu">
                                    <a href="{{ url('/') }}/admin/users" class="dropdown-item">Data User</a>
                                    <a href="{{ url('/') }}/admin/user/deposit" class="dropdown-item">Deposit
                                        User</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown {{ Request::is('admin/list/tickets') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('admin/list/tickets') }}/"><i
                                        class="mdi mdi-email-multiple-outline me-2"></i>Tickets</a>
                            </li>
                            <li
                                class="nav-item dropdown {{ Request::is('admin/metode-pembayaran') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('admin/metode-pembayaran') }}/"><i
                                        class="mdi mdi-currency-usd me-2"></i>Metode Pembayaran</a>
                            </li>
                            <li class="nav-item dropdown {{ Request::is('admin/all/layanan') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ url('admin/all/layanan') }}/"><i
                                        class="mdi mdi-format-list-bulleted me-2"></i>All Layanan</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    @yield('content')
                </div>
            </div>
        </div>
    </div>
    <div class="right-bar">
        <div data-simplebar class="h-100">
            <div class="rightbar-title d-flex align-items-center px-3 py-4">
                <h5 class="m-0 me-2">Pengaturan Mode</h5>
                <a href="javascript:void(0);" class="right-bar-toggle ms-auto">
                    <i class="mdi mdi-close noti-icon"></i>
                </a>
            </div>
            <hr class="mt-0" />
            <h6 class="text-center mb-0">Pilih Mode</h6>
            <div class="p-4">
                <div class="form-check form-switch mb-3">
                    <input class="form-check-input theme-choice" type="checkbox" id="light_mode"
                        @if ($type == 'light') checked @endif>
                    <label class="form-check-label" for="light_mode">Light Mode</label>
                </div>
                <div class="form-check form-switch mb-3">
                    <input class="form-check-input theme-choice" type="checkbox" id="dark_mode"
                        @if ($type == 'dark') checked @endif>
                    <label class="form-check-label" for="dark_mode">Dark Mode</label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modals" tabindex="-1" aria-labelledby="modalsLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="content">
                </div>
            </div>
        </div>
    </div>
    <div class="rightbar-overlay"></div>
    <script src="{{ url('/') }}/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/node-waves/waves.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/apexcharts/apexcharts.min.js"></script>
    <script src="{{ url('/') }}/assets/libs/select2/js/select2.min.js"></script>
    <script src="{{ url('/') }}/assets/js/app.js"></script>
    <script src="http://www.developer.test/assets/plugins/blockUI/jquery.blockUI.min.js"></script>
    <script src="http://www.developer.test/assets/js/pages/blockui.js"></script>
    @yield('script')
    <script type="text/javascript">
        $(window).keypress(function(event) {
            if (event.which == '13' && !$(event.target).is('textarea')) {
                event.preventDefault();
            }
        });
        $('.select2').select2();
        $('form').submit(function() {
            $(':submit').attr("disabled", true);
        });
        $('#light_mode').on('change', function() {
            if ($(this).is(':checked')) {
                document.cookie = "dark_theme=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                window.location.reload(true);
            }
        });
        $('#dark_mode').on('change', function() {
            if ($(this).is(':checked')) {
                document.cookie = "dark_theme=true; expires=Fri, 01 Dec 2023 09:35:27 +0700; path=/;";
                window.location.reload(true);
            }
        });

        function read_popup() {
            $.ajax({
                type: "GET",
                url: "{{ url('/') }}/ajax/information"
            });
        }

        function confirm_logout() {
            Swal.fire({
                title: 'Yakin ingin keluar?',
                icon: 'question',
                html: 'Semua sesi Anda yang tersimpan akan dihapus.',
                showCancelButton: true,
                confirmButtonText: 'Keluar',
                cancelButtonText: 'Batalkan',
                customClass: {
                    confirmButton: 'btn btn-primary me-3',
                    cancelButton: 'btn btn-danger',
                },
                buttonsStyling: false,
                allowOutsideClick: false,
                allowEscapeKey: false
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "{{ url('/') }}/logout";
                }
            });
        }

        function copy_text(title, text) {
            var dummy = document.createElement("textarea");
            document.body.appendChild(dummy);
            dummy.setAttribute("id", "dummy_id");
            document.getElementById("dummy_id").value = text;
            dummy.select();
            document.execCommand("copy");
            document.body.removeChild(dummy);
            Swal.fire({
                title: 'Yeay!',
                icon: 'success',
                html: title + ' berhasil disalin.',
                confirmButtonText: 'Okay',
                customClass: {
                    confirmButton: 'btn btn-primary',
                },
                buttonsStyling: false,
            });
        }

        $('.mdi-arrow-down').click(function() {
            $('#card-toggle').slideToggle();
            if ($(this).hasClass('mdi-arrow-down')) {
                $(this).removeClass('mdi-arrow-down');
                $(this).addClass('mdi-arrow-left');
            } else {
                $(this).removeClass('mdi-arrow-left');
                $(this).addClass('mdi-arrow-down');
            }
        });

        $(document).on('keypress', 'input', function(e) {
            if (e.which == 13) {
                e.preventDefault();
                var index = $('input').index(this) + 1;
                $('input').eq(index).focus();
                // if enter on form submit
                if ($('input').eq(index).length > 0) {
                    $('form').submit();
                }
            }
        });
        // if keypress enter on swal2-confirm is visible
        $(document).on('keypress', '.swal2-confirm', function(e) {
            if (e.which == 13) {
                e.preventDefault();
                $('.swal2-confirm').click();
            }
        });
    </script>
    <script type="text/javascript">
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
</body>

</html>
