<?php

namespace App\Http\Controllers;

use App\Models\LogBalance;
use App\Models\LogMasuk;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use App\Helpers\Encryption;

class UserController extends Controller
{
    public function index()
    {
        return view('user.dashboard');
    }
    public function logout()
    {
        Auth::logout();
        request()->session()->forget('remember');
        return redirect()->route('index');
    }
    public function kontak()
    {
        return view('user.kontak');
    }
    public function logLogin()
    {
        $log = LogMasuk::where('user_id', Auth::user()->id)->orderBy('id', 'desc')->get();
        return view('user.log-login', compact('log'));
    }
    public function logBalance()
    {
        return view('user.log-balance');
    }
    public function security()
    {
        return view('user.security');
    }
    public function secretKey(Request $request)
    {
        // validate password
        $request->validate([
            'secret_key' => 'required',
            'password' => 'required'
        ]);
        // check password
        if (Auth::attempt(['username' => Auth::user()->username, 'password' => $request->password])) {
            User::where('id', Auth::user()->id)->update([
                'secret_key' => Encryption::encrypt($request->secret_key)
            ]);
            return redirect()->back()->with('success', 'Secret key berhasil diubah');
        } else {
            return redirect()->back()->with('error', 'Password salah');
        }
    }
    public function whitelistIp(Request $request)
    {
        if (Auth::attempt(['username' => Auth::user()->username, 'password' => $request->password])) {
            $user = User::where('id', Auth::user()->id)->first();
            $ip = $request->whitelist_ip;
            $ip = explode(',', $ip);
            $ip = array_map('trim', $ip);
            $ip = array_filter($ip);
            $ip = array_unique($ip);
            $ip = implode(',', $ip);
            $user->whitelist_ip = $ip;
            if ($user->save()) {
                return redirect()->back()->with('success', 'Whitelist IP berhasil diubah');
            } else {
                return redirect()->back()->with('error', 'Whitelist IP gagal diubah');
            }
        } else {
            return redirect()->back()->with('error', 'Password salah');
        }
    }
    public function settings()
    {
        return view('user.settings');
    }
    public function prosesSettings(Request $request)
    {
        $user = User::where('id', Auth::user()->id)->first();
        if ($user) {
            $user->name = $request->full_name;
            if ($user->save()) {
                return redirect()->back()->with('success', 'Berhasil mengubah data');
            } else {
                return redirect()->back()->with('error', 'Gagal mengubah data');
            }
        } else {
            return redirect()->back()->with('error', 'User tidak ditemukan');
        }
    }
    public function changePassword(Request $request)
    {
        $request->validate(
            [
                'password' => 'required',
                'npassword' => 'required',
                'cnpassword' => 'required'
            ],
            [
                'cnpassword.required' => 'Konfirmasi password tidak boleh kosong',
                'npassword.required' => 'Password baru tidak boleh kosong',
                'password.required' => 'Password lama tidak boleh kosong'
            ]
        );
        if (Auth::attempt(['username' => Auth::user()->username, 'password' => $request->password])) {
            if ($request->npassword != $request->cnpassword) {
                return redirect()->back()->with('error', 'Konfirmasi password tidak sama');
            }
            $user = User::where('id', Auth::user()->id)->first();
            $user->password = bcrypt($request->npassword);
            if ($user->save()) {
                return redirect()->back()->with('success', 'Berhasil mengubah password');
            } else {
                return redirect()->back()->with('error', 'Gagal mengubah password');
            }
        } else {
            return redirect()->back()->with('error', 'Password salah');
        }
    }
    public function berita()
    {
        return view('user.berita');
    }
    public function api()
    {
        return view('user.api');
    }
}
