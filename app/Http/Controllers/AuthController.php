<?php

namespace App\Http\Controllers;

use App\Helpers\HonestSmm;
use App\Mail\Forgot;
use App\Models\LogMasuk;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Mail\Verify;
use App\Models\UserVerify;
use Illuminate\Support\Facades\Mail as FacadesMail;

class AuthController extends Controller
{
    public function index()
    {
        return view('auth.login');
    }
    public function login(Request $request)
    {
        $request->validate(
            [
                'username' => 'required|string',
                'password' => 'required'
            ],
            [
                'username.required' => 'Username atau email tidak boleh kosong!',
                'password.required' => 'Password tidak boleh kosong!'
            ]

        );
        $credentials = $request->only('username', 'password');
        // remember me
        $remember = $request->has('remember') ? true : false;
        $user = User::where('username', $request->username)->first();
        if ($user) {
            if ($user->status == 'nonverif') {
                return back()->with('error', 'Akun belum diverifikasi!');
            }
        }
        if (Auth::attempt($credentials, $remember)) {
            LogMasuk::create([
                'user_id' => Auth::user()->id,
                'ip' => $request->ip(),
                'user_agent' => $request->userAgent(),
            ]);
            $request->session()->regenerate();
            return redirect()->intended('dashboard');
        } else if (auth()->attempt(['email' => $request->username, 'password' => $request->password])) {
            LogMasuk::create([
                'user_id' => Auth::user()->id,
                'ip' => $request->ip(),
                'user_agent' => $request->userAgent(),
            ]);
            $request->session()->regenerate();
            return redirect()->intended('dashboard');
        } else {
            return back()->with('error', 'Username atau password salah!');
        }
    }
    public function register()
    {
        return view('auth.register');
    }
    public function prosesRegister(Request $request)
    {
        $request->validate(
            [
                'name' => 'required|string',
                'username' => 'required|string|unique:users',
                'email' => 'required|email:rfc,dns|unique:users',
                'password' => 'required',
                'konfirm_password' => 'required'
            ],
            [
                'name.required' => 'Nama tidak boleh kosong!',
                'name.string' => 'Nama tidak valid!',
                'username.required' => 'Username tidak boleh kosong!',
                'username.unique' => 'Username sudah terdaftar!',
                'email.required' => 'Email tidak boleh kosong!',
                'email.email' => 'Email tidak valid!',
                'email.unique' => 'Email sudah terdaftar!',
                'password.required' => 'Password tidak boleh kosong!',
                'konfirm_password.required' => 'Konfirmasi password tidak boleh kosong!'
            ]
        );
        if ($request->password == $request->konfirm_password) {
            $user = new User();
            $user->name = $request->name;
            $user->username = $request->username;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->api_key = sha1(time());
            $user->secret_key = rand(100000, 999999);
            $user->omzet = 0;
            $user->role = 'user';
            $user->status = 'nonverif';
            $mailData = [
                'name' => $request->fullname,
                'code' => rand(10000, 99999),
            ];
            if ($user->save()) {
                UserVerify::create([
                    'type' => 'email',
                    'email' => $request->email,
                    'token' => $mailData['code'],
                    'expired_at' => date('Y-m-d H:i:s', strtotime('+3 hours')),
                ]);
                FacadesMail::to($request->email)->send(new Verify($mailData));
                return view('auth.verify', ['user' => $user]);
            } else {
                return redirect()->route('register')->with('error', 'Pendaftaran gagal!');
            }
        } else {
            return redirect()->route('register')->with('error', 'Konfirmasi password tidak sesuai!');
        }
    }
    public function verifyEmail(Request $request)
    {
        $user = UserVerify::where('email', $request->mail)->where('token', $request->code)->first();
        if ($user) {
            if ($user->expired_at < date('Y-m-d H:i:s')) {
                return redirect()->route('index')->with('error', 'Token sudah kadaluarsa!');
            } else {
                User::where('email', $request->mail)->update(['status' => 'active']);
                UserVerify::where('email', $request->mail)->delete();
                return redirect()->route('index')->with('success', 'Email berhasil diverifikasi!');
            }
        } else {
            return redirect()->route('index')->with('error', 'Email gagal diverifikasi!');
        }
    }
    public function forgotPassword()
    {
        return view('auth.forgot-password');
    }
    public function prosesForgotPassword(Request $request)
    {
        $user = User::where('email', $request->username)->first();
        $user2 = User::where('username', $request->username)->first();
        $token = Str::random(60);
        if ($user) {
            $mailData = [
                'name' => $user->name,
                'link' => url('verify/forgot-password/' . $token),
                'code' => $token,
            ];
            UserVerify::create([
                'type' => 'forgot',
                'email' => $request->username,
                'token' => $mailData['code'],
                'expired_at' => date('Y-m-d H:i:s', strtotime('+3 hours')),
            ]);
            FacadesMail::to($request->username)->send(new Forgot($mailData));
            return view('auth.forgot_password', ['user' => $user]);
        } else if ($user2) {
            $mailData = [
                'name' => $user2->name,
                'code' => $token,
            ];
            UserVerify::create([
                'type' => 'forgot',
                'email' => $request->username,
                'token' => $mailData['code'],
                'expired_at' => date('Y-m-d H:i:s', strtotime('+3 hours')),
            ]);
            FacadesMail::to($request->username)->send(new Forgot($mailData));
            return view('auth.forgot_password', ['user' => $user2]);
        } else {
            return redirect()->route('forgot-password')->with('error', 'Email atau username tidak ditemukan!');
        }
    }
    public function verifyForgotPassword($token)
    {
        return view('auth.reset-password', ['token' => $token]);
    }
    public function prosesResetPassword(Request $request)
    {
        $request->validate(
            [
                'password' => 'required|min:5',
                'konfirm_password' => 'required',
            ],
            [
                'password.required' => 'Password tidak boleh kosong!',
                'konfirm_password.required' => 'Konfirmasi password tidak boleh kosong!'
            ]
        );
        $user = UserVerify::where([['token', $request->token], ['type', 'forgot']])->first();
        if ($user) {
            if ($user->expired_at < date('Y-m-d H:i:s')) {
                return redirect()->route('index')->with('error', 'Token sudah kadaluarsa!');
            } else {
                if ($request->password != $request->konfirm_password) {
                    return redirect()->route('index')->with('error', 'Konfirmasi password tidak sesuai!');
                } else {
                    User::where('email', $user->email)->update(['password' => Hash::make($request->password)]);
                    UserVerify::where('email', $user->email)->delete();
                    return redirect()->route('index')->with('success', 'Password berhasil diubah!');
                }
            }
        } else {
            return redirect()->route('index')->with('error', 'Token tidak ditemukan');
        }
    }
}
