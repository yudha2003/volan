<?php

use App\Helpers\Encryption;
use App\Helpers\Jap;
use App\Helpers\Medan;
use App\Models\Deposit;
use App\Models\Favorit;
use App\Models\History;
use App\Models\HistoryRefill;
use App\Models\LogBalance;
use App\Models\Smm;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('profile', function (Request $request) {
    $secret = Encryption::encrypt($request->secret_key);
    $api = Encryption::encrypt($request->api_key);
    if (isset($secret) && isset($api)) {
        $user = User::where([['secret_key', $secret], ['api_key', $api]])->first();
        if ($user) {
            return response()->json([
                'status' => true,
                'data' => [
                    "full_name" => $user->name,
                    "username" => $user->username,
                    'email' => $user->email,
                    "balance" => $user->balance
                ]
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'data' => 'User Not Found',
            ], 404);
        }
    } else {
        return response()->json([
            'status' => false,
            'data' => 'Secret Key & Api harus di isi!'
        ], 403);
    }
});
Route::post('services', function (Request $request) {
    $secret = Encryption::encrypt($request->secret_key);
    $api = Encryption::encrypt($request->api_key);
    if (isset($secret) && isset($api)) {
        $user = User::where([['secret_key', $secret], ['api_key', $api]])->first();
        if ($user) {
            if ($request->service_fav == true) {
                $fav = Favorit::all();
                $enc = [];
                foreach ($fav as $filter) {
                    $smm = Smm::where([['service', $filter->service_id], ['category', $filter->category]])->get();
                    if (!$smm->first()) {
                        $fav = Favorit::find($filter->id);
                        $fav->delete();
                    } else {
                        foreach ($smm as $data) {
                            $filteredData = $data->toArray();
                            unset($filteredData['provider']);
                            $enc[] = $filteredData;
                        }
                    }
                }
                return response()->json([
                    'status' => true,
                    'data' => $enc,
                ], 200);
            } else {
                $smm = Smm::all();
                $encs = [];
                foreach ($smm as $data) {
                    $filteredData = $data->toArray();
                    unset($filteredData['provider']);
                    $encs[] = $filteredData;
                }
                return response()->json([
                    'status' => true,
                    'data' => $encs,
                ], 200);
            }
        } else {
            return response()->json([
                'status' => false,
                'data' => 'User Not Found',
            ], 404);
        }
    } else {
        return response()->json([
            'status' => false,
            'data' => 'Secret Key & Api harus di isi!'
        ], 403);
    }
});
Route::post('order', function (Request $request) {
    $secret = Encryption::encrypt($request->secret_key);
    $api = Encryption::encrypt($request->api_key);
    if (isset($secret) && isset($api)) {
        $user = User::where([['secret_key', $secret], ['api_key', $api]])->first();
        if ($user) {
            $service = Smm::where('service', $request->service)->first();
            if ($service) {
                if ($request->quantity < $service->min) {
                    return response()->json([
                        'status' => false,
                        'data' => 'Minimal pesanan adalah ' . $service->min,
                    ], 404);
                } elseif ($request->quantity > $service->max) {
                    return response()->json([
                        'status' => false,
                        'data' => 'Maksimal pesanan adalah ' . $service->max,
                    ], 404);
                } else {
                    $total = ($service->price / 1000) * $request->quantity;
                    $total = ceil($total);
                    if ($user->balance < $total) {
                        return response()->json([
                            'status' => false,
                            'data' => 'Saldo anda tidak cukup',
                        ], 404);
                    } else {
                        if ($service->provider == 'Medan') {
                            $api = new Medan();
                            if ($request->custom_comments) {
                                $smm = $api->order(array(
                                    'service' => $service->service, // id layanan 
                                    'target' => $request->target, // target pesanan
                                    'custom_comments' => $request->custom_comments,
                                ));
                                $orderid = $smm->data->id ?? null;
                            } elseif ($request->link_post) {
                                $smm = $api->order(array(
                                    'service' => $service->service, // id layanan 
                                    'target' => $request->target, // target pesanan
                                    'custom_link' => $request->custom_link,
                                ));
                                $orderid = $smm->data->id ?? null;
                            } else {
                                $smm = $api->order(array(
                                    'service' => $service->service, // id layanan 
                                    'target' => $request->target, // target pesanan
                                    'quantity' => $request->quantity // jumlah pesan
                                ));
                                $orderid = $smm->data->id ?? null;
                            }
                        } else {
                            $smm = new Jap();
                            if ($request->custom_comments) {
                                $smm = $smm->order(['service' => $service->service, 'link' => $request->target, 'comments' => $request->custom_comments]);
                            } else {
                                $smm = $smm->order(['service' => $service->service, 'link' => $request->target, 'quantity' => $request->quantity, 'runs' => 2, 'interval' => 5]);
                            }
                            $orderid = $smm->order ?? null;
                        }
                        if ($orderid == null) {
                            return response()->json([
                                'type' => false,
                                'data' => 'Gagal membuat pesanan',
                            ]);
                        } else {
                            $data = [
                                'user_id' => $user->id,
                                'trxid' => $orderid,
                                'provider' => $service->provider,
                                'type' => $service->type,
                                'layanan' => $service->name,
                                'target' => $request->target,
                                'quantity' => $request->quantity,
                                'price' => $total,
                                'custom_comments' => $request->custom_comments ?? '',
                                'custom_link' => $request->custom_link ?? '',
                                'start_count' => 0,
                                'remains' => 0,
                                'status' => 'pending',
                                'refill' => $service->refill
                            ];
                            History::create($data);
                            $data = [
                                'user_id' => $user->id,
                                'type' => 'Kredit',
                                'kategori' => 'order',
                                'jumlah' => $total,
                                'before_balance' => $user->balance,
                                'after_balance' => $user->balance - $total,
                                'description' => 'Pembelian ' . $service->name . ' Berhasil melalui API'
                            ];
                            LogBalance::create($data);
                            $user->balance = $user->balance - $total;
                            $user->omzet = $user->omzet + $total;
                            $user->save();
                            return response()->json([
                                'status' => true,
                                'data' => [
                                    'id' => $orderid,
                                    'price' => $total,
                                ],
                            ]);
                        }
                    }
                }
            } else {
                return response()->json([
                    'status' => false,
                    'data' => 'Service Not Found',
                ], 404);
            }
        } else {
            return response()->json([
                'status' => false,
                'data' => 'User Not Found',
            ], 404);
        }
    } else {
        return response()->json([
            'status' => false,
            'data' => 'Secret Key & Api harus di isi!'
        ], 403);
    }
});
Route::post('status', function (Request $request) {
    $secret = Encryption::encrypt($request->secret_key);
    $api = Encryption::encrypt($request->api_key);
    if (isset($secret) && isset($api)) {
        $user = User::where([['secret_key', $secret], ['api_key', $api]])->first();
        if ($user) {
            $history = History::where('trxid', $request->id)->first();
            if ($history) {
                if ($history->provider == 'Medan') {
                    $medan = new Medan();
                    $status = $medan->status($history->trxid);
                    if ($status->status == true) {
                        // lowercase
                        $stat = strtolower($status->data->status);
                        if ($stat == 'success') {
                            $stat = 'done';
                        } else if ($stat == 'processing') {
                            $stat = 'process';
                        } else if ($stat == 'partial') {
                            $stat = 'partial';
                            $user = User::find($request->id);
                            if ($user) {
                                $user->balance = $user->balance + $history->price;
                                $user->omzet = $user->omzet - $history->price;
                                $user->save();
                            }
                        } elseif ($stat == 'pending') {
                            $stat = 'pending';
                        } else {
                            $stat = 'error';
                        }
                        if ($history->status == 'pending' or $history->status == 'process') {
                            $data = [
                                'status' => $stat,
                            ];
                            History::where('trxid', $request->id)->update($data);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => [
                                'id' => $history->trxid,
                                'status' => $status->data->status,
                                'start_count' => $status->data->start_count,
                                'remains' => $status->data->remains,
                            ]
                        ]);
                    } else {
                        return response()->json([
                            'status' => false,
                            'data' => 'Transaction Not Found',
                        ], 404);
                    }
                } else {
                    $jap = new Jap();
                    $datas = $jap->status($history->trxid);
                    $status = $datas->status ?? null;
                    if ($status) {
                        if ($status == 'success') {
                            $status = 'done';
                        } else if ($status == 'processing') {
                            $status = 'process';
                        } else if ($status == 'partial') {
                            $status = 'partial';
                            $user = User::find($history->id);
                            if ($user) {
                                $user->balance = $user->balance + $history->price;
                                $user->omzet = $user->omzet - $history->price;
                                $user->save();
                            }
                        } else {
                            $status = 'error';
                        }
                        if ($history->status == 'pending') {
                            $data = [
                                'status' => $status,
                            ];
                            History::where('trxid', $request->id)->update($data);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => [
                                'id' => $history->trxid,
                                'status' => $datas->status,
                                'start_count' => $datas->start_count,
                                'remains' => $datas->remains,
                            ]
                        ]);
                    }
                }
            } else {
                return response()->json([
                    'status' => false,
                    'data' => 'Transaction Not Found',
                ], 404);
            }
        } else {
            return response()->json([
                'status' => false,
                'data' => 'User Not Found',
            ], 404);
        }
    } else {
        return response()->json([
            'status' => false,
            'data' => 'Secret Key & Api harus di isi!'
        ], 403);
    }
});
Route::post('refill', function (Request $request) {
    $secret = Encryption::encrypt($request->secret_key);
    $api = Encryption::encrypt($request->api_key);
    if (isset($secret) && isset($api)) {
        $user = User::where([['secret_key', $secret], ['api_key', $api]])->first();
        if ($user) {
            $history = History::where('trxid', $request->id_order)->first();
            if ($history) {
                if ($history->provider == 'Medan') {
                    $medan = new Medan();
                    $refill = $medan->refill($history->trxid);
                    return json_encode($refill);
                } else {
                    $jap = new Jap();
                    $refill = $jap->refill($history->trxid);
                    $error = $refill->error ?? null;
                    if ($error) {
                        return response()->json([
                            'status' => false,
                            'data' => 'Transaction not found',
                        ]);
                    } else {
                        return response()->json([
                            'status' => true,
                            'data' => [
                                'id_refill' => $refill->refill,
                            ]
                        ]);
                    }
                }
            } else {
                return response()->json([
                    'status' => false,
                    'data' => 'Transaction Not Found',
                ], 404);
            }
        } else {
            return response()->json([
                'status' => false,
                'data' => 'User Not Found',
            ], 404);
        }
    } else {
        return response()->json([
            'status' => false,
            'data' => 'Secret Key & Api harus di isi!'
        ], 403);
    }
});
Route::post('refill_status', function (Request $request) {
    $secret = Encryption::encrypt($request->secret_key);
    $api = Encryption::encrypt($request->api_key);
    if (isset($secret) && isset($api)) {
        $user = User::where([['secret_key', $secret], ['api_key', $api]])->first();
        if ($user) {
            $history = HistoryRefill::where('trxid', $request->id_refill)->first();
            if ($history) {
                if ($history->provider == 'Medan') {
                    $medan = new Medan();
                    $status = $medan->refill_status($request->id_refill);
                    if ($status->status == true) {
                        $stat = strtolower($status->data->status);
                        if ($stat == 'success') {
                            $stat = 'done';
                        } else if ($stat == 'processing') {
                            $stat = 'process';
                        } else if ($stat == 'partial') {
                            $stat = 'partial';
                            $user = User::find($request->id);
                            if ($user) {
                                $user->balance = $user->balance + $history->price;
                                $user->omzet = $user->omzet - $history->price;
                                $user->save();
                            }
                        } elseif ($stat == 'pending') {
                            $stat = 'pending';
                        } else {
                            $stat = 'error';
                        }
                        if ($history->status == 'pending' or $history->status == 'process') {
                            $data = [
                                'status' => $stat,
                            ];
                            History::where('trxid', $request->id)->update($data);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => [
                                'status' => $status->data->status,
                            ]
                        ]);
                    } else {
                        return response()->json([
                            'status' => false,
                            'data' => 'Transaction not found',
                        ]);
                    }
                } else {
                    $jap = new Jap();
                    $status = $jap->refillStatus($request->id_refill);
                    $s = $status->status ?? null;
                    if ($s) {
                        $stat = strtolower($status->status);
                        if ($stat == 'completed') {
                            $stat = 'done';
                            $data = [
                                'status' => $stat,
                            ];
                            History::where('trxid', $request->id)->update($data);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => [
                                'status' => $status->status,
                            ]
                        ]);
                    } else {
                        return response()->json([
                            'status' => false,
                            'data' => 'Transaction not found',
                        ]);
                    }
                }
            } else {
                return response()->json([
                    'status' => false,
                    'data' => 'Transaction Not Found',
                ], 404);
            }
        } else {
            return response()->json([
                'status' => false,
                'data' => 'User Not Found',
            ], 404);
        }
    } else {
        return response()->json([
            'status' => false,
            'data' => 'Secret Key & Api harus di isi!'
        ], 403);
    }
});

Route::post('callback/tripay', function () {
    $json = file_get_contents('php://input');
    $decode = json_decode($json);
    $privateKey = env('PRIVATEKEY_TRIPAY');
    $signature = hash_hmac('sha256', $json, $privateKey);
    $deposit = Deposit::where([['trxid', $decode->merchant_ref], ['status', 'pending']])->first();
    if ($deposit) {
        if ($deposit->amount == $decode->total_amount && $decode->status == 'PAID') {
            $deposit->status = 'done';
            $deposit->save();
            $user = User::find($deposit->user_id);
            if ($user) {
                $user->balance = $user->balance + $deposit->diterima;
                $user->save();
            }
        } elseif ($decode->status == 'EXPIRED') {
            $deposit->status = 'canceled';
            $deposit->save();
        }
    }
});
