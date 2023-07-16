<div class="row">
    <div class="col-md-8">
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-cart-arrow-up me-1"></i>Pesanan Baru</h5>
            <div class="card-body" id="ajax-result">
                <form method="POST">
                    <input type="hidden" name="csrf_token" value="7a255192c39ba0da80cc470cda174210a49ac98250672f0c4ba89d0ae8f9237d">
                    <ul class="nav nav-pills mb-2" role="tablist" style="margin-bottom:13px;">
                        <li class="nav-item waves-effect waves-light">
                            <a class="nav-link active" data-bs-toggle="tab" href="#general" id="btn-general" role="tab" style="padding:0.785rem 1rem !important;">
                                <i class="fas fa-adjust me-1 align-middle"></i> <span class="d-md-inline-block">Umum</span>
                            </a>
                        </li>
                        <li class="nav-item waves-effect waves-light">
                            <a class="nav-link" data-bs-toggle="tab" href="#favorite" id="btn-favorite" role="tab" style="padding:0.785rem 1rem !important;">
                                <i class="far fa-star me-1 align-middle"></i> <span class="d-md-inline-block">Favorit</span>
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="general" role="tabpanel">
                            <div class="mb-3">
                                <label class="form-label">Kategori <span class="text-danger">*</span></label>
                                <select class="select2 form-control" id="category">
                                    <option value="0">Pilih...</option>
                                    <option value="219">++ JASA FAKE ORDER MARKETPALACE ++</option>
                                    <option value="200">- PROMO - ON OFF</option>
                                    <option value="201">Clubhouse</option>
                                    <option value="185">Facebook Followers / Friends</option>
                                    <option value="225">Facebook Group Member</option>
                                    <option value="205">Facebook Live Stream</option>
                                    <option value="176">Facebook Page Likes & Page Followers</option>
                                    <option value="216">Facebook Post Like Emoticon</option>
                                    <option value="186">Facebook Post Likes / Comments / Shares</option>
                                    <option value="217">Facebook Reels Short Video</option>
                                    <option value="211">Facebook Video Views</option>
                                    <option value="199">Instagram Comments</option>
                                    <option value="184">Instagram Followers Indonesia</option>
                                    <option value="197">Instagram Followers Indonesia Guaranted/Refill</option>
                                    <option value="213">Instagram Followers Indonesia [ Gender/Kelamin ]</option>
                                    <option value="227">Instagram Followers [ guaranteed 180 Hari - Lifetime ]</option>
                                    <option value="226">Instagram Followers [ guaranteed 60 Hari - 99 Hari ] </option>
                                    <option value="187">Instagram Followers [ No Refill ]</option>
                                    <option value="193">Instagram Followers [guaranteed]</option>
                                    <option value="179">Instagram Like Indonesia</option>
                                    <option value="210">Instagram Like Komentar [ top koment ]</option>
                                    <option value="180">Instagram Likes</option>
                                    <option value="169">Instagram Live Video</option>
                                    <option value="203">Instagram Reels</option>
                                    <option value="170">Instagram Story / Impressions / Saves / Profile Visit</option>
                                    <option value="168">Instagram Story Views</option>
                                    <option value="196">Instagram TV</option>
                                    <option value="208">Instagram VERIFIED </option>
                                    <option value="209">Instagram Views</option>
                                    <option value="191">Likee app</option>
                                    <option value="172">Linkedin</option>
                                    <option value="177">Pinterest</option>
                                    <option value="178">Shopee/Tokopedia/Bukalapak</option>
                                    <option value="166">SoundCloud</option>
                                    <option value="175">Spotify</option>
                                    <option value="167">Telegram</option>
                                    <option value="220">Telegram Reactions</option>
                                    <option value="222">TikTok share</option>
                                    <option value="214">Tiktok Comments </option>
                                    <option value="181">TikTok Followers</option>
                                    <option value="202">TikTok INDONESIA</option>
                                    <option value="182">TikTok Likes</option>
                                    <option value="224">Tiktok Live Streams Like/Share/Comment</option>
                                    <option value="223">TikTok Save/Favorit</option>
                                    <option value="221">TikTok View</option>
                                    <option value="188">TikTok View/share</option>
                                    <option value="215">Twitch</option>
                                    <option value="212">Twitter Favorites/Like</option>
                                    <option value="204">Twitter Followers</option>
                                    <option value="194">Twitter Indonesia</option>
                                    <option value="190">Twitter Retweets</option>
                                    <option value="171">Twitter Views & Impressions</option>
                                    <option value="173">Website Traffic</option>
                                    <option value="228">youtube jam tayang FAST</option>
                                    <option value="231">youtube jam tayang [ New Server 2 ]</option>
                                    <option value="183">Youtube Likes / Dislikes / Shares / Comment</option>
                                    <option value="229">Youtube Live Chat Comments [Live Stream / Premiere / Video Waiting To Be Published]</option>
                                    <option value="189">Youtube Live Stream / Youtube Premiered Waiting</option>
                                    <option value="218">YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours]</option>
                                    <option value="230">YouTube Live Stream [ Harga Murah ] [ 30 Minutes to 24 Hours] Server 2 [ work ]</option>
                                    <option value="206">YouTube Shorts</option>
                                    <option value="198">Youtube Subscribers</option>
                                    <option value="207">Youtube View [ untuk monetisasi - penghasil duit ]</option>
                                    <option value="195">Youtube View Jam Tayang</option>
                                    <option value="192">Youtube View Target Negara</option>
                                    <option value="174">Youtube Views</option>
                                </select>
                            </div>
                        </div>
                        <div class="tab-pane" id="favorite" role="tabpanel">
                            <div class="mb-3">
                                <label class="form-label">Kategori <span class="text-danger">*</span></label>
                                <select class="select2 form-control" id="category_fav">
                                    <option value="0">Pilih...</option>
                                    <option value="174">Youtube Views</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="d-flex justify-content-between">
                            <label class="form-label">Layanan <span class="text-danger">*</span></label>
                            <span class="fw-bolder text-secondary small" id="is_refill"><i class="fas fa-question-circle"></i> Refill Button</span>
                        </div>
                        <select class="select2 form-control" name="service" id="service">
                            <option value="0">Pilih Kategori</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Deskripsi</label>
                        <span class="form-control" style="height: auto;" id="description" readonly>-</span>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Minimal Pesanan</label>
                            <input type="text" class="form-control" value="0" id="min-amount" readonly>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Maksimal Pesanan</label>
                            <input type="text" class="form-control" value="0" id="max-amount" readonly>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Harga / 1000</label>
                            <div class="input-group">
                                <div class="input-group-text">Rp</div>
                                <input type="text" class="form-control" value="0" id="price" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Jumlah Pesanan <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" name="quantity" id="quantity">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Target <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="target" id="target">
                    </div>
                    <div class="mb-3 d-none" id="input_custom_comments">
                        <label class="form-label">Komentar <span class="text-danger">*</span></label>
                        <textarea class="form-control" name="custom_comments" id="custom_comments" placeholder="*Pisahkan komentar dengan Enter."></textarea><small class="text-danger" id="custom_comments_alert"></small>
                    </div>
                    <div class="mb-3 d-none" id="input_custom_link">
                        <label class="form-label">Link Post <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="custom_link" id="custom_link">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Waktu Rata-Rata <a href="javascript:;" class="text-primary" data-bs-toggle="tooltip" data-bs-html="true" data-bs-placement="top" title="<em>Waktu rata-rata</em> didasarkan pada 10 pesanan terakhir dengan status pesanan <em>Success</em>."><i class="fas fa-exclamation-circle"></i></a></label>
                        <input type="text" class="form-control" id="average_time" value="-" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Total Harga</label>
                        <div class="input-group">
                            <div class="input-group-text">Rp</div>
                            <input type="text" class="form-control" value="0" id="total-price" readonly>
                        </div>
                    </div>
                    <div class="mb-0 float-end">
                        <button type="reset" class="btn btn-danger waves-effect waves-light"><i class="mdi mdi-refresh me-1"></i>Ulangi</button>
                        <button type="submit" class="btn btn-primary waves-effect waves-light"><i class="mdi mdi-cart-arrow-up me-1"></i>Pesan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <h5 class="card-header"><i class="mdi mdi-information-outline me-1"></i>Informasi</h5>
            <div class="card-body">
                <b>Cara melakukan pemesanan:</b>
                <ul>
                    <li>Pilih <em><b>Kategori</b></em> yang Anda inginkan.</li>
                    <li>Pilih <em><b>Layanan</b></em> yang Anda inginkan.</li>
                    <li>Input <em><b>Jumlah Pesanan</b></em> yang Anda inginkan.</li>
                    <li>Input <em><b>Target</b></em> pesanan yang sesuai.</li>
                </ul>
                <br>
                <b>Penting!</b>
                <ul>
                    <li>Mohon untuk tidak melakukan pesanan dengan target yang sama jika pesanan sebelumnya belum selesai diproses, agar pesanan lancar dan tidak bermasalah.</li>
                    <li>Jika Anda mendapat pesan gagal saat melakukan pemesanan, silakan informasikan layanan tersebut melalui <em><b><a href="https://gudangjasa.com/ticket/new">Tiket</a></b></em> atau hubungi Admin.</li>
                </ul>
            </div>
        </div>
    </div>
</div>