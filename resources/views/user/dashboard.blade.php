@extends('templates.main')
@section('content')
    @php
        
        function tanggal($tanggal)
        {
            $bulan = [
                1 => 'Januari',
                'Februari',
                'Maret',
                'April',
                'Mei',
                'Juni',
                'Juli',
                'Agustus',
                'September',
                'Oktober',
                'November',
                'Desember',
            ];
            $pecahkan = explode('-', $tanggal);
        
            // variabel pecahkan 0 = tanggal
            // variabel pecahkan 1 = bulan
            // variabel pecahkan 2 = tahun
        
            return $pecahkan[2] . ' ' . $bulan[(int) $pecahkan[1]] . ' ' . $pecahkan[0];
        }
        use Carbon\Carbon;
        function name_days($ke)
        {
            $tgl = date('Y-m-d', time() - 60 * 60 * 24 * $ke);
            $create = Carbon::create($tgl, 'Asia/Jakarta');
            $grafik = $create->format('l');
            if ($grafik == 'Monday') {
                $g = 'Senin';
            } elseif ($grafik == 'Tuesday') {
                $g = 'Selasa';
            } elseif ($grafik == 'Wednesday') {
                $g = 'Rabu';
            } elseif ($grafik == 'Thursday') {
                $g = 'Kamis';
            } elseif ($grafik == 'Friday') {
                $g = 'Jumat';
            } elseif ($grafik == 'Saturday') {
                $g = 'Sabtu';
            } elseif ($grafik == 'Sunday') {
                $g = 'Minggu';
            }
            return $g;
        }
        function tgl_grafik($ke)
        {
            $tgl = date('Y-m-d', time() - 60 * 60 * 24 * $ke);
            return $tgl;
        }
        function order($tgl)
        {
            $x = App\Models\History::where('user_id', Auth::user()->id)
                ->whereDate('created_at', $tgl)
                ->count();
            // $q = mysqli_query($konek, "SELECT * FROM riwayat WHERE username = '$username' AND tanggal = '$tgl'");
            return $x;
        }
    @endphp
    <div class="alert alert-info" role="alert">
        <i class="mdi mdi-information-outline me-1"></i> Hubungi Admin jika ada yang tidak jelas <b><em><a
                    href="https://wa.me/62895342301466">DISINI</a></em></b>.
    </div>
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-chart-line me-1"></i>Grafik 7 Hari Terakhir</h5>
                <div class="card-body">
                    <div id="user-chart" class="apex-charts" dir="ltr" style="height: 314px;"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-primary rounded-circle text-primary font-size-20">
                                    <i class="mdi mdi-wallet-outline fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Saldo</p>
                            <h5 class="mb-1">Rp {{ number_format(Auth::user()->balance, 0, ',', '.') }}</h5>
                            <p class="text-truncate mb-0"> Saldo Anda <span class="text-success me-2"></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            @php
                $omzet = App\Models\History::where('user_id', Auth::user()->id)
                    ->where('status', 'done')
                    ->sum('price');
                $count = App\Models\History::where('user_id', Auth::user()->id)
                    ->where('status', 'done')
                    ->count();
            @endphp
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-pink rounded-circle text-pink font-size-20">
                                    <i class="mdi mdi-cart-outline fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Pemesanan</p>
                            <h5 class="mb-1">Rp {{ number_format($omzet, 0, ',', '.') }}</h5>
                            <p class="text-truncate mb-0">{{ $count }} Pesanan Berhasil</p>
                        </div>
                    </div>
                </div>
            </div>
            @php
                $deposit = App\Models\Deposit::where('user_id', Auth::user()->id)
                    ->where('status', 'done')
                    ->sum('amount');
                $count = App\Models\Deposit::where('user_id', Auth::user()->id)
                    ->where('status', 'done')
                    ->count();
            @endphp
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-success rounded-circle text-success font-size-20">
                                    <i class="mdi mdi-credit-card-plus fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Deposit</p>
                            <h5 class="mb-1">Rp {{ number_format($deposit, 0, ',', '.') }}</h5>
                            <p class="text-truncate mb-0">{{ $count }} Deposit</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-bullhorn-outline me-1"></i>Informasi Terbaru</h5>
            <div class="card-body">
                <ul class="verti-timeline list-unstyled">
                    @php
                        $berita = App\Models\Announcement::orderBy('id', 'DESC')
                            ->limit(3)
                            ->get();
                        $berita2 = App\Models\Announcement::orderBy('id', 'asc')
                            ->limit(3)
                            ->get();
                        $first = $berita2->first();
                    @endphp
                    @foreach ($berita as $row)
                        @php
                            if ($row->type == 'info') {
                                $type = 'primary';
                                $icon = 'mdi mdi-information-outline';
                                $text = 'Informasi';
                            } else {
                                $type = 'success';
                                $icon = 'mdi mdi-progress-wrench';
                                $text = 'Layanan';
                            }
                        @endphp
                        <li class="event-list">
                            <h5 class="fw-bold text-{{ $type }} mb-1"><i
                                    class="{{ $icon }} me-1 fs-5"></i>{{ $text }}</h5>
                            <p class="text-muted mb-2">
                                <small>{{ tanggal(Carbon::parse($row->created_at)->format('Y-m-d')) }} -
                                    {{ Carbon::parse($row->created_at)->format('H:i') }}</small>
                            </p>
                            <p class="text-muted" style="margin-bottom: 8px;">
                            <p>
                                @php
                                    $row->message = nl2br($row->message);
                                    $row->message = preg_replace('/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/', '<a href="$0" target="_blank">$0</a>', $row->message);
                                    
                                @endphp
                                {!! $row->message !!}
                            </p>
                            @if ($row->id == $first->id)
                                <b><small class="text-muted">Pembaruan terakhir:
                                        {{ tanggal(Carbon::parse($row->created_at)->format('Y-m-d')) }} -
                                        {{ Carbon::parse($row->created_at)->format('H:i') }}</small></b>
                            @endif
                        </li>
                        <hr>
                    @endforeach
                </ul>
                <h6 class="text-center mt-4"><a href="{{ url('news/berita') }}"
                        class="d-grid btn btn-primary btn-sm waves-effect waves-light">Lihat
                        Semua</a></h6>
            </div>
        </div>
    </div>

@section('script')
    <script>
        var options = {
            colors: ['#2c8ef8'],
            series: [{
                name: 'Jumlah Pesanan',
                data: [
                    <?php for($i=1; $i<=7; $i++) : ?> "<?= order(tgl_grafik(7 - $i)) ?>",
                    <?php endfor; ?>
                ],
            }],
            chart: {
                toolbar: {
                    show: false
                },
                height: 320,
                type: 'area',
                events: {
                    animationEnd: undefined,
                    beforeMount: undefined,
                    mounted: undefined,
                    updated: undefined,
                    click: undefined,
                    mouseMove: undefined,
                    legendClick: undefined,
                    markerClick: undefined,
                    selection: undefined,
                    dataPointSelection: undefined,
                    dataPointMouseEnter: undefined,
                    dataPointMouseLeave: undefined,
                    beforeZoom: undefined,
                    beforeResetZoom: undefined,
                    zoomed: undefined,
                    scrolled: undefined,
                    scrolled: undefined,
                }
            },
            dataLabels: {
                enabled: false,
            },
            stroke: {
                curve: 'smooth'
            },
            markers: {
                size: 5,
                discrete: [{
                        seriesIndex: 0,
                        dataPointIndex: 0,
                        size: 0
                    },
                    {
                        seriesIndex: 0,
                        dataPointIndex: 1,
                        fillColor: '#2c8ef8',
                        strokeColor: '#fff',
                        size: 6
                    }
                ]
            },
            xaxis: {
                type: 'category',
                categories: [
                    <?php for($i=1; $i<=7; $i++) : ?> "<?= name_days(7 - $i) ?>",
                    <?php endfor; ?>
                ],
                labels: {
                    trim: false,
                    rotate: 0,
                }
            },
            yaxis: {
                labels: {
                    formatter: function(value) {
                        return value + "";
                    }
                },
            },
            tooltip: {
                x: {
                    format: 'dd/MM/yy HH:mm'
                },
            },
        };
        var chart = new ApexCharts(document.querySelector("#user-chart"), options);
        chart.render();
    </script>
@endsection
@endsection
