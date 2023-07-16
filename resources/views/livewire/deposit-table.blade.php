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

<div class="row">
    <div class="col-md-12">
        <div class="btn-group flex-wrap mb-3">
            <button wire:click="all" class="btn btn-primary">Semua</button>
            <button wire:click="pending" class="btn btn-primary ">Pending</button>
            <button wire:click="canceled" class="btn btn-primary ">Canceled</button>
            <button class="btn btn-primary " wire:click="success">Success</button>
        </div>
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-credit-card me-2"></i>Riwayat Deposit</h5>
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
                                <th>Pembayaran</th>
                                <th>Metode</th>
                                <th>Jumlah Transfer</th>
                                <th>Saldo Diterima</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Tgl. Deposit</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($history->count() > 0)
                                @foreach ($history as $row)
                                    @php
                                        $search = App\Models\MetodePembayaran::where('code', $row->code)->first();
                                    @endphp
                                    <tr>
                                        <td>
                                            <a class="badge bg-primary"
                                                href="{{ url('deposit/invoice/' . $row->trxid) }}">#{{ $row->trxid }}</a>
                                        </td>
                                        <td>{{ $row->code }} {{ Str::upper($row->name_payment) }}</td>
                                        <td>
                                            @if ($search->process == 'auto')
                                                OTOMATIS
                                            @else
                                                MANUAL
                                            @endif
                                        </td>
                                        <td>Rp {{ number_format($row->amount, 0, ',', '.') }}</td>
                                        <td>Rp {{ number_format($row->amount, 0, ',', '.') }}</td>
                                        <td>{{ $row->description }}</td>
                                        <td class="text-nowrap">
                                            @if ($row->status == 'pending')
                                                <span
                                                    class="btn btn-soft-warning btn-sm btn-rounded font-size-13">Menunggu
                                                    Pembayaran</span>
                                            @elseif ($row->status == 'canceled')
                                                <span
                                                    class="btn btn-soft-danger btn-sm btn-rounded font-size-13">Dibatalkan</span>
                                            @elseif($row->status == 'done')
                                                <span
                                                    class="btn btn-soft-success btn-sm btn-rounded font-size-13">Berhasil</span>
                                            @endif
                                        </td>
                                        <td>{{ tanggal(Carbon::parse($row->created_at)->format('Y-m-d')) }}
                                            {{ Carbon::parse($row->created_at)->format('H:i:s') }}</td>
                                        <td class="text-nowrap">
                                            @if ($row->status == 'pending')
                                                <button href="javascript:;"
                                                    wire:click.prevent='dibatalkan({{ $row->id }})'
                                                    class="btn btn-soft-danger btn-sm btn-rounded font-size-13"><i
                                                        class="mdi mdi-close-circle-outline me-1"></i>Batalkan</button>
                                            @else
                                                <button href="javascript:;"
                                                    class="btn btn-soft-danger btn-sm btn-rounded font-size-13"
                                                    disabled><i
                                                        class="mdi mdi-close-circle-outline me-1"></i>Batalkan</button>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="9" class="text-center">Data Not Found</td>
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
    window.addEventListener('show-delete-confirmation', event => {
        Swal.fire({
            title: 'Apakah Anda Yakin?',
            text: "Anda akan membatalkan deposit!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, Batalkan!'
        }).then((result) => {
            if (result.isConfirmed) {
                Livewire.emit('dibatalkan')
            }
        })
    })
    window.addEventListener('layananDeleted', event => {
        Swal.fire(
            'Terhapus!',
            'Deposit berhasil dibatalkan.',
            'success'
        )
    });
    window.addEventListener('failedDeleted', event => {
        Swal.fire(
            'Gagal!',
            'Data gagal dihapus.',
            'error'
        )
    });
</script>
