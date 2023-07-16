@extends('templates.main')
@section('content')
    <style>
        .form-check {
            display: block;
            min-height: 1.3125rem;
            padding-left: 10px;
            margin-bottom: 0.125rem;
        }
    </style>

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
    @if ($errors->all())
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-wallet-plus-outline me-1"></i>Deposit Baru</h5>
                <div class="card-body">
                    <label class="form-label">Jenis Pembayaran <span class="text-danger">*</span></label>
                    <div class="mb-3" style="display:flex">
                        <div class="form-check">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="payment" id="otomatis"
                                    value="auto" />
                                <label class="form-check-label" for="otomatis">Otomatis</label>
                            </div>
                        </div>
                        <div class="form-check">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="payment" id="manual"
                                    value="manual" />
                                <label class="form-check-label" for="manual">Manual</label>
                            </div>
                        </div>
                    </div>
                    <form action="{{ url('deposit/proses') }}" method="POST">
                        @csrf
                        <label class="">Payment</label>
                        <select class="form-control" id="metod" name="metod">
                            <option selected disabled>Pilih jenis pembayaran</option>
                        </select>
                        <label class="mt-2">Nominal</label>
                        <input type="number" class="form-control" id="nominal" placeholder="Masukkan nominal deposit"
                            name="nominal">
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label>Fee</label>
                                <input type="text" class="form-control" id="fee" name="fee" readonly>
                            </div>
                            <div class="col-md-6">
                                <label>Rate</label>
                                <input type="text" class="form-control" id="rate" name="rate" readonly>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label>Jumlah transfer</label>
                                <input type="text" class="form-control" id="jmlh" name="jmlh" readonly>
                            </div>
                            <div class="col-md-6">
                                <label>Saldo Di dapat</label>
                                <input type="text" class="form-control" id="get" name="get" readonly>
                            </div>
                        </div>
                        <div class="form-group float-end mt-2">
                            <button type="reset" class="btn btn-danger mt-2 mr-1" id="reset">Reset</button>
                            <button type="submit" class="btn btn-primary mt-2 ">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-information-outline me-1"></i>Informasi</h5>
                <div class="card-body">
                    <strong>Cara Melakukan Deposit Baru :</strong>
                    <ul>
                        <li>Pilih <em>Jenis Pembayaran</em>.</li>
                        <li>Pilih <em>Payment</em>.</li>
                        <li>Input <em>Nominal Deposit</em> yang Anda inginkan.</li>
                        <li>Transfer Pembayaran sesuai dengan nominal yang tertera.</li>
                        <li>
                            Saldo akan otomatis bertambah dalam beberapa menit apabila Anda menggunakan <em>Jenis
                                Permintaan</em> <b><em>OTOMATIS</em></b>.
                        </li>
                    </ul>
                    <strong>Penting !</strong>
                    <ul>
                        <li>Kami berhak menghapus atau memblokir akun Anda apabila terbukti melakukan kecurangan pada
                            Deposit.</li>
                        <li>
                            Jika menggunakan <em>Jenis Permintaan</em> <b><em>MANUAL</em></b>, harap konfirmasi ke Admin
                            agar Permintaan Deposit segera diterima.
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.btn-primary').click(function() {
            var payment = $('input[name=payment]:checked').val();

            if (layanan == 0 || quantity == 0 || target == 0) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Silahkan lengkapi data terlebih dahulu!',
                });
                return false;
            } else if (quantity < min || quantity > max) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Jumlah pesanan tidak sesuai dengan ketentuan layanan!'
                });
                return false;
            } else {
                $(this).html('<i class="mdi mdi-cart-arrow-up me-1"></i>Memproses...').attr('disabled', true);
                $('form').submit();
            }
        });
        $('input[type=radio][name=payment]').change(function() {
            var radioValue = $("input[name=payment]:checked").val();
            if (radioValue) {
                $.ajax({
                    type: "POST",
                    url: "{{ url('deposit/get-methode') }}",
                    dataType: 'html',
                    data: {
                        id: radioValue,
                        _token: "{{ csrf_token() }}"
                    },
                    success: function(data) {
                        // $('#metod').html(data);
                        // Search string Pembayaran tidak tersedia kalau ada disabled element nominal
                        $('#metod').html(data);
                        if (data.search("Pembayaran") == -1) {
                            $('#nominal').prop('disabled', false);
                            $('#nominal').attr('placeholder', 'Masukkan nominal deposit');
                        } else {
                            $('#nominal').prop('disabled', true);
                            $('#nominal').attr('placeholder', 'Pembayaran tidak tersedia...');
                        }


                    },
                    error: function() {
                        Swal.fire("Failed!", "Terjadi kesalahan, mohon refresh halaman ini", "error");
                    }
                });
            }
        });
        $('#reset').click(function() {
            $('input[name="payment"]').prop('checked', false);
            $('#metod')
                .find('option')
                .remove()
                .end()
                .append('<option value="0">-- Pilih metode deposit --</option>')
                .val('0');
        });
        $('#nominal,#metod').change(function() {
            var nominal = $('#nominal').val();
            var metod = $('#metod').val();
            if (nominal) {
                $.ajax({
                    url: "{{ url('deposit/get-fees') }}",
                    data: {
                        metod: metod,
                        nominal: nominal,
                        _token: "{{ csrf_token() }}"
                    },
                    type: 'POST',
                    dataType: 'json',
                    success: function(data) {
                        if (data.status == true) {
                            document.getElementById("fee").value = data.fee;
                            document.getElementById("rate").value = data.rate;
                            document.getElementById("get").value = data.get;
                            document.getElementById("jmlh").value = data.jmlh;
                        } else {
                            Swal.fire("Failed!", data.message, "error");
                            $('input[name="payment"]').prop('checked', false);
                            $('#metod')
                                .find('option')
                                .remove()
                                .end()
                                .append('<option value="0">-- Pilih metode deposit --</option>')
                                .val('0');
                            // reset form
                            document.getElementById("fee").value = '';
                            document.getElementById("rate").value = '';
                            document.getElementById("get").value = '';
                            document.getElementById("jmlh").value = '';

                        }
                    },
                    error: function() {
                        Swal.fire("Failed!", "Terjadi kesalahan, mohon refresh halaman ini", "error");
                    }
                })
            }
        });
    </script>
@endsection
