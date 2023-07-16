<?php

namespace App\Http\Livewire\Order;

use App\Helpers\Jap;
use App\Helpers\Medan;
use App\Models\Favorit;
use App\Models\History;
use App\Models\LogBalance;
use App\Models\Smm;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class SingleGeneral extends Component
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
    public function refresh()
    {
        // clear input
        $this->kategoris = '';
        $this->layanan = '';
        $this->harga = 0;
        $this->deskripsi = '';
        $this->min = 0;
        $this->max = 0;
        $this->type = '';
        $this->jumlah_pesanan = '';
        $this->total_harga = 0;
        $this->category = '';
        $this->listLayanan = '';
    }
    public function filterCategory($category)
    {
        $this->filterCategorys = $category;
    }
    public function setPriceKoment()
    {
        $lines = explode("\n", $this->custom_comments);
        $count = 0;

        foreach ($lines as $line) {
            // Menghapus karakter kosong di awal dan akhir baris
            $trimmed_line = trim($line);

            // Mengecek apakah baris tidak kosong
            if (!empty($trimmed_line)) {
                $count++;
            }
        }
        $this->jumlah_pesanan = $count;
        $harga = str_replace(['.', ','], '', $this->harga);
        $total = ($harga / 1000) * $this->jumlah_pesanan;
        $total = ceil($total);
        $this->total_harga = number_format($total, 0, ',', '.');
    }
    public function order()
    {
        $this->validate(
            [
                'layanan' => 'required',
                'target' => 'required',
                'jumlah_pesanan' => 'required',
            ],
            [
                'layanan.required' => 'Layanan tidak boleh kosong',
                'target.required' => 'Target tidak boleh kosong',
                'jumlah_pesanan.required' => 'Quantity tidak boleh kosong',
            ]
        );
        $service = Smm::where('service', $this->layanan)->first();
        if ($service) {
            if ($this->jumlah_pesanan < $service->min) {
                $this->dispatchBrowserEvent('swal:modal', [
                    'type' => 'error',
                    'title' => 'Gagal!',
                    'text' => 'Minimal pesanan adalah ' . $service->min,
                ]);
                return;
            } elseif ($this->jumlah_pesanan > $service->max) {
                $this->dispatchBrowserEvent('swal:modal', [
                    'type' => 'error',
                    'title' => 'Gagal!',
                    'text' => 'Maksimal pesanan adalah ' . $service->max,
                ]);
                return;
            } else {
                $harga = str_replace(['.', ','], '', $this->harga);
                $total = ($harga / 1000) * $this->jumlah_pesanan;
                $total = ceil($total);
                if (Auth::user()->balance < $total) {
                    $this->dispatchBrowserEvent('swal:modal', [
                        'type' => 'error',
                        'title' => 'Saldo Tidak Mencukupi',
                        'text' => 'Saldo anda tidak mencukupi untuk melakukan pemesanan, silahkan isi saldo terlebih dahulu.',
                    ]);
                } else {
                    if ($service->provider == 'Medan') {
                        $api = new Medan();
                        if ($this->custom_comments) {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $this->target, // target pesanan
                                'custom_comments' => $this->custom_comments,
                            ));
                            $orderid = $smm->data->id ?? null;
                        } elseif ($this->link_post) {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $this->target, // target pesanan
                                'custom_link' => $this->linkpost,
                            ));
                            $orderid = $smm->data->id ?? null;
                        } else {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $this->target, // target pesanan
                                'quantity' => $this->jumlah_pesanan // jumlah pesan
                            ));
                            $orderid = $smm->data->id ?? null;
                        }
                    } else {
                        $smm = new Jap();
                        if ($this->custom_comments) {
                            $smm = $smm->order(['service' => $service->service, 'link' => $this->target, 'comments' => $this->custom_comments]);
                        } else {
                            $smm = $smm->order(['service' => $service->service, 'link' => $this->target, 'quantity' => $this->jumlah_pesanan, 'runs' => 2, 'interval' => 5]);
                        }
                        $orderid = $smm->order ?? null;
                    }
                    if ($orderid == null) {
                        $this->dispatchBrowserEvent('swal:modal', [
                            'type' => 'error',
                            'title' => 'Gagal!',
                            'text' => 'Terjadi kesalahan saat memproses pesanan, silahkan coba beberapa saat lagi'
                        ]);
                    } else {
                        $user = User::where('id', Auth::user()->id)->first();
                        $data = [
                            'user_id' => Auth::user()->id,
                            'trxid' => $orderid,
                            'provider' => $service->provider,
                            'type' => $service->type,
                            'layanan' => $service->name,
                            'target' => $this->target,
                            'quantity' => $this->jumlah_pesanan,
                            'price' => $total,
                            'custom_comments' => $this->custom_comments ?? '',
                            'custom_link' => $this->custom_link ?? '',
                            'start_count' => 0,
                            'remains' => 0,
                            'status' => 'pending',
                            'refill' => $service->refill
                        ];
                        History::create($data);
                        $data = [
                            'user_id' => Auth::user()->id,
                            'type' => 'Kredit',
                            'kategori' => 'order',
                            'jumlah' => $total,
                            'before_balance' => $user->balance,
                            'after_balance' => $user->balance - $total,
                            'description' => 'Pembelian ' . $service->name . ' Berhasil'
                        ];
                        LogBalance::create($data);
                        $user->balance = $user->balance - $total;
                        $user->omzet = $user->omzet + $total;
                        if ($user->save()) {
                            session()->flash('success', 'Pesanan berhasil dibuat <br>
                        ID Pesanan : ' . $orderid . '<br>
                        Layanan : ' . $service->name . '<br>
                        Target : ' . $this->target . '<br>
                        Jumlah : ' . $this->jumlah_pesanan . '<br>
                        ------------------------------------------------- <br>
                        Date : ' . date('Y-m-d H:i:s') . '
                        ');
                        } else {
                            session()->flash('error', 'Terjadi kesalahan saat memproses pesanan, silahkan coba beberapa saat lagi');
                        }
                    }
                }
            }
        } else {
            $this->dispatchBrowserEvent('swal:modal', [
                'type' => 'error',
                'title' => 'Gagal!',
                'text' => 'Layanan yang anda cari tidak ditemukan, silahkan coba lagi.',
            ]);
        }
    }
    public function orderFavorit()
    {
        $this->validate(
            [
                'layanan_fav' => 'required',
                'target_fav' => 'required',
                'jumlah_pesanan_fav' => 'required',
            ],
            [
                'layanan_fav.required' => 'Layanan tidak boleh kosong',
                'target_fav.required' => 'Target tidak boleh kosong',
                'jumlah_pesanan_fav.required' => 'Quantity tidak boleh kosong',
            ]
        );
        $service = Smm::where('service', $this->layanan_fav)->first();
        if ($service) {
            if ($this->jumlah_pesanan_fav < $service->min) {
                $this->dispatchBrowserEvent('swal:modal', [
                    'type' => 'error',
                    'title' => 'Gagal!',
                    'text' => 'Minimal pesanan adalah ' . $service->min,
                ]);
                return;
            } elseif ($this->jumlah_pesanan_fav > $service->max) {
                $this->dispatchBrowserEvent('swal:modal', [
                    'type' => 'error',
                    'title' => 'Gagal!',
                    'text' => 'Maksimal pesanan adalah ' . $service->max,
                ]);
                return;
            } else {
                $harga = str_replace(['.', ','], '', $this->harga_fav);
                $total = ($harga / 1000) * $this->jumlah_pesanan_fav;
                $total = ceil($total);
                if (Auth::user()->balance < $total) {
                    $this->dispatchBrowserEvent('swal:modal', [
                        'type' => 'error',
                        'title' => 'Saldo Tidak Mencukupi',
                        'text' => 'Saldo anda tidak mencukupi untuk melakukan pemesanan, silahkan isi saldo terlebih dahulu.',
                    ]);
                } else {
                    if ($service->provider == 'Medan') {
                        $api = new Medan();
                        if ($this->custom_comments_fav) {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $this->target_fav, // target pesanan
                                'custom_comments' => $this->custom_comments_fav,
                            ));
                            $orderid = $smm->data->id ?? null;
                        } elseif ($this->link_post_fav) {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $this->target_fav, // target pesanan
                                'custom_link' => $this->link_post_fav,
                            ));
                            $orderid = $smm->data->id ?? null;
                        } else {
                            $smm = $api->order(array(
                                'service' => $service->service, // id layanan 
                                'target' => $this->target_fav, // target pesanan
                                'quantity' => $this->jumlah_pesanan_fav // jumlah pesan
                            ));
                            $orderid = $smm->data->id ?? null;
                        }
                    } else {
                        $smm = new Jap();
                        if ($this->custom_comments_fav) {
                            $smm = $smm->order(['service' => $service->service, 'link' => $this->target_fav, 'comments' => $this->custom_comments_fav]);
                        } else {
                            $smm = $smm->order(['service' => $service->service, 'link' => $this->target_fav, 'quantity' => $this->jumlah_pesanan_fav, 'runs' => 2, 'interval' => 5]);
                        }
                        $orderid = $smm->order ?? null;
                    }
                    if ($orderid == null) {
                        $this->dispatchBrowserEvent('swal:modal', [
                            'type' => 'error',
                            'title' => 'Gagal!',
                            'text' => 'Terjadi kesalahan saat memproses pesanan, silahkan coba beberapa saat lagi'
                        ]);
                    } else {
                        $user = User::where('id', Auth::user()->id)->first();
                        $data = [
                            'user_id' => Auth::user()->id,
                            'trxid' => $orderid,
                            'provider' => $service->provider,
                            'type' => $service->type,
                            'layanan' => $service->name,
                            'target' => $this->target_fav,
                            'quantity' => $this->jumlah_pesanan_fav,
                            'price' => $total,
                            'custom_comments' => $this->custom_comments_fav ?? '',
                            'custom_link' => $this->custom_link_fav ?? '',
                            'start_count' => 0,
                            'remains' => 0,
                            'status' => 'pending',
                            'refill' => $service->refill
                        ];
                        History::create($data);
                        $data = [
                            'user_id' => Auth::user()->id,
                            'type' => 'Kredit',
                            'kategori' => 'order',
                            'jumlah' => $total,
                            'before_balance' => $user->balance,
                            'after_balance' => $user->balance - $total,
                            'description' => 'Pembelian ' . $service->name . ' Berhasil'
                        ];
                        LogBalance::create($data);
                        $user->balance = $user->balance - $total;
                        $user->omzet = $user->omzet + $total;
                        if ($user->save()) {
                            session()->flash('success', 'Pesanan berhasil dibuat <br>
                        ID Pesanan : ' . $orderid . '<br>
                        Layanan : ' . $service->name . '<br>
                        Target : ' . $this->target_fav . '<br>
                        Jumlah : ' . $this->jumlah_pesanan_fav . '<br>
                        ------------------------------------------------- <br>
                        Date : ' . date('Y-m-d H:i:s') . '
                        ');
                        } else {
                            session()->flash('error', 'Terjadi kesalahan saat memproses pesanan, silahkan coba beberapa saat lagi');
                        }
                    }
                }
            }
        } else {
            $this->dispatchBrowserEvent('swal:modal', [
                'type' => 'error',
                'title' => 'Gagal!',
                'text' => 'Layanan yang anda cari tidak ditemukan, silahkan coba lagi.',
            ]);
        }
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
        $favoritCategory = Favorit::distinct()
            ->where('user_id', Auth::user()->id)
            ->orderBy('category', 'asc')
            ->get(['category']);
        return view('livewire.order.single-general', compact('kategori', 'favoritCategory'));
    }
    private function umum()
    {
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
        if ($this->jumlah_pesanan && $this->layanan) {
            $harga = str_replace(['.', ','], '', $this->harga);
            $total = ($harga / 1000) * $this->jumlah_pesanan;
            $total = ceil($total);
            $this->total_harga = number_format($total, 0, ',', '.');
        }
        if (!$this->jumlah_pesanan) {
            $this->total_harga = 0;
        }
    }
    private function favorit()
    {
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
        if ($this->jumlah_pesanan_fav && $this->layanan_fav) {
            $harga = str_replace(['.', ','], '', $this->harga_fav);
            $total = ($harga / 1000) * $this->jumlah_pesanan_fav;
            $total = ceil($total);
            $this->total_harga_fav = number_format($total, 0, ',', '.');
        }
        if (!$this->jumlah_pesanan_fav) {
            $this->total_harga_fav = 0;
        }
    }
}
