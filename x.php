<?php
$host = "localhost"; // Ganti dengan host database Anda
$database = "enginepe_playcheat"; // Ganti dengan nama database Anda
$username = "enginepe_playcheat"; // Ganti dengan nama pengguna database Anda
$password = "enginepe_playcheat"; // Ganti dengan kata sandi database Anda

// Membuat koneksi
$conn = new mysqli($host, $username, $password, $database);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
function encrypt($string)
{
    $ciphering = "AES-128-CTR";
    $options = 0;
    $encryption_iv = '0896690014860811';
    $encryption_key = "MembersEncryptionKey";
    $encryption = openssl_encrypt($string, $ciphering, $encryption_key, $options, $encryption_iv);
    return $encryption;
}
function decrypt($string)
{
    $ciphering = "AES-128-CTR";
    $options = 0;
    $encryption_iv = '0896690014860811';
    $encryption_key = "MembersEncryptionKey";
    $encryption = openssl_decrypt($string, $ciphering, $encryption_key, $options, $encryption_iv);
    return $encryption;
}
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
    return $pecahkan[2] . ' ' . $bulan[(int)$pecahkan[1]] . ' ' . $pecahkan[0];
}
$key = encrypt($_POST['user_key']); // Melindungi dari serangan SQL Injection
// Mengambil data dari tabel "members"
$sql1 = $conn->query("SELECT * FROM members WHERE `key` = '$key' AND `code_game` = 'MLBB' LIMIT 1");
$member = $sql1->fetch_assoc();
$sql = $conn->query("SELECT * FROM games WHERE `code_game` = 'MLBB'");
$game = $sql->fetch_assoc();
$sql = $conn->query("SELECT * FROM tools WHERE `name` = 'mlbb' AND `val` = '$_POST[version]'");
$version = $sql->fetch_assoc();
if (!$version) {
    echo json_encode([
        'status' => false,
        'reason' => 'KAMU MENGGUNAKAN APK VERSI LAMA!'
    ], 404);
    return;
}
if ($game['status'] == 'stop') {
    echo json_encode([
        'status' => false,
        'reason' => 'CHEAT SEDANG MAINTENANCE!'
    ], 404);
    return;
}
if ($member) {
    if ($member['expired_at'] < date('Y-m-d H:i:s') && $member['status'] == 'active') {
        echo json_encode([
            'status' => false,
            'reason' => 'LICENSE SUDAH EXPIRED!'
        ], 404);
        return;
    } else if ($member['status'] == 'banned') {
        echo json_encode([
            'status' => false,
            'reason' => 'LICENSE TELAH DI BANNED! Hubungi 081382397275'
        ], 404);
        return;
    } else {
        $static = 'Vm8Lk7Uj2JmsjCPVPVjrLa7zgfx3uz9E';
        $enc = $_POST['game'] . '-' . $_POST['user_key'] . '-' . $_POST['serial'] . '-' . $static;
        $sql = $conn->query("SELECT * FROM list_devices WHERE `key` = '$key'");
        $device = $sql->fetch_assoc();
        $sql = $conn->query("SELECT * FROM users WHERE `username` = '$member[user]'");
        $user = $sql->fetch_assoc();
        $serial = $_POST['serial'];
        $key = $conn->real_escape_string($key);
        $serial = $conn->real_escape_string($serial);
        if ($member['custom_title']) {
            $title = ' - ' . $member['custom_title'];
        } else {
            if ($user['custom_title'] != null) {
                $title = ' | ' . $user['custom_title'];
            } else {
                $title = ' | BEST MOD EVER';
            }
        }
        $sql = $conn->query("SELECT COUNT(*) AS devices FROM list_devices WHERE `key` = '$key'");
        $count = $sql->fetch_assoc();
        $expired_at = $member['expired_at'];
        $bulan = date('Y-m-d', strtotime($expired_at));
        $harian = date('H:i:s', strtotime($expired_at));
        if ($count > 0) {
            $sql = $conn->query("SELECT * FROM list_devices WHERE `key` = '$key' AND `game` = 'MLBB' AND `serial` = '$serial'");
            $search = $sql->fetch_assoc();
            if ($search) {
                echo json_encode([
                    'status' => true,
                    'data' => [
                        'token' => md5($enc),
                        'rng' => strtotime($member['expired_at']),
                        'expired' => tanggal($bulan) . ' ' . $harian,
                        'tittle' => $title,
                        'instance' => "Instance"
                    ]
                ]);
                return;
            } else if ($count < $member['max_devices']) {
                $insert = $conn->query("INSERT INTO list_devices (`game`, `key`, `serial`) VALUES ('MLBB', '$key', '$_POST[serial]')");
                echo json_encode([
                    'status' => true,
                    'data' => [
                        'token' => md5($enc),
                        'rng' => strtotime($member['expired_at']),
                        'expired' => tanggal($bulan) . ' ' . $harian,
                        'tittle' => $title,
                        'instance' => "Instance"
                    ]
                ]);
                return;
            } else {
                echo json_encode([
                    'status' => false,
                    'reason' => 'LICENSE HAS REACHED THE LIMIT'
                ]);
            }
        } else {
            if ($member['status'] == 'pending') {
                $exp = date('Y-m-d H:i:s', strtotime(date('Y-m-d H:i:s') . ' + ' . $member['duration'] . ' days'));
                $insert = $conn->query("INSERT INTO list_devices (`game`, `key`, `serial`, `status`, `expired_at`) VALUES ('MLBB', '$key', '$_POST[serial]','active', '$exp')");
                echo json_encode([
                    'status' => true,
                    'data' => [
                        'token' => md5($enc),
                        'rng' => strtotime($member['expired_at']),
                        'expired' => tanggal($bulan) . ' ' . $harian,
                        'tittle' => $title,
                        'instance' => "Instance"
                    ]
                ]);
                return;
            } else if ($member['status'] == 'active' && $member['expired_at'] > date('Y-m-d H:i:s')) {
                $insert = $conn->query("INSERT INTO list_devices (`game`, `key`, `serial`) VALUES ('MLBB', '$key', '$_POST[serial]')");
                echo json_encode([
                    'status' => true,
                    'data' => [
                        'token' => md5($enc),
                        'rng' => strtotime($member['expired_at']),
                        'expired' => tanggal($bulan) . ' ' . $harian,
                        'tittle' => $title,
                        'instance' => "Instance"
                    ]
                ]);
                return;
            } else if ($member['status'] == 'banned') {
                echo json_encode([
                    'status' => false,
                    'reason' => 'LICENSE TELAH DI BANNED! Hubungi 081382397275'
                ], 404);
            } else {
                echo json_encode([
                    'status' => false,
                    'reason' => 'LICENSE HAS EXPIRED!'
                ]);
                return;
            }
        }
    }
} else {
    echo json_encode([
        'status' => false,
        'reason' => 'KEY TIDAK VALID!'
    ], 404);
}
