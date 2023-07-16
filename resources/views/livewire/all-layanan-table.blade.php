<div class="row">
    <div class="col-md-12">
        <div class="btn-group flex-wrap mb-3">
            <button wire:click="all" class="btn btn-primary">Semua</button>
            <button wire:click="refill" class="btn btn-primary ">Refill</button>
            <button wire:click="custom_comments" class="btn btn-primary ">Custom Comments</button>
            <button wire:click="custom_link" class="btn btn-primary ">Custom Link</button>
        </div>
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-history me-1"></i>All Layanan</h5>
            <div class="card-body">
                <form method="get" class="row">
                    <div class="col-md-3">
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
                    <div class="col-md-6" wire:ignore>
                        <select class="select2 form-control" style="width:100%" name="category" id="category">
                            <option value="">Semua Kategori</option>
                            @foreach ($kategori as $rows)
                                <option value="{{ $rows->category }}">{{ $rows->category }}</option>
                            @endforeach
                        </select>
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
                                <th>Service ID</th>
                                <th>Favorit</th>
                                <th>Category</th>
                                <th>Nama Layanan</th>
                                <th>Harga/ 1000 </th>
                                <th>Min Pesan</th>
                                <th>Max Pesan</th>
                                <th>Refill</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($layanan->count() > 0)
                                @foreach ($layanan as $row)
                                    @php
                                        $favorit = App\Models\Favorit::where('user_id', Auth::user()->id)
                                            ->where([['service_id', $row->service], ['category', $row->category], ['layanan', $row->name]])
                                            ->first();
                                    @endphp
                                    <tr>
                                        <td>{{ $row->service }}</td>
                                        @if ($favorit)
                                            <td class="text-center"><a href="javascript:;"
                                                    onclick="unfav('{{ $row->service }}');"
                                                    id="fs-{{ $row->service }}"><i
                                                        class="mdi mdi-star text-primary ms-1 font-size-20"></i></a>
                                            </td>
                                        @else
                                            <td class="text-center"><a href="javascript:;"
                                                    onclick="fav('{{ $row->service }}');" id="fs-{{ $row->service }}"><i
                                                        class="mdi mdi-star-outline text-primary ms-1 font-size-20"></i></a>
                                            </td>
                                        @endif
                                        <td>{{ $row->category }}</td>
                                        <td>{{ $row->name }}</td>
                                        <td>Rp {{ number_format($row->price, 0, ',', '.') }}</td>
                                        <td>{{ number_format($row->min, 0, ',', '.') }}</td>
                                        <td>{{ number_format($row->max, 0, ',', '.') }}</td>
                                        @if ($row->refill == '1')
                                            <td class="text-center"><span class="badge bg-success"
                                                    style="font-size:15px;"><i class="mdi mdi-check"></i></span></td>
                                        @else
                                            <td class="text-center"><span class="badge bg-danger"
                                                    style="font-size:15px;"><i class="mdi mdi-close"></i></span></td>
                                        @endif
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td colspan="8" class="text-center">Data Not Found</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                    {!! $layanan->links() !!}
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#category').change(function() {
        var category = $(this).val();
        Livewire.emit('category', category);
    });

    function fav(id) {
        $.ajax({
            type: "POST",
            url: "{{ url('favorit/service') }}",
            data: "id=" + id + "&_token={{ csrf_token() }}",
            dataType: "json",
            success: function(data) {
                if (data.status == true) {
                    $('#fs-' + id).html('<i class="mdi mdi-star text-primary ms-1 font-size-20"></i>');
                    $('#fs-' + id).attr('onclick', 'unfav(\'' + id + '\');');
                    Swal.fire({
                        title: 'Berhasil',
                        icon: 'success',
                        html: data.message,
                        confirmButtonText: 'OK',
                        customClass: {
                            confirmButton: 'btn btn-primary',
                        },
                        buttonsStyling: false,
                    });
                } else {
                    Swal.fire({
                        title: 'Ups!',
                        icon: 'error',
                        html: data.message,
                        confirmButtonText: 'OK',
                        customClass: {
                            confirmButton: 'btn btn-primary',
                        },
                        buttonsStyling: false,
                    });
                }
            },
            error: function() {
                Swal.fire({
                    title: 'Ups!',
                    icon: 'error',
                    html: 'Terjadi kesalahan, silahkan coba lagi.',
                    confirmButtonText: 'OK',
                    customClass: {
                        confirmButton: 'btn btn-primary',
                    },
                    buttonsStyling: false,
                });
            },
            beforeSend: function() {}
        });
    }

    function unfav(id) {
        $.ajax({
            type: "POST",
            url: "{{ url('unfav/service') }}",
            data: "id=" + id + "&_token={{ csrf_token() }}",
            dataType: "json",
            success: function(data) {
                if (data.status == true) {
                    $('#fs-' + id).html(
                        '<i class="mdi mdi-star-outline text-primary ms-1 font-size-20"></i>');
                    $('#fs-' + id).attr('onclick', 'fav(\'' + id + '\');');
                    Swal.fire({
                        title: 'Berhasil!',
                        icon: 'success',
                        html: data.message,
                        confirmButtonText: 'OK',
                        customClass: {
                            confirmButton: 'btn btn-primary',
                        },
                        buttonsStyling: false,
                    });
                } else {
                    Swal.fire({
                        title: 'Ups!',
                        icon: 'error',
                        html: data.message,
                        confirmButtonText: 'OK',
                        customClass: {
                            confirmButton: 'btn btn-primary',
                        },
                        buttonsStyling: false,
                    });
                }
            },
            error: function() {
                Swal.fire({
                    title: 'Ups!',
                    icon: 'error',
                    html: 'Terjadi kesalahan, silahkan coba lagi.',
                    confirmButtonText: 'OK',
                    customClass: {
                        confirmButton: 'btn btn-primary',
                    },
                    buttonsStyling: false,
                });
            },
            beforeSend: function() {}
        });
    }
</script>
