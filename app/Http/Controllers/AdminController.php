<?php

namespace App\Http\Controllers;

use App\Events\ChatEvent;
use App\Helpers\Encryption;
use App\Models\Bca;
use App\Models\BcaUser;
use App\Models\Deposit;
use App\Models\Gopay;
use App\Models\Ovo;
use App\Models\Smm;
use App\Models\Ticket;
use App\Models\TicketChat;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

define("COOKIE_FILE", __DIR__ . "/cookie.tmp");

class AdminController extends Controller
{
    public function index()
    {
        return view('admin.index');
    }
    public function users()
    {
        return view('admin.users');
    }
    public function editUser(User $user)
    {
        return view('admin.edit_user', compact('user'));
    }
    public function saveEditUser(Request $request)
    {
        $user = User::find($request->id);
        if ($user) {
            $user->name = $request->name;
            $user->email = $request->email;
            $user->balance = str_replace('.', '', $request->balance);
            $user->omzet = str_replace('.', '', $request->omzet);
            $user->role = $request->role;
            if ($user->save()) {
                return redirect()->back()->with('success', 'User updated');
            } else {
                return redirect()->back()->with('error', 'Failed to update user');
            }
        } else {
            return redirect()->back()->with('error', 'User not found');
        }
    }
    public function depositUser()
    {
        return view('admin.deposit_user');
    }
    public function listTicket()
    {
        return view('admin.list-ticket');
    }
    public function chatTicket(Ticket $ticket)
    {
        $respon = TicketChat::where('ticket_id', $ticket->ticket_id)->where('type', 'admin')->orderBy('id', 'desc')->first();
        return view('admin.tickets-chat', compact('ticket', 'respon'));
    }
    public function sendMessageTicket(Request $request)
    {
        $ticket = Ticket::where('ticket_id', $request->ticket_id)->first();
        if ($ticket) {
            $chat = new TicketChat();
            $chat->ticket_id = $request->ticket_id;
            $chat->user_id = auth()->user()->id;
            $chat->type = 'admin';
            $chat->message = $request->message;
            $chat->save();
            if ($chat->save()) {
                $ticket->message = $request->message;
                $ticket->save();
                $last = TicketChat::where('ticket_id', $request->ticket_id)->orderBy('id', 'desc')->first();
                $render = view('tickets.send-user', compact('ticket', 'chat', 'last'))->render();
                $data = [
                    'type' => 'admin',
                    'message' => $request->message,
                    'ticket_id' => $request->ticket_id,
                    'html' => $render
                ];
                event(new ChatEvent($data));

                return response()->json([
                    'status' => 'success',
                    'message' => 'Message has been sent!',
                    'html' => view('tickets.admin-send', compact('ticket', 'last'))->render()
                ]);
            } else {
                return response()->json(['status' => 'error', 'message' => 'Message failed to send!']);
            }
        } else {
            return response()->json(['status' => 'error', 'message' => 'Ticket not found!']);
        }
    }
    public function Metodepembayaran()
    {
        return view('admin.metodepembayaran');
    }
    public function allLayanan()
    {

        return view('admin.all-layanan');
    }
    public function updateLayanan(Request $request)
    {
        $service = Smm::where('service', $request->service_id)->first();
        if ($service) {
            $service->name = $request->layanan;
            $service->description = trim($request->description);
            $service->price = str_replace('.', '', $request->harga);
            $service->min = str_replace('.', '', $request->min);
            $service->max = str_replace('.', '', $request->max);
            $service->category = $request->category;
            $service->save();
            return response()->json(['status' => 'success', 'message' => 'Service updated!']);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Service not found!']);
        }
    }
    public function pesanan()
    {
        return view('admin.pesanan');
    }
    public function refill()
    {
        return view('admin.refill');
    }
    public function berita()
    {
        return view('admin.berita');
    }
    public function encryptBankBca(Request $request)
    {
        $request->validate(
            [
                'name' => 'required|string',
                'username' => 'required|string',
                'password' => 'required|string',
            ],
            [
                'name.required' => 'Nama tidak boleh kosong!',
                'username.required' => 'Username tidak boleh kosong!',
                'password.required' => 'Password tidak boleh kosong!',
            ]
        );
        $client = BcaUser::where([['username', Encryption::encrypt($request->username)], ['status', 'active']])->first();
        if ($client) {
            return redirect()->back()->with('error', 'Anda sudah memiliki akun BCA!');
        } else {
            BcaUser::create([
                'name' => $request->name,
                'username' => Encryption::encrypt($request->username),
                'password' => Encryption::encrypt($request->password),
                'status' => 'active'
            ]);
            return redirect()->back()->with('success', 'Akun BCA berhasil disimpan!');
        }
    }
    public function encryptBankBcaMutasi()
    {
        $startDate = date('Y-m-d');
        $endDate   = date('Y-m-d');
        $user = BcaUser::where([['status', 'active']])->first();
        $bca = new \App\Libraries\Bca(Encryption::decrypt($user->username), Encryption::decrypt($user->password), COOKIE_FILE);
        $ret = $bca->login();

        $ret = $bca->accountStatement($startDate, $endDate);

        $result = json_encode($ret, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
        if ($result != 'null') {
            $html = '';
            $html .= '
            <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover pd-2">
            <thead>
                <tr>
                    <th>Type</th>
                    <th>Keterangan</th>
                    <th>Saldo</th>
                </tr>
                </thead>
                <tbody>';
            foreach ($ret as $row) {
                if ($row['type'] == 'DB') {
                    $type = '<span class="btn btn-soft-success btn-sm btn-rounded font-size-13">Debit</span>';
                } else {
                    $type = '<span class="btn btn-soft-danger btn-sm btn-rounded font-size-13">Kredit</span>';
                }
                $html .= '<tr>
                <td>' . $type . '</td>
                <td>' . $row['info'] . '</td>
                <td>' . $row['amount'] . '</td>
                </tr>';
            }
            $html .= '</tbody>
            </table></div>';
            return $html;
        } else {
            return '<div class="alert alert-danger" style="padding:15px">Data tidak ditemukan!</div>';
        }
    }
    public function encryptBankBcaChangeAccount()
    {
        $user = BcaUser::where([['user_id', Auth::user()->id], ['status', 'active']])->first();
        if ($user) {
            $user->delete();
            return redirect()->back()->with('success', 'Akun BCA di hapus!');
        } else {
            return redirect()->back()->with('error', 'Akun BCA tidak ditemukan!');
        }
    }
    public function encryptgopayChangeAccount()
    {
        $user = Gopay::where([['status', 'active']])->first();
        if ($user) {
            $user->delete();
            return redirect()->back()->with('success', 'Akun BCA di hapus!');
        } else {
            return redirect()->back()->with('error', 'Akun BCA tidak ditemukan!');
        }
    }
    public function gopayOtp(Request $request)
    {
        $user = Gopay::where([['status', 'active'], ['number', $request->phonenumber]])->first();
        if ($user) {
            return response()->json([
                'status' => false,
                'message' => 'Akun gopay sudah aktif!'
            ], 404);
        } else {
            $gopay = new \App\Libraries\GojekPay();
            $req = $gopay->loginRequest($request->phonenumber);
            if ($req) {
                $decode = json_decode($req);
                if ($decode->success == true) {
                    Gopay::create([
                        'number' => $request->phonenumber,
                        'otp_token' => $decode->data->otp_token,
                        'status' => 'inactive',
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => 'Silahkan cek OTP anda!'
                    ], 200);
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => 'Nomor telepon tidak valid!'
                    ], 404);
                }
            }
        }
    }
    public function gopayLogin(Request $request)
    {
        $user = Gopay::where([['number', $request->phonenumber]])->latest()->first();
        if ($user) {
            $gopay = new \App\Libraries\GojekPay();
            $req = $gopay->getAuthToken($user->otp_token, $request->gopay_otpcode);
            if ($req) {
                $decode = json_decode($req);
                $dbl = $decode->dbl_enabled ?? null;
                if ($dbl) {
                    $user->update([
                        'status' => 'active',
                        'otp_token' => null,
                        'access_token' => Encryption::encrypt($decode->access_token),
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => 'Berhasil login!'
                    ]);
                } else {
                    return response()->json([
                        'status' => 'error',
                        'message' => $decode->errors[0]->message
                    ], 404);
                }
            }
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Anda belum memiliki akun Gopay!'
            ], 404);
        }
    }
    public function encryptGopayMutasi()
    {
        $user = Gopay::where([['status', 'active']])->first();
        if ($user) {
            $gopay = new \App\Libraries\GojekPay(Encryption::decrypt($user->access_token));
            $res = $gopay->getTransactionHistory();
            if ($res) {
                $decode = json_decode($gopay->getTransactionHistory(), true);
                if ($decode != 'null') {
                    $html = '';
                    $html .= '
                    <div class="table-responsive">
                        <table id="datatable4" class="display table-hover" style="width:100%">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Keterangan</th>
                            <th>Balance</th>
                            <th>Date Time</th>
                        </tr>
                        </thead>
                        <tbody>';
                    $data = $decode['data']['success'] ?? null;
                    if ($data) {
                        $cn = count($decode['data']['success']);
                        for ($x = 0; $x <= $cn - 1; $x++) {
                            $data = $decode['data']['success'][$x];
                            if ($data['type'] == 'debit') {
                                $type = '<span class="btn btn-soft-danger btn-sm btn-rounded font-size-13">Kredit</span>';
                            } else if ($data['type'] == 'credit') {
                                $type = '<span class="btn btn-soft-success btn-sm btn-rounded font-size-13">Debit</span>';
                            }
                            $html .= '<tr>
                        <td class="text-center">' . $type . '</td>
                        <td>' . $data['description'] . '</td>
                        <td>Rp ' . number_format($data['amount']['value'], 0, ',', '.') . '</td>
                        <td>' . date('d-m-Y H:i:s', strtotime($data['transacted_at'])) . '</td>
                        </tr>';
                        }
                        $html .= "</tbody>
                    </table></div>
                    <script>
                    $('#datatable4').DataTable();
                    </script>
                    ";
                        return $html;
                    } else {
                        return '<div class="alert alert-danger" style="padding:15px">Data tidak ditemukan!</div>';
                    }
                } else {
                    return '<div class="alert alert-danger" style="padding:15px">Data tidak ditemukan!</div>';
                }
            } else {
                return '<div class="alert alert-danger" style="padding:15px">Tidak ada mutasi!</div>';
            }
        } else {
            return '<div class="alert alert-danger" style="padding:15px">Anda belum memiliki akun Gopay!</div>';
        }
    }
    public function ovoOtp(Request $request)
    {
        $user = Ovo::where([['status', 'active'], ['number', $request->phonenumber]])->first();
        if ($user) {
            return response()->json([
                'status' => false,
                'message' => 'Akun ovo sudah aktif!'
            ], 404);
        } else {
            $ovo = new \App\Libraries\Ovo();
            $request->phonenumber = str_replace('08', '+628', $request->phonenumber);
            $req = $ovo->sendOtp($request->phonenumber);
            if ($req) {
                $decode = json_decode($req);
                if ($decode) {
                    if ($decode->response_message == 'Success') {
                        $decode = $decode->data ?? null;
                        Ovo::create([
                            'number' => $request->phonenumber,
                            'otp_ref_id' => $decode->otp->otp_ref_id,
                            'status' => 'inactive',
                        ]);
                        return response()->json([
                            'status' => true,
                            'message' => 'Silahkan cek OTP anda!'
                        ], 200);
                    } else {
                        return response()->json([
                            'status' => false,
                            'message' => $decode->response_message
                        ], 404);
                    }
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => $decode->response_message
                    ], 404);
                }
            }
        }
    }
    public function ovoLogin(Request $request)
    {
        // $user = Ovo::where([['number', $request->phonenumber]])->latest()->first();
        $request->phonenumber = str_replace('08', '+628', $request->phonenumber);
        $user = Ovo::where([['number', $request->phonenumber]])->latest()->first();
        if ($user) {
            $ovo = new \App\Libraries\Ovo();
            $req = $ovo->OTPVerify($user->number, $user->otp_ref_id, $request->ovo_otpcode);
            if ($req) {
                $decode = json_decode($req);
                $dbl = $decode->data ?? null;
                if ($dbl) {
                    $user->update([
                        'status' => 'active',
                        'otp_token' => $decode->data->otp->otp_token,
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => 'Login berhasil! silahkan masukkan pin dan klik submit'
                    ]);
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => 'Nomor telepon tidak valid!'
                    ], 404);
                }
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Anda belum memiliki akun Ovo!'
            ], 404);
        }
    }
    public function ovoPin(Request $request)
    {
        $request->phonenumber = str_replace('08', '+628', $request->phonenumber);
        $user = Ovo::where([['number', $request->phonenumber]])->latest()->first();
        if ($user) {
            $ovo = new \App\Libraries\Ovo();
            $req = $ovo->getAuthToken($user->number, $user->otp_ref_id, $user->otp_token, $request->ovo_pin);
            if ($req) {
                $decode = json_decode($req);
                $dbl = $decode->data ?? null;
                if ($dbl) {
                    $user->update([
                        'status' => 'active',
                        'access_token' => $decode->data->auth->access_token
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => 'Login berhasil!'
                    ]);
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => $decode->response_message
                    ], 404);
                }
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Anda belum memiliki akun Ovo!'
            ], 404);
        }
    }
    public function encryptOvoMutasi(Request $request)
    {
        $user = Ovo::where([['status', 'active']])->first();
        if ($user) {
            $ovo = new \App\Libraries\Ovo($user->access_token);;
            $res = $ovo->transactionHistory('1', '100');
            if ($res) {
                $decode = json_decode($res, true);
                if ($decode) {
                    $html = '';
                    $html .= '
                    <div class="table-responsive">
                        <table id="datatable4" class="display table-hover" style="width:100%">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Keterangan</th>
                            <th>Balance</th>
                            <th>Waktu</th>
                        </tr>
                        </thead>
                        <tbody>';
                    $data = $decode['data']['status'] ?? null;
                    if ($data == 200) {
                        $cn = count($decode['data']['orders'][0]['complete']);
                        for ($x = 0; $x <= $cn - 1; $x++) {
                            $data = $decode['data']['orders'][0]['complete'][$x];
                            if ($data['emoney_used'] == 0) {
                                $type = '<span class="btn btn-soft-success btn-sm btn-rounded font-size-13">Debit</span>';
                            } else {
                                $type = '<span class="btn btn-soft-danger btn-sm btn-rounded font-size-13">Kredit</span>';
                            }
                            if ($data['emoney_topup'] == 0) {
                                $data['emoney_topup'] = $data['emoney_used'];
                            } else {
                                $data['emoney_topup'] = $data['emoney_topup'];
                            }
                            $html .= '<tr>
                        <td class="text-center">' . $type . '</td>
                        <td>' . $data['desc2'] . ' ' . $data['desc1'] . '</td>
                        <td>Rp ' . number_format($data['emoney_topup'], 0, ',', '.') . '</td>
                        <td>' . date('d-m-Y H:i:s', strtotime($data['transaction_date'] . $data['transaction_time'])) . '</td>
                        </tr>';
                        }
                        $html .= "</tbody>
                    </table></div>
                    <script>
                    $('#datatable4').DataTable();
                    </script>
                    ";
                        return $html;
                    } else {
                        return '<div class="alert alert-danger" style="padding:15px">Data tidak ditemukan!</div>';
                    }
                } else {
                    return '<div class="alert alert-danger" style="padding:15px">Data tidak ditemukan!</div>';
                }
            } else {
                return '<div class="alert alert-danger" style="padding:15px">Tidak ada mutasi!</div>';
            }
        } else {
            return '<div class="alert alert-danger" style="padding:15px">Anda belum memiliki akun Ovo!</div>';
        }
    }
    public function encryptChangeAccount(Request $request)
    {
        if ($request->data == 'bca') {
            BcaUser::truncate();
        } else if ($request->data == 'gopay') {
            Gopay::truncate();
        } else if ($request->data == 'ovo') {
            Ovo::truncate();
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Data tidak ditemukan!'
            ], 404);
        }
        return response()->json([
            'status' => true,
            'message' => 'Berhasil menghapus akun!'
        ]);
    }
    public function ConfigWebsite()
    {
        return view('admin.config-website');
    }
}
