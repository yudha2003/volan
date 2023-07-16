@extends('templates.main')
@section('content')
    @php
        use Carbon\Carbon;
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
    @endphp
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-bullhorn-outline me-1"></i>Informasi Terbaru</h5>
            <div class="card-body">
                <ul class="verti-timeline list-unstyled">
                    @php
                        $berita = App\Models\Announcement::orderBy('id', 'DESC')->get();
                        $berita2 = App\Models\Announcement::orderBy('id', 'asc')->get();
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
            </div>
        </div>
    </div>
@endsection
