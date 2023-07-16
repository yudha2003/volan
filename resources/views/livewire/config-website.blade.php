<div>
    <style>
        .sensor {
            filter: blur(3px);
        }

        .sensor:hover {
            filter: none;
        }

        .text-right {
            text-align: right;
        }
    </style>
    @if (session()->has('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> {!! session()->get('success') !!}
            <button type="button" class="btn-close" wire:click="RemoveSession" data-bs-dismiss="alert"
                aria-label="Close"></button>
        </div>
    @endif
    @if (session()->has('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> {{ session()->get('error') }}
            <button type="button" wire:click="RemoveSession" class="btn-close" data-bs-dismiss="alert"
                aria-label="Close"></button>
        </div>
    @endif
    @if ($errors->all())
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong>
            @foreach ($errors->all() as $error)
                <li>{{ $error }} </li>
            @endforeach
            <button type="button" class="btn-close" wire:click="RemoveSession" data-bs-dismiss="alert"
                aria-label="Close"></button>
        </div>
    @endif
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-webpack me-1"></i>Konfigurasi Website</h5>
                <div class="card-body">
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link @if ($tab == 'color') active @endif"
                                wire:click="activatedTab('color')" data-bs-toggle="tab" href="#color" role="tab">
                                <i class="mdi mdi-format-color-fill me-1 align-middle"></i> <span
                                    class="d-md-inline-block">Color
                                </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link @if ($tab == 'api_key') active @endif"
                                wire:click="activatedTab('api_key')" data-bs-toggle="tab" href="#api_key"
                                role="tab">
                                <i class="mdi mdi-fire me-1 align-middle"></i> <span class="d-md-inline-block">API
                                    KEY</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link @if ($tab == 'seo') active @endif"
                                wire:click="activatedTab('seo')"data-bs-toggle="tab" href="#seo" role="tab">
                                <i class="mdi mdi-sitemap me-1 align-middle"></i> <span
                                    class="d-md-inline-block">SEO</span>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content pt-2">
                        <div class="tab-pane @if ($tab == 'color') active @endif" id="color"
                            role="tabpanel">
                            <form wire:submit.prevent="setColor">
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">Color Default</label>
                                    <div class="col-md-9">
                                        <div class="input-group" wire:ignore>
                                            <input type="text" wire:model="color_default" name="color"
                                                id="color" class="form-control form-control-sm">
                                            <div class="input-group-addon">
                                                <input type='text' id="custom" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">Linear Gradient Navbar</label>
                                    <div class="col-md-9">
                                        <div class="input-group" wire:ignore>
                                            <input type="text" wire:model="second_default" name="color"
                                                id="color" class="form-control form-control-sm">
                                            <div class="input-group-addon">
                                                <input type='text' id="customs" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-0 mt-3 float-end">
                                    <button type="submit" class="btn btn-primary waves-effect waves-light"><i
                                            class="mdi mdi-content-save me-1"></i>Save Changes</button>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane @if ($tab == 'api_key') active @endif" id="api_key"
                            role="tabpanel">
                            <form wire:submit.prevent="setApi">
                                <div class="row">
                                    <div class="col-md text-right" wire:ignore>
                                        <button class="btn btn-success btn-sm mb-2" type="button" id="eyes"
                                            style="margin-left:5px; border-radius:5px">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">API KEY JAP</label>
                                    <div class="col-md-9">
                                        <input type="text" wire:model.lazy="api_jap" name="color"
                                            placeholder="Masukkan Api Key JAP" id="color"
                                            class="form-control blur sensor">
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">API ID MEDAN</label>
                                    <div class="col-md-9">
                                        <input type="text" wire:model.lazy="id_medan"
                                            placeholder="Masukkan API ID Medan" name="color" id="color"
                                            class="form-control blur sensor">
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">API KEY MEDAN</label>
                                    <div class="col-md-9">
                                        <input type="text" wire:model.lazy="api_medan"
                                            placeholder="Masukkan api key medan" name="color" id="color"
                                            class="form-control blur sensor">
                                    </div>
                                </div>
                                <div class="mb-0 mt-3 float-end">
                                    <button type="submit" class="btn btn-primary waves-effect waves-light"><i
                                            class="mdi mdi-content-save me-1"></i>Save Changes</button>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane @if ($tab == 'seo') active @endif" id="seo"
                            role="tabpanel">
                            <form wire:submit.prevent="setSeo">
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">Logo</label>
                                    <div class="col-md-9">
                                        <input type="file" accept="image/*" wire:model.lazy="logo"
                                            name="color"class="form-control">
                                        {{-- Show image from $url_logo --}}
                                        @if ($url_logo)
                                            <img src="{{ asset('assets/images/logo/' . $url_logo) }}" alt=""
                                                width="100px" class="mt-2" height="100px">
                                        @endif
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">Name Panel</label>
                                    <div class="col-md-9">
                                        <input type="text" wire:model.lazy="name_panel" name="color"
                                            placeholder="Masukkan Nama Panel" class="form-control">
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">Title Website</label>
                                    <div class="col-md-9">
                                        <input type="text" wire:model.lazy="title_website" name="color"
                                            placeholder="Masukkan Nama Panel" class="form-control">
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">Description website</label>
                                    <div class="col-md-9">
                                        <textarea type="text" wire:model.lazy="description_website" cols="5" rows="4" name="color"
                                            placeholder="Masukkan Deskripsi website" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="mb-2 row">
                                    <label class="col-md-3 col-form-label">Keyword website</label>
                                    <div class="col-md-9">
                                        <textarea type="text" wire:model.lazy="keyword_website" cols="12" rows="10" name="color"
                                            placeholder="Masukkan Keyword Panel" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="mb-0 mt-3 float-end">
                                    <button type="submit" class="btn btn-primary waves-effect waves-light"><i
                                            class="mdi mdi-content-save me-1"></i>Save Changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const text = document.querySelector('h1');

    function getColor(event) {
        const color = event.target.value;
        @this.set('color_default', color);
    }
    $("#custom").spectrum({
        showInput: true,
        showSelectionPalette: false,
    });
    var defaults = "{{ $color_default }}";
    $("#custom").spectrum("set", defaults);
    $("#custom").on('change', function() {
        var color = $("#custom").spectrum("get").toHexString();
        @this.set('color_default', color);
    });
    $("#customs").spectrum({
        showInput: true,
        showSelectionPalette: false,
    });
    var defaults = "{{ $second_default }}";
    $("#customs").spectrum("set", defaults);
    $("#customs").on('change', function() {
        var color = $("#customs").spectrum("get").toHexString();
        @this.set('color_default', color);
    });
    $('#eyes').click(function() {
        if ($(".blur").hasClass("sensor")) {
            $(".blur").removeClass("sensor");
            $("#eyes").html(`<i class="fas fa-eye"></i>`);
        } else {
            $(".blur").addClass("sensor");
            $("#eyes").html(`<i class="fas fa-eye-slash"></i>`);
        }
    });
</script>
