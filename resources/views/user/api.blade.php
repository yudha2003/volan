@extends('templates.main')
@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 mb-3 header-title"><i class="fa fa-book fa-fw"></i> Dokumentasi API</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tr>
                                <th width="50%">METODE HTTP</th>
                                <td>POST</td>
                            </tr>
                            <tr>
                                <th>API URL</th>
                                <td>{{ url('api') }}/</td>
                            </tr>
                            <tr>
                                <th>Secret Key</th>
                                <td>
                                    <div class="input-group" style="margin-bottom: 10px;">
                                        <input type="text" class="form-control form-control-sm"
                                            value="******-******-******-******-******" readonly>
                                    </div>
                                    <a href="{{ url('user/securitu') }}" class="btn btn-primary btn-sm">Set Secret Key</a>
                                </td>
                            </tr>
                            <tr>
                                <th>API KEY</th>
                                <td>
                                    <div class="input-group" style="margin-bottom: 10px;">
                                        <input type="text" class="form-control form-control-sm"
                                            value="******-******-******-******-******" readonly>
                                    </div>
                                    <button
                                        onclick="copy_text('API Key', '{{ Encryption::decrypt(Auth::user()->api_key) }}');"class="btn btn-primary btn-sm">Copy</button>

                                </td>
                            </tr>
                            <tr>
                                <th>FORMAT RESPON</th>
                                <td>JSON</td>
                            </tr>
                            <tr>
                                <th>CONTOH <i>CLASS</i></th>
                                <td><a href="{{ url('api-examples.txt') }}" target="_new" class="btn btn-primary">PHP</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#profile" role="tab">
                                <i class="fa fa-user fa-fw"></i> Profil
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#service" role="tab">
                                <i class="fa fa-tags fa-fw"></i> <span class="d-md-inline-block">Layanan</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#order" role="tab">
                                <i class="fa fa-shopping-cart fa-fw"></i></i> <span
                                    class="d-md-inline-block">Pemesanan</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#status" role="tab">
                                <i class="fa fa-search fa-fw"></i></i> <span class="d-md-inline-block">Status</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#refill" role="tab">
                                <i class="fa fa-recycle fa-fw"></i></i> <span class="d-md-inline-block">Refill</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#statusrefill" role="tab">
                                <i class="fa fa-search fa-fw"></i> <span class="d-md-inline-block">Status Refill</span>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content mt-3">
                        <div class="tab-pane show active" id="profile">
                            <b>URL Permintaan</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                {{ url('api') }}/profile
                            </div>
                            <b>Parameter</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Parameter</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>secret_key</td>
                                        <td>Secret Key Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>api_key</td>
                                        <td>API KEY Anda.</td>
                                    </tr>
                                </table>
                            </div>
                            <b>Contoh Respon</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                <b>Sukses</b>
                                <pre>{
	"status": true,
	"data": {
		"username": "smm",
		"full_name": "SMM PANEL",
		"balance": 100900
	}
}
</pre>
                                <b>Gagal</b>
                                <pre>{
	"status": false,
	"data": "API Key salah"
}
</pre>
                            </div>
                        </div>
                        <div class="tab-pane" id="service">
                            <b>URL Permintaan</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                {{ url('api') }}/services
                            </div>
                            <b>Parameter</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Parameter</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>secret_key</td>
                                        <td>Secret Key Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>api_key</td>
                                        <td>API KEY Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>service_fav<span class="text-primary">(optional)</span></td>
                                        <td>true <span class="text-primary">(Filter berdasar Layanan favorit, jika
                                                dikosongkan akan menampilkan semua layanan)</span></td>
                                    </tr>
                                </table>
                            </div>
                            <b>Contoh Respon</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                <b>Sukses</b>
                                <pre>{
	"status": true,
	"data": [
		{
			"id": "1",
			"category": "Instagram Followers",
			"name": "Instagram Followers S1",
			"price": "10000",
			"min": "100",
			"max": "10000",
			"description": "Super Fast, Input Username",
			"type": "primary",
			"refill": 1 (Jika 1 = true),
			"masa_refill": 30,
			"average_time": "jumlah pesan rata rata 580 waktu proses 1 jam 13 menit.",
		},
		{
			"id": "2",
			"category": "Instagram Likes",
			"name": "Instagram Likes S1",
			"price": "5000",
			"min": "100",
			"max": "10000",
			"description": "Super Fast, Input Post Url",
			"type": "custom_comments",
			"refill": 0 (Jika 0 = false),
			"masa_refill": null,
			"average_time": "jumlah pesan rata rata 580 waktu proses 1 jam 13 menit.",
		},
		{
			"id": "3",
			"category": "Instagram Likes",
			"name": "Instagram Views S1",
			"price": "100",
			"min": "100",
			"max": "10000",
			"description": "Super Fast, Input Post Url",
			"type": "custom_link",
			"refill": 1 (Jika 1 = true),
			"masa_refill": 0 ,
			"average_time": "jumlah pesan rata rata 580 waktu proses 1 jam 13 menit.",
		},
	]
}
</pre>
                                <b>Gagal</b>
                                <pre>{
	"status": false,
	"data": "API Key salah"
}
</pre>
                            </div>
                        </div>
                        <div class="tab-pane" id="order">
                            <b>URL Permintaan</b>
                            <div class="alert alert-secondary" style="margin: 15px 0; color: #000;">
                                {{ url('api') }}/order
                            </div>
                            <b>Parameter</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Parameter</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>secret_key</td>
                                        <td>Secret Key Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>api_key</td>
                                        <td>API KEY Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>service</td>
                                        <td>ID Layanan, lihat di <a href="https://medanpedia.co.id/page/price_list">Daftar
                                                Layanan</a>.</td>
                                    </tr>
                                    <tr>
                                        <td>target</td>
                                        <td>Target pesanan sesuai kebutuhan (username/url/id).</td>
                                    </tr>
                                    <tr>
                                        <td>quantity</td>
                                        <td>Jumlah pesan.</td>
                                    </tr>
                                    <tr>
                                        <td>custom_comments</td>
                                        <td>Komentar, kosongkan jika tidak diperlukan.</td>
                                    </tr>
                                    <tr>
                                        <td>custom_link</td>
                                        <td>Link, kosongkan jika tidak diperlukan.</td>
                                    </tr>
                                </table>
                            </div>
                            <!-- batas -->
                            <b>Contoh Respon</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                <b>Sukses</b>
                                <pre>{
	"status": true,
	"data": {
		"id": 1107,
		"price": 10900
	}
}
</pre>
                                <b>Gagal</b>
                                <pre>{
	"status": false,
	"data": "API Key salah"
}
</pre>
                            </div>
                        </div>
                        <div class="tab-pane" id="status">
                            <b>URL Permintaan</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                {{ url('api') }}/status
                            </div>
                            <b>Parameter</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Parameter</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>secret_key</td>
                                        <td>Secret Key Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>api_key</td>
                                        <td>API KEY Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>id</td>
                                        <td>ID Pesanan.</td>
                                    </tr>
                                </table>
                            </div>
                            <b>Status</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Status</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>Pending</td>
                                        <td>Pesanan dalam antrian.</td>
                                    </tr>
                                    <tr>
                                        <td>Processing</td>
                                        <td>Pesanan sedang diproses.</td>
                                    </tr>
                                    <tr>
                                        <td>Partial</td>
                                        <td>Pesanan selesai diproses tetapi tidak sesuai jumlah pesan.</td>
                                    </tr>
                                    <tr>
                                        <td>Error</td>
                                        <td>Pesanan gagal diproses.</td>
                                    </tr>
                                    <tr>
                                        <td>Success</td>
                                        <td>Pesanan selesai dan berhasil.</td>
                                    </tr>
                                </table>
                            </div>
                            <b>Contoh Respon</b>
                            <div class="alert alert-secondary" style="color: #000;">
                                <b>Sukses</b>
                                <pre>{
	"status": true,
	"data": {
		"id": 558636,
		"status": "Success",
		"start_count": 10900,
		"remains": 0
	}
}
</pre>
                                <b>Gagal</b>
                                <pre>{
	"status": false,
	"data": "API Key salah"
}
</pre>
                            </div>
                        </div>


                        <div class="tab-pane" id="refill">
                            <b>URL Permintaan</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                {{ url('api') }}/refill
                            </div>
                            <b>Parameter</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Parameter</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>secret_key</td>
                                        <td>Secret Key Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>api_key</td>
                                        <td>API KEY Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>id_order</td>
                                        <td>ID Pesanan.</td>
                                    </tr>
                                </table>
                            </div>
                            <b>Contoh Respon</b>
                            <div class="alert alert-secondary" style="color: #000;">
                                <b>Sukses</b>
                                <pre>{
	"status": true,
	"data": {
		"id_refill": 201
	}
}
</pre>
                                <b>Gagal</b>
                                <pre>{
	"status": false,
	"data": "API Key salah"
}
</pre>
                            </div>
                        </div>

                        <div class="tab-pane" id="statusrefill">
                            <b>URL Permintaan</b>
                            <div class="alert alert-secondary" style="margin: 10px 0; color: #000;">
                                {{ url('api') }}/refill_status
                            </div>
                            <b>Parameter</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Parameter</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>secret_key</td>
                                        <td>Secret Key Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>api_key</td>
                                        <td>API KEY Anda.</td>
                                    </tr>
                                    <tr>
                                        <td>id_refill</td>
                                        <td>ID Refill.</td>
                                    </tr>
                                </table>
                            </div>

                            <b>Status</b>
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>Status</th>
                                        <th>Deskripsi</th>
                                    </tr>
                                    <tr>
                                        <td>Pending</td>
                                        <td>Pesanan dalam antrian refill.</td>
                                    </tr>
                                    <tr>
                                        <td>Proses</td>
                                        <td>Pesanan sedang diproses.</td>
                                    </tr>
                                    <tr>
                                        <td>Gagal</td>
                                        <td>Pesanan gagal direfill.</td>
                                    </tr>
                                    <tr>
                                        <td>Success</td>
                                        <td>Pesanan selesai dan berhasil direfill.</td>
                                    </tr>
                                </table>
                            </div>
                            <b>Contoh Respon</b>
                            <div class="alert alert-secondary" style="color: #000;">
                                <b>Sukses</b>
                                <pre>{
	"status": true,
	"data": {
		"status": Success
	}
}
</pre>
                                <b>Gagal</b>
                                <pre>{
	"status": false,
	"data": "API Key salah"
}
</pre>
                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
