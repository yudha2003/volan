<?php


namespace App\Helpers;

use App\Models\Configs;

class Medan
{

	public function __construct()
	{
		$config = Configs::first();
		$this->api_key = $config->key_medan;
		$this->api_id = $config->id_medan;
	}
	public $api_url = 'https://api.medanpedia.co.id/'; // API URL
	public $api_id = ''; // API ID
	public $api_key = ''; // API KEY

	public function profile()
	{
		return json_decode($this->connect($this->api_url . 'profile', array('api_id' => $this->api_id, 'api_key' => $this->api_key)));
	}

	public function services()
	{
		return json_decode($this->connect($this->api_url . 'services', array('api_id' => $this->api_id, 'api_key' => $this->api_key)));
	}

	public function order($data)
	{
		return json_decode($this->connect($this->api_url . 'order', array_merge(array('api_id' => $this->api_id, 'api_key' => $this->api_key), $data)));
	}

	public function status($order_id)
	{
		return json_decode($this->connect($this->api_url . 'status', array('api_id' => $this->api_id, 'api_key' => $this->api_key, 'id' => $order_id)));
	}

	public function refill($order_id)
	{
		return json_decode($this->connect($this->api_url . 'refill', array('api_id' => $this->api_id, 'api_key' => $this->api_key, 'id_order' => $order_id)));
	}

	public function refill_status($refill_id)
	{
		return json_decode($this->connect($this->api_url . 'refill_status', array('api_id' => $this->api_id, 'api_key' => $this->api_key, 'id_refill' => $refill_id)));
	}

	private function connect($end_point, $post)
	{
		$_post = array();
		if (is_array($post)) {
			foreach ($post as $name => $value) {
				$_post[] = $name . '=' . urlencode($value);
			}
		}
		// return json_encode($_post);
		$ch = curl_init($end_point);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		if (is_array($post)) {
			curl_setopt($ch, CURLOPT_POSTFIELDS, join('&', $_post));
		}
		curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)');
		$result = curl_exec($ch);
		if (curl_errno($ch) != 0 && empty($result)) {
			$result = false;
		}
		curl_close($ch);
		return $result;
	}
}
