@extends('templates.admin')
@section('content')
    @php
        // sum history
        use Carbon\Carbon;
        $m = date('m');
        $month = date('m');
        $year = date('Y');
        $days = Carbon::now()->daysInMonth;
        $tanggal = "$year-$month-01 00:00:00";
        $tgl = "$year-$month-$days 00:00:00";
        // Sum price table History
        $orderBulanan = App\Models\History::whereBetween('created_at', [$tanggal, $tgl])
            ->where([['status', 'done']])
            ->sum('price');
        $countOrder = \App\Models\History::whereBetween('created_at', [$tanggal, $tgl])
            ->where('status', 'done')
            ->count();
        
        $allorder = App\Models\History::where([['status', 'done']])->sum('price');
        $history = \App\Models\History::where('status', 'done')->sum('price');
        $countHistory = \App\Models\History::where('status', 'done')->count();
        
        $depositBulanan = \App\Models\Deposit::whereBetween('created_at', [$tanggal, $tgl])
            ->where('status', 'done')
            ->sum('amount');
        $countdeposit = \App\Models\Deposit::whereBetween('created_at', [$tanggal, $tgl])
            ->where('status', 'done')
            ->count();
        
        $deposit = \App\Models\Deposit::where('status', 'done')->sum('amount');
        $countdepo = \App\Models\Deposit::where('status', 'done')->count();
        // $history = \App\Models\History::where('user_id', Auth::user()->id)->get();
        
        $totalLayanan = \App\Models\Smm::count();
        $refill = \App\Models\Smm::where('refill', '1')->count();
        function format($id)
        {
            return number_format($id, 0, ',', '.');
        }
        
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
            $x = App\Models\History::whereDate('created_at', $tgl)->count();
            return $x;
        }
        function user_aktif($tgl)
        {
            $x = App\Models\User::where('status', 'active')
                ->whereDate('created_at', $tgl)
                ->count();
            return $x;
        }
        function user_inactive($tgl)
        {
            $x = App\Models\User::where('status', 'nonverif')
                ->whereDate('created_at', $tgl)
                ->count();
            return $x;
        }
        function berhasil($tgl)
        {
            $x = App\Models\History::where('status', 'done')
                ->whereDate('created_at', $tgl)
                ->count();
            return $x;
        }
        function pending($tgl)
        {
            $x = App\Models\History::where('status', 'pending')
                ->whereDate('created_at', $tgl)
                ->count();
            return $x;
        }
        function gagal($tgl)
        {
            $x = App\Models\History::where('status', 'error')
                ->whereDate('created_at', $tgl)
                ->count();
            return $x;
        }
        function processing($tgl)
        {
            $x = App\Models\History::where('status', 'process')
                ->whereDate('created_at', $tgl)
                ->count();
            return $x;
        }
        function users($tgl)
        {
            $x = App\Models\User::whereDate('created_at', $tgl)->count();
            return $x;
        }
    @endphp
    <div class="row">
        <div class="col-lg">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-success rounded-circle text-success font-size-20">
                                    <i class="mdi mdi-credit-card-multiple fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total semua pesanan</p>
                            <h5 class="mb-1">Rp {{ format($allorder) }}</h5>
                            <p class="text-truncate mb-0"> Dari {{ format($countOrder) }} Pesanan Selesai <span
                                    class="text-success me-2"></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-success rounded-circle text-success font-size-20">
                                    <i class="mdi mdi-wallet-outline fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Pemesanan Bulanan</p>
                            <h5 class="mb-1">Rp {{ format($orderBulanan) }}</h5>
                            <p class="text-truncate mb-0"> Dari {{ format($countHistory) }} Pesanan Selesai <span
                                    class="text-success me-2"></span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-info rounded-circle text-info font-size-20">
                                    <i class="mdi mdi-database fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Semua Deposit User</p>
                            <h5 class="mb-1">Rp {{ format($deposit) }}</h5>
                            <p class="text-truncate mb-0">{{ format($countdepo) }} Deposit Berhasil</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-primary rounded-circle text-primary font-size-20">
                                    <i class="mdi mdi-database fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Deposit Bulanan</p>
                            <h5 class="mb-1">Rp {{ format($depositBulanan) }}</h5>
                            <p class="text-truncate mb-0">{{ format($countdeposit) }} Deposit Berhasil</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-warning rounded-circle text-warning font-size-20">
                                    <i class="mdi mdi-shopping fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Layanan</p>
                            <h5 class="mb-1">Rp {{ format($totalLayanan) }}</h5>
                            <p class="text-truncate mb-0">Layanan</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex text-muted">
                        <div class="flex-shrink-0 me-3 align-self-center">
                            <div class="avatar-md">
                                <div class="avatar-title bg-soft-info rounded-circle text-info font-size-20">
                                    <i class="mdi mdi-shopping fs-1"></i>
                                </div>
                            </div>
                        </div>
                        <div class="flex-grow-1 overflow-hidden">
                            <p class="mb-1">Total Layanan Refill</p>
                            <h5 class="mb-1">{{ format($refill) }}</h5>
                            <p class="text-truncate mb-0">Layanan</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-chart-line me-1"></i>Grafik Semua Pesanan dalam 7 Hari Terakhir
                </h5>
                <div class="card-body">
                    <div id="order-chart" class="apex-charts" dir="ltr" style="height: 314px;"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-chart-line me-1"></i>Grafik Pendaftaran user dalam 7 Hari Terakhir
                </h5>
                <div class="card-body">
                    <div id="users-chart" class="apex-charts" dir="ltr" style="height: 314px;"></div>
                </div>
            </div>
        </div>
    </div>
@section('script')
    <script>
        var options = {
            colors: ['#2c8ef8', '#00d118', '#009dd1', '#f1b44c', '#ff0000'],
            series: [{
                    name: 'Jumlah Pesanan',
                    data: [
                        <?php for($i=1; $i<=7; $i++) : ?> "<?= order(tgl_grafik(7 - $i)) ?>",
                        <?php endfor; ?>
                    ],
                },
                {
                    name: 'Berhasil',
                    data: [
                        <?php for($i=1; $i<=7; $i++) : ?> "<?= berhasil(tgl_grafik(7 - $i)) ?>",
                        <?php endfor; ?>
                    ],
                },
                {
                    name: 'Processing',
                    data: [
                        <?php for($i=1; $i<=7; $i++) : ?> "<?= processing(tgl_grafik(7 - $i)) ?>",
                        <?php endfor; ?>
                    ],
                },
                {
                    name: 'Pending',
                    data: [
                        <?php for($i=1; $i<=7; $i++) : ?> "<?= pending(tgl_grafik(7 - $i)) ?>",
                        <?php endfor; ?>
                    ],
                },
                {
                    name: 'Gagal',
                    data: [
                        <?php for($i=1; $i<=7; $i++) : ?> "<?= gagal(tgl_grafik(7 - $i)) ?>",
                        <?php endfor; ?>
                    ],
                }

            ],
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
        var chart = new ApexCharts(document.querySelector("#order-chart"), options);
        chart.render();
        var options = {
            colors: ['#00d118', '#f1b44c', '#00d118'],
            series: [{
                    name: 'Aktif',
                    data: [
                        <?php for($i=1; $i<=7; $i++) : ?> "<?= user_aktif(tgl_grafik(7 - $i)) ?>",
                        <?php endfor; ?>
                    ],
                },
                {
                    name: 'Nonaktif',
                    data: [
                        <?php for($i=1; $i<=7; $i++) : ?> "<?= user_inactive(tgl_grafik(7 - $i)) ?>",
                        <?php endfor; ?>
                    ],
                },

            ],
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
        var chart = new ApexCharts(document.querySelector("#users-chart"), options);
        chart.render();
    </script>
@endsection
@endsection
