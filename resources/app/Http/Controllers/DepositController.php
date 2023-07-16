<?php

namespace App\Http\Controllers;

use App\Libraries\Tripay;
use App\Models\Configs;
use App\Models\Deposit;
use App\Models\MetodePembayaran;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class DepositController extends Controller
{
    public function deposit()
    {
        return view('deposit.new');
    }
    public function get_methode(Request $request)
    {
        $channel = MetodePembayaran::where('process', $request->id)->get();
        if ($request->_token) {
            if ($channel->first()) {
                printf('<option value="">Select one</option>');
                foreach ($channel as $row) {
                    printf('<option value="%s">%s</option>', $row->id, $row->name);
                }
            } else {
                printf('<option value="" selected disabled>Pembayaran tidak tersedia...</option>');
            }
        } else {
            echo 'No direct script access allowed';
        }
    }
    public function get_fee(Request $request)
    {
        $channel = MetodePembayaran::where('id', $request->metod)->first();
        if ($request->_token) {
            if ($channel) {
                if ($channel->rate_type == 'fixed') {
                    $jmlh = 'Nominal + Tax system';
                    $tax = ' + Tax System';
                    $rt = number_format($channel->rate, 0, ",", ".");
                } else {
                    $fee = ($request->nominal / 100) * $channel->rate;
                    $jmlh = 'Rp ' . number_format($request->nominal + $fee, 0, ",", ".");
                    $tax = '';
                    $rt = $channel->rate . '%';
                }
                return response()->json([
                    'status' => true,
                    'fee' => '0',
                    'rate' => $rt,
                    'get' => 'Rp ' . number_format($request->nominal, 0, ",", ".") . $tax,
                    'jmlh' => $jmlh,
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Pembayaran tidak tersedia...',
                ]);
            }
        } else {
            echo 'No direct script access allowed';
        }
    }
    public function proses_deposit(Request $request)
    {
        $metode = MetodePembayaran::find($request->metod);
        $trxid = date('YmdHis') . rand(1000, 9999);
        if ($metode) {
            $deposit = Deposit::where('user_id', auth()->user()->id)->where('status', 'pending')->first();
            if ($deposit) {
                return redirect('deposit/invoice/' . $deposit->trxid);
            } else {
                if ($request->nominal < 10000) {
                    return redirect()->back()->with('error', 'Minimal deposit Rp 10.000');
                } else {
                    if ($metode->rate == '0') {
                        $fee = rand(0, 1000);
                        $fee = $request->nominal + $fee;
                        $diterima = $fee;
                    } else {
                        $fee = round($request->nominal * $metode->rate / 100);
                        $fee = $request->nominal + $fee;
                        $diterima = $request->nominal;
                    }
                    if ($metode->rate_type == 'fixed') {
                        if ($metode->rate == 0) {
                            $fee = rand(1, 99);
                        } else {
                            $fee = $metode->rate;
                        }
                        $fee = $request->nominal + $fee;
                        $diterima = $request->nominal;
                    } else {
                        if ($metode->rate == 0) {
                            $fee = rand(1, 99);
                        } else {
                            $fee = round($request->nominal * $fee / 100);
                        }
                        $fee = $request->nominal + $fee;
                        $diterima = $request->nominal;
                    }
                    if (strtolower($metode->provider) == 'tripay') {
                        $config = Configs::first();
                        if ($config) {
                            $qris = new Tripay;
                            $qris = $qris->production($config->merchant_code, $trxid, $metode->code, $fee, Auth::user()->id);
                            $decode = json_decode($qris);
                            if ($decode->success == true) {
                                Deposit::create([
                                    'user_id' => auth()->user()->id,
                                    'trxid' => $trxid,
                                    'process' => $metode->process,
                                    'code' => $metode->code,
                                    'name_payment' => $metode->name,
                                    'account_number' => Str::lower($metode->account_number),
                                    'description' => $metode->description,
                                    'amount' => $fee,
                                    'diterima' => $diterima,
                                    'expired' => Carbon::now()->addHours(3),
                                    'payment_url' => $decode->data->checkout_url,
                                    'status' => 'pending',
                                ]);
                                return redirect()->to($decode->data->checkout_url);
                            } else {
                                return redirect()->back()->with('error', 'Gagal memproses pembayaran');
                            }
                        } else {
                            return redirect()->back()->with('error', 'Pembayaran tidak tersedia...');
                        }
                    } else {
                        Deposit::create([
                            'user_id' => auth()->user()->id,
                            'trxid' => $trxid,
                            'process' => $metode->process,
                            'code' => $metode->code,
                            'name_payment' => $metode->name,
                            'account_number' => Str::lower($metode->account_number),
                            'description' => $metode->description,
                            'amount' => $fee,
                            'diterima' => $diterima,
                            'expired' => Carbon::now()->addHours(3),
                            'status' => 'pending',
                        ]);
                        return redirect('deposit/invoice/' . $trxid);
                    }
                }
            }
        } else {
            return redirect()->back()->with('error', 'Pembayaran tidak tersedia...');
        }
    }
    public function invoice(Deposit $deposit)
    {

        $channel = MetodePembayaran::where('name', $deposit->name_payment)->first();
        if ($channel) {
            return view('deposit.invoice', compact('deposit', 'channel'));
        } else {
            abort(404);
        }
    }
    public function cancel(Request $request)
    {
        $deposit = Deposit::where([['trxid', $request->trxid], ['user_id', Auth::user()->id], ['status', 'pending']])->first();
        if ($deposit) {
            return view('deposit.cancel', compact('deposit'));
        } else {
            return '<div class="alert alert-danger">Transaksi tidak ditemukan</div>';
        }
    }
    public function update_status_deposit(Request $request)
    {
        $deposit = Deposit::where([['trxid', $request->id], ['user_id', Auth::user()->id], ['status', 'pending']])->first();
        if ($deposit) {
            // Hash password
            $password = $request->password;
            $hash = Auth::user()->password;
            if (password_verify($password, $hash)) {
                $deposit->update([
                    'status' => 'canceled',
                ]);
                return redirect()->route('invoice', $deposit->trxid)->with('success', 'Transaksi berhasil dibatalkan');
            } else {
                return redirect()->back()->with('error', 'Password salah');
            }
        } else {
            return redirect()->route('invoice', $request->id)->with('error', 'Transaksi tidak ditemukan');
        }
    }
    public function history()
    {
        return view('deposit.history');
    }
}
