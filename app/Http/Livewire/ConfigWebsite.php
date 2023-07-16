<?php

namespace App\Http\Livewire;

use App\Models\Configs;
use Livewire\Component;
use Livewire\WithFileUploads;

class ConfigWebsite extends Component
{
    use WithFileUploads;
    public $color_default, $second_default;
    public $api_jap, $id_medan, $api_medan;
    public $logo, $url_logo, $name_panel, $title_website, $description_website, $keyword_website;
    public $tab = 'color';
    public function activatedTab($tab)
    {
        $this->tab = $tab;
    }
    public function setColor()
    {
        $config = Configs::first();
        if ($config) {
            $config->color_default = $this->color_default;
            $config->second_default = $this->second_default;
            $config->save();
            session()->flash('success', 'Berhasil mengubah warna website, silahkan refresh halaman');
        } else {
            session()->flash('error', 'Gagal mengubah warna website');
        }
    }
    public function setApi()
    {
        $config = Configs::first();
        if ($config) {
            $config->api_jap = $this->api_jap;
            $config->id_medan = $this->id_medan;
            $config->key_medan = $this->api_medan;
            $config->save();
            session()->flash('success', 'Berhasil mengubah api');
        } else {
            session()->flush('error', 'Gagal merubah data api');
        }
    }
    public function setSeo()
    {
        $config = Configs::first();
        if ($config) {
            if ($this->logo) {
                $name = time() . '.' . $this->logo->extension();
                $config->url_logo = str_replace('logo/', '', $this->logo->storeAs('logo/', $name));
            }
            $config->name_panel = $this->name_panel;
            $config->title_website = $this->title_website;
            $config->description_website = $this->description_website;
            $config->keyword_website = $this->keyword_website;
            $config->save();
            session()->flash('success', 'Berhasil mengubah data SEO');
        } else {
            session()->flush('error', 'Gagal merubah data Seo');
        }
    }
    public function render()
    {
        $config = Configs::first();
        if ($config) {
            if ($this->color_default == null && $this->second_default == null) {
                $this->color_default = $config->color_default;
                $this->second_default = $config->second_default;
            }
            if ($this->api_jap == null && $this->id_medan == null && $this->api_medan == null) {
                $this->api_jap = $config->api_jap;
                $this->id_medan = $config->id_medan;
                $this->api_medan = $config->key_medan;
            }
            if ($this->name_panel == null && $this->title_website == null && $this->description_website == null && $this->keyword_website == null) {
                $this->name_panel = $config->name_panel;
                $this->title_website = $config->title_website;
                $this->description_website = $config->description_website;
                $this->keyword_website = $config->keyword_website;
            }
            if ($this->url_logo == null) {
                $this->url_logo = $config->url_logo;
            }
            return view('livewire.config-website', compact('config'));
        }
    }
}
