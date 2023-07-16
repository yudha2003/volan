<div class="row">
    <div class="col-md-12">
        <div class="btn-group flex-wrap mb-2">
            <button wire:click="all" class="btn btn-primary ">Semua</button>
            <button wire:click="debit" class="btn btn-primary ">Debit/Masuk</button>
            <button wire:click="credit" class="btn btn-primary ">Kredit/Keluar</button>
        </div>
        <div class="btn-group flex-wrap mb-2">
            <button wire:click="all" class="btn btn-primary ">Semua</button>
            <button wire:click="order" class="btn btn-primary ">Pemesanan</button>
            <button wire:click="deposit" class="btn btn-primary ">Deposit</button>
            <button wire:click="refund" class="btn btn-primary ">Pengembalian</button>
        </div>
    </div>
    <div class="col-md-12">
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-account-convert me-1"></i>Log Saldo</h5>
            <div class="card-body">
                <form method="get" class="row">
                    <div class="col-md">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Tampilkan</span>
                            </div>
                            <select class="form-control" name="row" id="table-row">
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
                    <div class="col-md">
                        <div class="input-group mb-3">
                            <input type="text" wire:model.debounce.300ms="search" class="form-control" name="search"
                                id="table-search" value="" placeholder="Cari...">
                        </div>
                    </div>
                </form>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="text-uppercase">
                                <th>ID</th>
                                <th>Tgl. Dibuat</th>
                                <th>Tipe</th>
                                <th>Kategori</th>
                                <th>Jumlah</th>
                                <th>Saldo Sebelum</th>
                                <th>Saldo Akhir</th>
                                <th>Deskripsi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($log as $row)
                            @php
                            if ($row->type == 'Kredit') {
                            $type = '<span class="btn btn-soft-danger btn-sm font-size-13">Kredit</span>';
                            } else {
                            $type = '<span class="btn btn-soft-success btn-sm font-size-13">Debit</span>';
                            }
                            @endphp
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $row->created_at }}</td>
                                <td class="text-center">{!! $type !!}</td>
                                <td><span class="btn btn-soft-success btn-sm font-size-13">{{ Str::upper($row->kategori)
                                        }}</span></td>
                                <td>Rp {{number_format($row->jumlah, 0, ',', '.')}}</td>
                                <td>Rp {{ number_format($row->before_balance, 0, ',', '.') }}</td>
                                <td>Rp {{ number_format($row->after_balance, 0, ',', '.') }}</td>
                                <td><textarea class="form-control" disabled
                                        style="border:none;">{{ $row->description }}</textarea></td>
                            </tr>

                            @empty
                            <tr>
                                <td colspan="8" align="center">Data not found.</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // if btn-primary clicked
    document.querySelectorAll('.btn-primary').forEach(function (el) {
        el.addEventListener('click', function (e) {
            // remove btn-primary class
            document.querySelectorAll('.btn-primary').forEach(function (el) {
                el.classList.remove('btn-primary');
            });
            // add btn-primary class
            e.target.classList.add('btn-primary active');
        });
    });
</script>