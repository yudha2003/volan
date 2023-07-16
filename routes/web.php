<?php

use App\Events\ChatEvent;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CronjobsController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\UserController;
use App\Http\Livewire\HistoryTable;
use App\Http\Controllers\DepositController;
use App\Http\Controllers\TicketController;
use App\Models\User;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Helpers\Encryption;
use App\Helpers\Jap;
use App\Http\Controllers\AdminController;
use App\Models\Configs;
use OpenSpout\Common\Entity\Row;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::controller(AuthController::class)->middleware('guest')->group(function () {
    Route::get('/', 'index')->name('index');
    Route::post('login', 'login')->name('login');
    Route::get('auth/register', 'register')->name('register');
    Route::post('proses/register', 'prosesRegister')->name('proses.register');
    Route::post('verify/email', 'verifyEmail')->name('verify.email');
    Route::get('forgot-password', 'forgotPassword')->name('forgot.password');
    Route::post('proses/forgot-password', 'prosesForgotPassword')->name('proses.forgot.password');
    Route::get('verify/forgot-password/{token}', 'verifyForgotPassword')->name('verify.forgot.password');
    Route::post('proses/reset-password', 'prosesResetPassword')->name('proses.reset.password');
});
Route::controller(CronjobsController::class)->prefix('cronjobs')->group(function () {
    Route::get('layanan/medan', 'layanan_medan')->name('layanan.medan');
    Route::get('layanan/jap', 'layanan_jap')->name('layanan.jap');
    Route::get('rate/dollars', 'rate_dollars')->name('rate.dollars');
    Route::get('status/order', 'status')->name('status.order');
    Route::get('status-deposit', 'search_deposit');
});
Route::middleware('auth')->group(function () {
    Route::controller(UserController::class)->group(function () {
        Route::get('dashboard', 'index')->name('dashboard');
        Route::get('logout', 'logout')->name('logout');
    });
    Route::controller(OrderController::class)->group(function () {
        Route::get('order/single', 'single')->name('order.single');
        Route::post('get/layanan', 'getLayanan')->name('get.layanan');
        Route::post('get/layanan/massal', 'getLayananMassal')->name('get.layanan.massal');
        Route::post('filterCategory', 'filterCategory')->name('filterCategory');
        Route::get('order/massal', 'massal')->name('order.massal');
        Route::get('order/history', 'riwayat')->name('history');
        Route::post('history/detail', 'historyDetail')->name('history.detail');
        Route::post('order/refill', 'refill')->name('refill');
        Route::get('history/refill', 'riwayatRefill')->name('history.refill');
        Route::post('refill/detail', 'refillDetail')->name('refill.detail');
        Route::get('list/layanan', 'listLayanan')->name('list.layanan');
        Route::post('favorit/service', 'favoritService')->name('favorit.service');
        Route::post('unfav/service', 'unfavService')->name('unfav.service');
        Route::post('get/layanan/favorite', 'getLayananFavorite')->name('get.layanan.favorite');
        Route::get('layanan/favorit', 'LayananFavorit')->name('list.layanan');
        Route::post('favorit/delete', 'favoritDelete')->name('favorit.delete');
    });
    Route::controller(HistoryTable::class)->group(function () {
        Route::get('orders/history', 'history')->name('history');
    });
    Route::controller(DepositController::class)->prefix('deposit')->group(function () {
        Route::get('new', 'deposit')->name('deposit');
        Route::post('get-methode', 'get_methode')->name('get.methode');
        Route::post('get-fees', 'get_fee')->name('deposit.fees');
        Route::post('proses', 'proses_deposit')->name('proses.deposit');
        Route::get('invoice/{deposit:trxid}', 'invoice')->name('invoice');
        Route::post('cancel', 'cancel')->name('deposit.cancel');
        Route::post('canceled', 'update_status_deposit')->name('canceled');
        Route::get('history', 'history')->name('deposit.history');
    });
    Route::controller(TicketController::class)->prefix('ticket')->group(function () {
        Route::get('new', 'new')->name('ticket.new');
        Route::post('proses', 'proses')->name('ticket.proses');
        Route::get('chat/{ticket:ticket_id}', 'chat')->name('ticket.chat');
        Route::post('send/message/ticket', 'sendMessageTicket')->name('send.message');
        Route::get('list', 'history')->name('ticket.history');
        Route::post('detail', 'detail')->name('ticket.detail');
        Route::post('reply', 'reply')->name('ticket.reply');
    });
    Route::controller(UserController::class)->group(function () {
        Route::get('kontak-kami', 'kontak')->name('kontak');
        Route::get('page/log-login', 'logLogin')->name('log.login');
        Route::get('page/log-balance', 'logBalance')->name('log.balance');
        Route::get('user/security', 'security')->name('security');
        Route::post('resetKey', function () {
            $user = User::find(auth()->user()->id);
            $user->api_key = Encryption::encrypt(Str::random(35));
            $user->save();
            return response()->json([
                'status' => true,
                'message' => 'Berhasil reset api key',
            ]);
        });
        Route::post('update/secret-key', 'secretKey')->name('secret.key');
        Route::post('update/whitelist-ip', 'whitelistIp')->name('whitelist.ip');
        Route::get('user/settings', 'settings')->name('settings');
        Route::post('proses/settings', 'prosesSettings')->name('proses.settings');
        Route::post('user/change-password', 'changePassword')->name('change.password');
        Route::get('news/berita', 'berita')->name('berita');
        Route::get('api/dokumentasi', 'api')->name('api');
    });
});
Route::controller(AdminController::class)->prefix('admin')->middleware(['auth', 'admin'])->group(function () {
    Route::get('index', 'index')->name('admin.index');
    Route::get('users', 'users')->name('admin.users');
    Route::get('user/edit/{user:id}', 'editUser')->name('admin.user.edit');
    Route::post('save/edit-user', 'saveEditUser')->name('admin.save.edit.user');
    Route::get('user/deposit', 'depositUser')->name('admin.user.deposit');
    Route::get('list/tickets', 'listTicket')->name('admin.list.ticket');
    Route::get('ticket/chat/{ticket:ticket_id}', 'chatTicket')->name('admin.ticket.chat');
    Route::post('send/message/ticket', 'sendMessageTicket')->name('admin.send.message');
    Route::get('metode-pembayaran', 'Metodepembayaran')->name('admin.metode.pembayaran');
    Route::get('all/layanan', 'allLayanan')->name('admin.all.layanan');
    Route::post('layanan/update', 'updateLayanan')->name('layanan.update');
    Route::get('pesanan', 'pesanan')->name('admin.pesanan');
    Route::get('refill', 'refill')->name('admin.refill');
    Route::get('berita', 'berita')->name('admin.berita');
    Route::post('gopay/otp', 'gopayOtp')->name('gopay.otp');
    Route::post('gopay/login', 'gopayLogin')->name('gopay.login');
    Route::post('koneksi/encrypt/bank-bca', 'encryptBankBca')->name('koneksi.encrypt.bank-bca');
    Route::post('koneksi/encrypt/bank-bca/mutasi', 'encryptBankBcaMutasi')->name('koneksi.encrypt.bank-bca.mutasi');
    Route::post('koneksi/encrypt/gopay/mutasi', 'encryptGopayMutasi')->name('koneksi.encrypt.gopay.mutasi');
    Route::post('ovo/otp', 'ovoOtp')->name('ovo.otp');
    Route::post('ovo/login', 'ovoLogin')->name('ovo.login');
    Route::post('ovo/pin', 'ovoPin')->name('ovo.pin');
    Route::post('koneksi/encrypt/ovo/mutasi', 'encryptOvoMutasi')->name('koneksi.encrypt.ovo.mutasi');
    Route::post('koneksi/encrypt/changeaccount', 'encryptChangeAccount')->name('koneksi.encrypt.changeaccount');
    Route::geT('konfigurasi/website', 'ConfigWebsite');
});
