<?php

namespace App\Http\Controllers;

use App\Helpers\HonestSmm;
use App\Helpers\Jap;
use App\Helpers\Medan;
use App\Models\Favorit;
use App\Models\History;
use App\Models\HistoryRefill;
use App\Models\LogBalance;
use App\Models\Smm;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function single()
    {
        return view('order.single');
    }
    public function getLayanan(Request $request)
    {
        $id = Smm::find($request->id);
        if ($id) {
            $category = Smm::where('category', $id->category)->orderBy('price', 'asc')->get();
            printf('<option value="%s" selected >%s</option>', '0', 'Pilih Layanan');
            foreach ($category as $value) {
                printf('<option value="%s">%s</option>', $value->service, $value->name);
            }
        } else {
            return '<option value="">Layanan tidak tersedia</option>';
        }
    }
    public function getLayananMassal(Request $request)
    {
        $id = Smm::find($request->id);
        if ($id) {
            $category = Smm::where([['category', $id->category], ['type', 'primary']])->orWhere([['category', $id->category], ['type', 'Default']])->orderBy('price', 'asc')->get();
            printf('<option value="%s" selected >%s</option>', '0', 'Pilih Layanan');
            foreach ($category as $value) {
                printf('<option value="%s">%s</option>', $value->service, $value->name);
            }
        } else {
            return '<option value="">Layanan tidak tersedia</option>';
        }
    }
    public function filterCategory(Request $request)
    {
        // LIKE %$request->category%
        if ($request->category == 'Semua') {
            $service  = Smm::orderBy('category', 'asc')->get();
        } else {
            $service = Smm::where('category', 'like', '%' . $request->category . '%')->orderBy('category', 'asc')->get();
        }
        if ($service->first()) {
            // distinct category
            $category = $service->unique('category');
            $category = $category->values()->all();
            // distinct service
            $service = $service->unique('service');
            $service = $service->values()->all();
            printf('<option value="%s"  selected disabled>%s</option>', '0', 'Pilih Category');
            foreach ($category as $value) {
                printf('<option value="%s">%s</option>', $value->id, $value->category);
            }
        } else {
            return '<option value="0">Layanan tidak tersedia</option>';
        }
    }
    public function massal()
    {
        return view('order.massal');
    }
    public function refill(Request $request)
    {
        $layanan = History::where('trxid', $request->id)->first();
        if ($layanan) {
            if ($layanan->provider == 'Medan') {
                $medan = new Medan();
                $reff =  $medan->refill($layanan->trxid);
                if ($reff->status == true) {
                    HistoryRefill::create([
                        'user_id' => Auth::user()->id,
                        'refill_id' => $reff->data->id_refill,
                        'layanan' => $layanan->layanan,
                        'target' => $layanan->target,
                        'status' => 'pending',
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => 'Refill berhasil dibuat'
                    ]);
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => $reff->data
                    ]);
                }
            } elseif ($layanan->provider == 'Jap') {
                $jap = new Jap();
                $reff = $jap->refill($layanan->trxid);
                $id = $reff->refill ?? null;
                if ($id) {
                    HistoryRefill::create([
                        'user_id' => Auth::user()->id,
                        'refill_id' => $reff->data->id_refill,
                        'layanan' => $layanan->layanan,
                        'target' => $layanan->target,
                        'status' => 'pending',
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => 'Refill berhasil dibuat'
                    ]);
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => 'Gagal refill pesanan'
                    ]);
                }
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Transaksi tidak ditemukan'
            ]);
        }
    }
    public function riwayatRefill()
    {
        return view('order.riwayat-refill');
    }
    public function riwayat(Request $request)
    {
        return view('order.history');
    }
    public function historyDetail(Request $request)
    {
        $history = History::where('trxid', $request->id)->first();
        if ($history) {
            return view('order.history-detail', compact('history'));
        } else {
            return '<div class="alert alert-danger">Data tidak ditemukan</div>';
        }
    }
    public function listLayanan()
    {
        return view('order.list-layanan');
    }
    public function favoritService(Request $request)
    {
        $service = Smm::where('service', $request->id)->first();
        if ($service) {
            $favorit = Favorit::where('user_id', Auth::user()->id)->where([['service_id', $request->id], ['category', $service->category], ['layanan', $service->name], ['price', $service->price]])->first();
            if ($favorit) {
                return response()->json([
                    'status' => false,
                    'message' => 'Layanan sudah ada di favorit'
                ]);
            } else {
                Favorit::create([
                    'user_id' => Auth::user()->id,
                    'service_id' => $service->service,
                    'category' => $service->category,
                    'layanan' => $service->name,
                    'price' => $service->price,
                ]);
                return response()->json([
                    'status' => true,
                    'message' => 'Layanan berhasil ditambahkan ke favorit'
                ], 200);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Layanan tidak ditemukan'
            ], 404);
        }
    }
    public function unfavService(Request $request)
    {
        $favorit = Favorit::where([['service_id', $request->id]])->first();
        if ($favorit) {
            $favorit->delete();
            return response()->json([
                'status' => true,
                'message' => 'Layanan berhasil dihapus dari favorit'
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Layanan tidak ditemukan'
            ], 404);
        }
    }
    public function getLayananFavorite(Request $request)
    {
        $id = Favorit::where('category', $request->id)->first();
        $category = Favorit::where('category', $id->category)->orderBy('price', 'asc')->get();
        printf('<option value="%s" selected>%s</option>', '0', 'Pilih Layanan');
        foreach ($category as $row) {
            $Smm = Smm::where([['service', $row->service_id], ['name', $row->layanan]])->first();
            if ($Smm) {
                printf('<option value="%s">%s</option>', $row->service_id, $row->layanan);
            }
        }
    }
    public function LayananFavorit()
    {
        return view('order.layanan-favorit');
    }
    public function favoritDelete(Request $request)
    {
        $service = Favorit::where([['id', $request->id], ['user_id', Auth::user()->id]])->first();
        if ($service) {
            $service->delete();
            return response()->json([
                'status' => true,
                'service' => $service->service,
                'message' => 'Layanan berhasil dihapus dari favorit'
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'Layanan tidak ditemukan'
            ], 404);
        }
    }
}
