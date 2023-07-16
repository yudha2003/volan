@php
    
    if ($history['status'] == 'done') {
        $tk = 'fas fa-check-circle text-success mr-1';
    } elseif ($history['status'] == 'pending') {
        $tk = 'fas fa-circle-notch fa-spin text-warning mr-1';
    } elseif ($history['status'] == 'process') {
        $tk = 'fas fa-spinner fa-spin text-info mr-1';
    } elseif ($history['status'] == 'error') {
        $tk = 'far fa-times-circle text-danger';
    } elseif ($history['status'] == 'partial') {
        $tk = 'fas fa-exclamation-circle text-primary mr-1';
    }
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
<div class="table-responsive">
    <table class="table table-striped table-bordered table-box">
        <tbody>
            <tr>
                <th>TrxID</th>
                <td>{{ $history->trxid }}</td>

            </tr>
            <tr>
                <th>Layanan</th>
                <td>
                    {{ $history->layanan }}
                </td>
            </tr>
            <tr>
                <th>Target</th>
                <td>
                    {{ $history->target }}
                </td>
            </tr>

            <tr>
                <th>Price</th>
                <td>Rp
                    {{ number_format($history->price, 0, ',', '.') }}
                </td>
            </tr>
            <tr>
                <th>Jumlah</th>
                <td>
                    {{ number_format($history->quantity, 0, ',', '.') }}
                </td>
            </tr>
            <tr>
                <th>Jumlah Awal</th>
                <td>
                    {{ number_format($history->start_count, 0, ',', '.') }}
                </td>
            </tr>
            <tr>
                <th>Jumlah Kurang</th>
                <td>
                    {{ number_format($history->remains, 0, ',', '.') }}
                </td>
            </tr>
            <tr>
                <th>Status</th>
                <td><i class="<?= $tk ?>"></i>&nbsp;
                    <?= Str::ucfirst($history['status']) ?>
                </td>
            </tr>
            <tr>
                <th>Order Date</th>
                <td>
                    <?= tanggal(date('Y-m-d', strtotime($history['created_at']))) . ' ' . date('H:i', strtotime($history['created_at'])) . '' ?>
                </td>
            </tr>
            @if ($history->custom_comments)
                <tr>
                    <th>Custom Comments</th>
                    <td>
                        <textarea class="form-control">{{ $history->custom_comments }}</textarea>
                    </td>
                </tr>
            @endif
            @if ($history->custom_link)
                <tr>
                    <th>Custom Link</th>
                    <td>
                        <textarea class="form-control">{{ $history->custom_link }}</textarea>
                    </td>
                </tr>
            @endif
            <tr>
                <th>Updated Date</th>
                <td>
                    <?= tanggal(date('Y-m-d', strtotime($history['updated_at']))) . ' ' . date('H:i', strtotime($history['updated_at'])) . '' ?>
                </td>
            </tr>
            <?php
            $diff = $history->created_at->diffForHumans($history->updated_at);
            $remove = ['sebelumnya', 'setelahnya'];
            $replace = str_replace($remove, '', $diff);
            ?>
            <?php
            if ($history->status == 'done') {
            ?>
            <tr>
                <th>Waktu Proses</th>
                <td style="color: green;">
                    <?= $replace ?>
                </td>
            </tr>
            <?php
            }
            ?>
            @if ($history->type == 'custom_comments')
                <tr>
                    <th>Custom Comments</th>
                    <td>
                        <textarea class="form-control">{{ $history->custom_comments }}</textarea>
                    </td>
                </tr>
            @elseif ($history->type == 'custom_link')
                <tr>
                    <th>Custom Link</th>
                    <td>
                        <textarea class="form-control">{{ $history->custom_link }}</textarea>
                    </td>
                </tr>
            @endif
        </tbody>
    </table>
</div>
