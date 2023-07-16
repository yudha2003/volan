<?php

namespace App\Http\Controllers;

use App\Helpers\Encryption;
use App\Helpers\Medan;
use App\Helpers\HonestSmm;
use App\Helpers\Jap;
use App\Models\BcaUser;
use App\Libraries\Bca;
use App\Libraries\GojekPay;
use App\Models\Announcement;
use App\Models\BcaUser as ModelsBcaUser;
use App\Models\Deposit;
use App\Models\Gopay;
use App\Models\History;
use App\Models\Medans;
use App\Models\Ovo;
use App\Models\RateDollar;
use App\Models\Smm;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class CronjobsController extends Controller
{
    public function layanan_medan()
    {
        $medan = new Medan();
        $service = $medan->services();
        $type = env('MDN_RATETYPE');
        $ratex = env('MDN_RATE');
        if ($service->status == true) {
            foreach ($service as $key => $value) {
                if ($key == 'data') {
                    foreach ($value as $key => $value) {
                        if ($type == 'fixed') {
                            $price = $value->price + $ratex;
                        } else {
                            $untung = round($value->price * $ratex / 100);
                            $price = ceil($value->price + $untung);
                        }
                        $name = str_replace('MP', '', $value->name);
                        $search = Smm::where('service', $value->id)->first();
                        if ($search) {
                            if ($search->category == $value->category && $search->name == $name) {
                                $search->price = $price;
                                $search->save();
                            } else {
                                $search->delete();
                            }
                        } else {
                            $data = [
                                'provider' => 'Medan',
                                'service' => $value->id,
                                'category' => $value->category,
                                'name' => $name,
                                'price' => $price,
                                'min' => $value->min,
                                'max' => $value->max,
                                'description' => $value->description,
                                'type' => $value->type,
                                'refill' => $value->refill,
                                'masa_refill' => $value->masa_refill,
                                'average_time' => $value->average_time,
                            ];
                            Smm::create($data);
                        }
                    }
                }
            }
        }
    }
    public function status()
    {
        $history = History::where('status', '!=', 'done')->get();
        foreach ($history as $row) {
            if ($row->provider == 'Medan') {
                $medan = new Medan();
                $status = $medan->status($row->trxid);
                if ($status->status == true) {
                    // lowercase
                    $status = strtolower($status->data->status);
                    if ($status == 'success') {
                        $status = 'done';
                    } else if ($status == 'processing') {
                        $status = 'process';
                    } else if ($status == 'partial') {
                        $status = 'partial';
                        $user = User::find($row->id);
                        if ($user) {
                            $user->balance = $user->balance + $row->price;
                            $user->omzet = $user->omzet - $row->price;
                            $user->save();
                        }
                    } elseif ($status == 'pending') {
                        $status = 'pending';
                    } else {
                        $status = 'error';
                    }
                    $data = [
                        'status' => $status,
                    ];
                    History::where('id', $row->id)->update($data);
                }
            } else {
                $jap = new Jap();
                $status = $jap->status($row->trxid);
                $status = $status->status ?? null;
                if ($status) {
                    if ($status == 'success') {
                        $status = 'done';
                    } else if ($status == 'processing') {
                        $status = 'process';
                    } else if ($status == 'partial') {
                        $status = 'partial';
                        $user = User::find($row->id);
                        if ($user) {
                            $user->balance = $user->balance + $row->price;
                            $user->omzet = $user->omzet - $row->price;
                            $user->save();
                        }
                    } else {
                        $status = 'error';
                    }
                    $data = [
                        'status' => $status,
                    ];
                    History::where('id', $row->id)->update($data);
                }
            }
        }
    }
    public function search_deposit()
    {
        $search = Deposit::where('status', 'pending')->get();
        if ($search) {
            foreach ($search as $deposit) {
                if ($deposit->expired < date('Y-m-d H:i:s')) {
                    $deposit->status = 'failed';
                    $deposit->save();
                } else {
                    if (Str::lower($deposit->name_payment) == 'ovo') {
                        $mutasi = $this->ovo($deposit);
                        if ($mutasi == '1') {
                            $deposit->status = 'done';
                            $deposit->save();
                            $user = User::find($deposit->user_id);
                            if ($user) {
                                $user->balance = $user->balance + $deposit->diterima;
                                $user->save();
                            }
                        }
                    } else if (Str::lower($deposit->name_payment) == 'gopay') {
                        $mutasi = $this->gopay($deposit);
                        if ($mutasi == '1') {
                            $deposit->status = 'done';
                            $deposit->save();
                            $user = User::find($deposit->user_id);
                            if ($user) {
                                $user->balance = $user->balance + $deposit->diterima;
                                $user->save();
                            }
                        }
                    }
                }
            }
        } else {
            return 'x';
        }
    }
    function ovo($deposit)
    {
        $token = Ovo::where('status', 'active')->first();
        $app = new \App\Libraries\Ovo($token->otp_token);
        $decode = json_decode($app->transactionHistory('1', $deposit->count()), true);
        $counts = count($decode['data']['orders'][0]['complete']);
        for ($i = 0; $i < $counts; $i++) {
            $data = $decode['data']['orders'][0]['complete'][$i];
            if ($deposit->amount == $data['transaction_amount']) {
                return '1';
            }
        }
    }
    function gopay($deposit)
    {
        $token = Gopay::where('status', 'active')->first();
        $gopay = new \App\Libraries\GojekPay($token->otp_token);
        $decode = json_decode($gopay->getTransactionHistory(), true);
        $cn = count($decode['data']['success']);
        for ($x = 0; $x <= $cn - 1; $x++) {
            $data = $decode['data']['success'][$x];
            if ($deposit->amount == $data['amount']['value']) {
                return '1';
            }
        }
    }
    public function layanan_jap()
    {
        $type = env('JAP_RATETYPE');
        $ratex = env('JAP_RATE');
        $api = new Jap();
        $services = $api->services();
        foreach ($services as $row) {
            $cek = Smm::where([['provider', 'jap'], ['service', $row->service]])->first();
            if ($row->refill == false) {
                $refill = 0;
            } else {
                $refill = 1;
            }
            $rate = RateDollar::first();
            $rate = ($rate->rate * $row->rate);
            if ($type == 'fixed') {
                $price = $rate + $ratex;
            } else {
                $untung = round($rate * $ratex / 100);
                $price = ceil($rate + $untung);
            }
            if ($cek) {
                if ($cek->price < $price) {
                    $cek->price = $price;
                    $cek->min = $row->min;
                    $cek->max = $row->max;
                    $cek->save();
                } else {
                    $cek->min = $row->min;
                    $cek->max = $row->max;
                    $cek->save();
                }
            } else {
                Smm::create([
                    'provider' => 'jap',
                    'service' => $row->service,
                    'type' => $row->type,
                    'category' => $row->category,
                    'name' => $row->name,
                    'min' => $row->min,
                    'max' => $row->max,
                    'price' => $price,
                    'refill' => $refill,
                    'average_time' => '-'
                ]);
            }
        }
    }
    public function rate_dollars()
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://www.google.com/search?q=dollar+to+rupiah&oq=dollar+to+rupiah&aqs=chrome..69i57j0l5.1001j0j7&sourceid=chrome&ie=UTF-8");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);
        $dom = new \DOMDocument();
        @$dom->loadHTML($output);
        $xpath = new \DOMXPath($dom);
        $results = $xpath->query('//div[@class="BNeawe iBp4i AP7Wnd"]');
        $data = [];
        foreach ($results as $result) {
            $data[] = $result->nodeValue;
        }
        $data = $data[0];
        $data = explode(' ', $data);
        $data = $data[0];
        $data = explode(',', $data);
        $data = $data[0];
        $data = str_replace('.', '', $data);
        $data = explode('.', $data);
        $data = $data[0];
        $rate = RateDollar::where('id', '1')->first();
        if ($rate) {
            $rate->rate = $data;
            $rate->save();
        } else {
            $rate = new RateDollar();
            $rate->rate = $data;
            $rate->save();
        }
    }
}
