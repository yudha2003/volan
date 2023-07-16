@php

function tanggal($tanggal)
{
$bulan = array(
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
'Desember'
);
$pecahkan = explode('-', $tanggal);

// variabel pecahkan 0 = tanggal
// variabel pecahkan 1 = bulan
// variabel pecahkan 2 = tahun

return $pecahkan[2] . ' ' . $bulan[(int)$pecahkan[1]] . ' ' . $pecahkan[0];
}
@endphp
<div class="row">
    <div class="col-md-12">
        <div class="btn-group flex-wrap mb-3">
            <button wire:click="all" class="btn btn-primary">Semua</button>
            <button wire:click="open" class="btn btn-primary ">Open</button>
            <button wire:click="closed" class="btn btn-primary ">Closed</button>
        </div>
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-refill me-1"></i>Riwayat Pesanan</h5>
            <div class="card-body">
                <form method="get" class="row">
                    <div class="col-md-3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Tampilkan</span>
                            </div>
                            <select wire:model="perPage" class="form-control" name="row" id="table-row">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                            <div class="input-group-append">
                                <span class="input-group-text">baris.</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-3">
                        <div class="input-group mb-3">
                            <input type="text" wire:model.debounce.300ms="search" class="form-control" name="search"
                                id="table-search" value="" placeholder="Cari...">
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr class="text-uppercase">
                                <th>ID</th>
                                <th>Tgl.Dibuat</th>
                                <th>Tipe</th>
                                <th>Subjek</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($history->count() > 0)
                            @foreach ($history as $row)
                            @php
                            if ($row->status == 'closed') {
                            $status = 'danger';
                            $text = 'Close';
                            } elseif ($row->status == 'open') {
                            $status = 'success';
                            $text = 'Open';
                            }
                            @endphp
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ tanggal(date('Y-m-d', strtotime($row['created_at']))) . ' ' . date('H:i',
                                    strtotime($row['created_at'])) . '' }}</td>
                                <td>{{ $row->type_ticket }}</td>
                                <td>{{ $row->subject }}</td>
                                <td><span class="btn btn-soft-{{ $status }} btn-sm font-size-13">{{ $text }}</span></td>
                                <td class="text-nowrap"><a href="{{ url('ticket/chat/'.$row->ticket_id) }}"
                                        class="btn btn-primary btn-sm waves-effect waves-light"><i
                                            class="mdi mdi-email-open-outline me-1"></i>Buka Tiket</a></td>

                            </tr>
                            @endforeach
                            @else
                            <tr>
                                <td colspan="8" class="text-center">Data Not Found</td>
                            </tr>
                            @endif
                        </tbody>
                    </table>
                    {!! $history->links() !!}
                </div>
            </div>
        </div>
    </div>
</div>
<script>
</script>