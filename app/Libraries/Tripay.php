<?php

namespace App\Libraries;

use App\Models\Configs;
use App\Models\User;
use Exception;
use Illuminate\Support\Str;
use Drnxloc\LaravelHtmlDom\HtmlDomParser;

use DOMDocument;

class Tripay
{
    public function create($merchantCode, $merchantRef, $method, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return 'not found';
        }
        $config = Configs::first();
        $apiKey       = $config->apikey_tripay;
        $privateKey   = $config->privatekey_tripay;
        $merchantCode = $config->merchant_code; // MER
        $merchantRef  = $merchantRef;
        $method       = $method;

        $data = [
            'method'        => $method,
            'merchant_ref'  => $merchantRef,
            'customer_name' => $user->name,
            'signature'     => hash_hmac('sha256', $merchantCode . $method . $merchantRef, $privateKey)
        ];

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_FRESH_CONNECT  => true,
            CURLOPT_URL            => "https://tripay.co.id/api/open-payment/create",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HEADER         => false,
            CURLOPT_HTTPHEADER     => ['Authorization: Bearer ' . $apiKey],
            CURLOPT_FAILONERROR    => false,
            CURLOPT_POST           => true,
            CURLOPT_POSTFIELDS     => http_build_query($data),
            CURLOPT_IPRESOLVE      => CURL_IPRESOLVE_V4
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);

        return empty($error) ? $response : $error;
    }
    public function production($merchantCode, $merchantRef, $method, $price, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return 'not found';
        }
        $config = Configs::first();
        $apiKey       = $config->apikey_tripay;
        $privateKey   = $config->privatekey_tripay;
        $merchantCode = $config->merchant_code; // MER
        $merchantRef  = $merchantRef;
        $amount       = $price;

        $data = [
            'method'         => $method,
            'merchant_ref'   => $merchantRef,
            'amount'         => $amount,
            'customer_name'  =>  $user->name,
            'customer_email' => $user->email,
            'customer_phone' => '081234567890',
            'callback_url' => url('api/callback/tripay'),
            'order_items'    => [
                [
                    'sku'         => $merchantRef,
                    'name'        => $user->name,
                    'price'       => $price,
                    'quantity'    => 1,
                ],
            ],
            'return_url'   => url('deposit/invoice/' . $merchantRef),
            'expired_time' => (time() + (1 * 60 * 60)),
            'signature'    => hash_hmac('sha256', $merchantCode . $merchantRef . $amount, $privateKey)
        ];

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_FRESH_CONNECT  => true,
            CURLOPT_URL            => 'https://tripay.co.id/api/transaction/create',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HEADER         => false,
            CURLOPT_HTTPHEADER     => ['Authorization: Bearer ' . $apiKey],
            CURLOPT_FAILONERROR    => false,
            CURLOPT_POST           => true,
            CURLOPT_POSTFIELDS     => http_build_query($data),
            CURLOPT_IPRESOLVE      => CURL_IPRESOLVE_V4
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);
        return $response;
    }
}
