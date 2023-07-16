<?php

namespace App\Http\Livewire\Order;

use App\Helpers\Jap;
use App\Helpers\Medan;
use App\Models\History;
use App\Models\Smm;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class MassalGeneral extends Component
{
    // General
    public $kategoris, $layanan, $harga = 0, $deskripsi, $min = 0, $max = 0, $target, $custom_comments, $link_post, $type, $average_time, $jumlah_pesanan, $total_harga = 0;
    // Favorit
    public $kategori_fav, $layanan_fav, $harga_fav = 0, $deskripsi_fav, $min_fav = 0, $max_fav = 0, $target_fav, $custom_comments_fav, $link_post_fav, $type_fav, $average_time_fav, $jumlah_pesanan_fav, $total_harga_fav = 0;
    public $category, $filterCategorys, $listLayanan;
    public $tab = 'Umum';
    public function  activated($tab)
    {
        $this->tab = $tab;
    }
    public function order()
    {

        $this->validate(
            [
                'layanan' => 'required',
                'target' => 'required',
            ],
            [
                'layanan.required' => 'Layanan tidak boleh kosong',
                'target.required' => 'Target tidak boleh kosong',
            ]
        );
        $service = Smm::where('service', $this->layanan)->first();
        if ($service) {
            if (!$this->target) {
                session()->flash('error', 'Target tidak boleh kosong');
                return;
            }
            $explode = explode("\n", $this->target);
            $jumlah = '';
            foreach ($explode as $value) {
                $expl = explode('|', $value);
                if (count($expl) % 2 == 0) {
                    $jumlah .= $expl[1] . ',';
                }
            }
            $explode = explode(',', $jumlah);
            $total = 0;
            foreach ($explode as $value) {
                // check integer
                if (is_numeric($value)) {
                    $total += (int)$value;
                }
            }
            $harga = str_replace(['.', ','], '', $this->harga);
            $total = ((int) $harga / 1000) * $total;
            $total = ceil($total);
            if (Auth::user()->balance < $total) {
                session()->flash('error', 'Saldo tidak mencukupi');
                return;
            } else {
                $explode = explode("\n", $this->target);
                $id = '';
                $targets = '';
                $quantity = '';
                foreach ($explode as $value) {
                    $expl = explode('|', $value);
                    $jumlah = $expl[1] ?? null;
                    $target = $expl[0];
                    if ($service->provider == 'Medan') {
                        $api = new Medan();
                        if ($this->custom_comments) {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $target, // target pesanan
                                'custom_comments' => $this->custom_comments,
                            ));
                            $orderid = $smm->data->id ?? null;
                        } elseif ($this->link_post) {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $target, // target pesanan
                            ));
                            $orderid = $smm->data->id ?? null;
                        } else {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $target, // target pesanan
                                'quantity' => $jumlah // jumlah pesan
                            ));
                            $orderid = $smm->data->id ?? null;
                        }
                    } else {
                        $smm = new Jap();
                        if ($this->custom_comments) {
                            $smm = $smm->order(['service' => $service->service, 'link' => $target, 'comments' => $this->custom_comments]);
                        } else {
                            $smm = $smm->order(['service' => $service->service, 'link' => $target, 'quantity' => $this->jumlah_pesanan, 'runs' => 2, 'interval' => 5]);
                        }
                        $orderid = $smm->order ?? null;
                    }
                    if ($orderid == null) {
                        session()->flash('error', 'Terjadi kesalahan saat memproses pesanan dengan target ' . $target . ', Silahkan coba beberapa saat lagi');
                    } else {
                        $total = ($service->price / 1000) * $jumlah;
                        $user = User::find(Auth::user()->id);
                        $user->balance = $user->balance - $total;
                        $user->omzet = $user->omzet + $total;
                        $user->save();
                        $data = [
                            'user_id' => Auth::user()->id,
                            'trxid' => $orderid,
                            'provider' => $service->provider,
                            'type' => $service->type,
                            'layanan' => $service->name,
                            'target' => $target,
                            'quantity' => $jumlah,
                            'price' => $total,
                            'custom_comments' => $this->custom_comments ?? '',
                            'custom_link' => $this->custom_link ?? '',
                            'start_count' => 0,
                            'remains' => 0,
                            'status' => 'pending',
                            'refill' => $service->refill
                        ];
                        History::create($data);
                        $id .= ' ' . $orderid  . ' | ';
                        $targets .= ' ' . $target . ' | ';
                        $quantity .= ' ' . $jumlah . ' | ';
                    }
                }
                $ids = explode('|', trim($id));
                array_pop($ids);
                $quantitys = explode('|', trim($quantity));
                array_pop($quantitys);
                $targetss = explode('|', trim($targets));
                array_pop($targetss);
                $ids = count($ids);
                $quantitys = count($quantitys);
                $targetss = count($targetss);
                if ($ids == '1') {
                    $id = str_replace('|', '', $id);
                }
                if ($quantitys == '1') {
                    $quantity = str_replace('|', '', $quantity);
                }
                if ($targetss == '1') {
                    $targets = str_replace('|', '', $targets);
                }
                session()->flash('success', 'Pesanan berhasil dibuat <br>
                ID Pesanan : ' . $id . '<br>
                Layanan : ' . $service->name . '<br>
                Target : ' . $targets . '<br>
                Jumlah : ' . $quantity . '<br>
                ------------------------------------------------- <br>
                Date : ' . date('Y-m-d H:i:s') . '
                ');
            }
        } else {
            session()->flash('error', 'Service not found!');
            return;
        }
    }
    public function order_fav()
    {

        $this->validate(
            [
                'layanan_fav' => 'required',
                'target_fav' => 'required',
            ],
            [
                'layanan_fav.required' => 'Layanan tidak boleh kosong',
                'target_fav.required' => 'Target tidak boleh kosong',
            ]
        );
        $service = Smm::where('service', $this->layanan_fav)->first();
        if ($service) {
            if (!$this->target_fav) {
                session()->flash('error', 'Target tidak boleh kosong');
                return;
            }
            $explode = explode("\n", $this->target_fav);
            $jumlah = '';
            foreach ($explode as $value) {
                $expl = explode('|', $value);
                if (count($expl) % 2 == 0) {
                    $jumlah .= $expl[1] . ',';
                }
            }
            $explode = explode(',', $jumlah);
            $total = 0;
            foreach ($explode as $value) {
                // check integer
                if (is_numeric($value)) {
                    $total += (int)$value;
                }
            }
            $harga = str_replace(['.', ','], '', $this->harga_fav);
            $total = ((int) $harga / 1000) * $total;
            $total = ceil($total);
            if (Auth::user()->balance < $total) {
                session()->flash('error', 'Saldo tidak mencukupi');
                return;
            } else {
                $explode = explode("\n", $this->target);
                $id = '';
                $targets = '';
                $quantity = '';
                foreach ($explode as $value) {
                    $expl = explode('|', $value);
                    $jumlah = $expl[1] ?? null;
                    $target = $expl[0];
                    if (!$jumlah) {
                        session()->flash('error', 'Jumlah Pesanan harus di isi!');
                    } elseif (!$target) {
                        session()->flash('error', 'Target harus di isi!');
                    } else {
                        if ($service->provider == 'Medan') {
                            $api = new Medan();
                            if ($this->custom_comments_fav) {
                                $smm = $api->order(array(
                                    'service' => $service->service, // id layanan 
                                    'target' => $target, // target pesanan
                                    'custom_comments' => $this->custom_comments_fav,
                                ));
                                $orderid = $smm->data->id ?? null;
                            } elseif ($this->link_post_fav) {
                                $smm = $api->order(array(
                                    'service' => $service->service, // id layanan 
                                    'target' => $target, // target pesanan
                                    'custom_link' => $this->link_post_fav,
                                ));
                                $orderid = $smm->data->id ?? null;
                            } else {
                                $smm = $api->order(array(
                                    'service' => $service->service, // id layanan 
                                    'target' => $target, // target pesanan
                                    'quantity' => $jumlah // jumlah pesan
                                ));
                                $orderid = $smm->data->id ?? null;
                            }
                        } else {
                            $smm = new Jap();
                            if ($this->custom_comments) {
                                $smm = $smm->order(['service' => $service->service, 'link' => $this->target_fav, 'comments' => $this->custom_comments_fav]);
                            } else {
                                $smm = $smm->order(['service' => $service->service, 'link' => $this->target_fav, 'quantity' => $jumlah, 'runs' => 2, 'interval' => 5]);
                            }
                            $orderid = $smm->order ?? null;
                        }
                        if ($orderid == null) {
                            session()->flash('error', 'Terjadi kesalahan saat memproses pesanan dengan target ' . $target . ', Silahkan coba beberapa saat lagi');
                        } else {
                            $total = ($service->price / 1000) * $jumlah;
                            $user = User::find(Auth::user()->id);
                            $user->balance = $user->balance - $total;
                            $user->omzet = $user->omzet + $total;
                            $user->save();
                            $data = [
                                'user_id' => Auth::user()->id,
                                'trxid' => $orderid,
                                'provider' => $service->provider,
                                'type' => $service->type,
                                'layanan' => $service->name,
                                'target' => $target,
                                'quantity' => $jumlah,
                                'price' => $total,
                                'custom_comments' => $this->custom_comments ?? '',
                                'custom_link' => $this->custom_link ?? '',
                                'start_count' => 0,
                                'remains' => 0,
                                'status' => 'pending',
                                'refill' => $service->refill
                            ];
                            History::create($data);
                            $id .= ' ' . $orderid  . ' | ';
                            $targets .= ' ' . $target . ' | ';
                            $quantity .= ' ' . $jumlah . ' | ';
                        }
                    }
                }
                $ids = explode('|', trim($id));
                array_pop($ids);
                $quantitys = explode('|', trim($quantity));
                array_pop($quantitys);
                $targetss = explode('|', trim($targets));
                array_pop($targetss);
                $ids = count($ids);
                $quantitys = count($quantitys);
                $targetss = count($targetss);
                if ($ids == '1') {
                    $id = str_replace('|', '', $id);
                }
                if ($quantitys == '1') {
                    $quantity = str_replace('|', '', $quantity);
                }
                if ($targetss == '1') {
                    $targets = str_replace('|', '', $targets);
                }
                session()->flash('success', 'Pesanan berhasil dibuat <br>
                ID Pesanan : ' . $id . '<br>
                Layanan : ' . $service->name . '<br>
                Target : ' . $targets . '<br>
                Jumlah : ' . $quantity . '<br>
                ------------------------------------------------- <br>
                Date : ' . date('Y-m-d H:i:s') . '
                ');
            }
        } else {
            session()->flash('error', 'Service not found!');
            return;
        }
    }
    public function refresh_fav()
    {
        $this->layanan_fav = '';
        $this->harga_fav = 0;
        $this->deskripsi_fav = '';
        $this->min_fav = 0;
        $this->max_fav = 0;
        $this->target_fav = '';
        $this->custom_comments_fav = '';
        $this->link_post_fav = '';
        $this->type_fav = '';
        $this->average_time_fav = '';
        $this->jumlah_pesanan_fav = '';
        $this->total_harga_fav = 0;
    }
    public function render()
    {
        $this->umum();
        $this->favorit();
        if ($this->filterCategorys != null) {
            if ($this->filterCategorys == 'Semua') {
                $kategori  = Smm::orderBy('category', 'asc')->get();
            } else {
                $kategori = Smm::distinct()->where('category', 'like', '%' . $this->filterCategorys . '%')->orderBy('category', 'asc')->get('category');
            }
        } else {
            $kategori = Smm::distinct()->orderBy('category', 'asc')->get('category');
        }
        return view('livewire.order.massal-general', compact('kategori'));
    }
    private function umum()
    {
        if ($this->target) {
            $explode = explode("\n", $this->target);
            $jumlah = '';
            foreach ($explode as $value) {
                $expl = explode('|', $value);
                if (count($expl) % 2 == 0) {
                    // array_push($jumlah, $expl[1]);
                    $jumlah .= $expl[1] . ',';
                }
            }
            $explode = explode(',', $jumlah);
            $total = 0;
            foreach ($explode as $value) {
                // check integer
                if (is_numeric($value)) {
                    $total += (int)$value;
                }
            }
            $harga = str_replace(['.', ','], '', $this->harga);
            $int = ((int) $harga / 1000) * $total;
            $int = ceil($int);
            $this->total_harga = number_format($int, 0, ',', '.');
        }
        if ($this->layanan) {
            $smm = Smm::where('service', $this->layanan)->first();
            if ($smm) {
                $this->harga = number_format($smm->price, 0, ',', '.');
                $this->deskripsi = $smm->description;
                $this->min = $smm->min;
                $this->max = $smm->max;
                $this->type = $smm->type;
                // remove text jumlah pesan rata rata di average time
                $this->average_time = $smm->average_time;
                if ($smm->average_time == '-') {
                    $this->average_time = 'Tidak cukup data';
                }
            } else {
                $this->dispatchBrowserEvent('swal:modal', [
                    'type' => 'error',
                    'title' => 'Layanan Tidak Ditemukan',
                    'text' => 'Layanan yang anda cari tidak ditemukan, silahkan coba lagi.',
                ]);
                $this->layanan = null;
            }
        }
    }
    private function favorit()
    {
        if ($this->target_fav) {
            $explode = explode("\n", $this->target_fav);
            $jumlah = '';
            foreach ($explode as $value) {
                $expl = explode('|', $value);
                if (count($expl) % 2 == 0) {
                    // array_push($jumlah, $expl[1]);
                    $jumlah .= $expl[1] . ',';
                }
            }
            $explode = explode(',', $jumlah);
            $total = 0;
            foreach ($explode as $value) {
                // check integer
                if (is_numeric($value)) {
                    $total += (int)$value;
                }
            }
            $harga = str_replace(['.', ','], '', $this->harga_fav);
            $int = ((int) $harga / 1000) * $total;
            $int = ceil($int);
            $this->total_harga_fav = number_format($int, 0, ',', '.');
        }
        if ($this->layanan_fav) {
            $smm = Smm::where('service', $this->layanan_fav)->first();
            if ($smm) {
                $this->harga_fav = number_format($smm->price, 0, ',', '.');
                $this->deskripsi_fav = $smm->description;
                $this->min_fav = $smm->min;
                $this->max_fav =  number_format($smm->max, 0, ',', '.');
                $this->type_fav = $smm->type;
                // remove text jumlah pesan rata rata di average time
                $this->average_time_fav = $smm->average_time;
                if ($smm->average_time_fav == '-') {
                    $this->average_time_fav = 'Tidak cukup data';
                }
            } else {
                $this->dispatchBrowserEvent('swal:modal', [
                    'type' => 'error',
                    'title' => 'Layanan Tidak Ditemukan',
                    'text' => 'Layanan yang anda cari tidak ditemukan, silahkan coba lagi.',
                ]);
                $this->layanan_fav = null;
            }
        }
    }
}
