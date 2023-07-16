@extends('templates.main')
@section('content')
    <script src="https://js.pusher.com/7.2/pusher.min.js"></script>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <h5 class="card-header"><i class="mdi mdi-information-outline me-1"></i>Informasi</h5>
                <div class="card-body p-0" style="margin-bottom: -16px;">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <td>
                                    <span class="fw-bold">Ticket ID</span><br>
                                    {{ $ticket->ticket_id }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="fw-bold">Subjek</span><br>
                                    {{ $ticket->subject }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="fw-bold">Tipe</span><br>
                                    {{ Str::ucfirst($ticket->type_ticket) }}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="fw-bold">Status</span><br>
                                    @if ($ticket->status == 'open')
                                        <span class="btn btn-soft-success btn-sm font-size-13">Open</span>
                                    @else
                                        <span class="btn btn-soft-danger btn-sm font-size-13">Closed</span>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="fw-bold">Pembaruan Terakhir</span><br>
                                    @if ($respon)
                                        {{ $respon->updated_at->diffForHumans() }}
                                    @else
                                        {{ $ticket->created_at->diffForHumans() }}
                                    @endif
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="{{ url('ticket/list') }}" class="btn btn-primary btn-sm waves-effect waves-light float-end"><i
                            class="mdi mdi-arrow-left-circle-outline me-1"></i>Kembali</a>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <section class="msger">
                <header class="msger-header">
                    <div class="msger-header-title">
                        <i class="fas fa-comment-alt"></i> Customer Service
                    </div>
                    <div class="msger-header-options">
                        <span><i class="fas fa-cog"></i></span>
                    </div>
                </header>

                <main class="msger-chat">
                    @php
                        $all = App\Models\TicketChat::where('ticket_id', $ticket->ticket_id)->get();
                    @endphp
                    @foreach ($all as $row)
                        @if ($row->type == 'admin')
                            <div class="msg left-msg mt-3">
                                <div class="msg-img"
                                    style="background-image: url({{ URL::asset('assets/images/avtar-2.png') }})">
                                </div>

                                <div class="msg-bubble">
                                    <div class="msg-info">
                                        <div class="msg-info-name">Customer Service</div>
                                        <div class="msg-info-time">
                                            {{ \Carbon\Carbon::parse($row->created_at)->diffForHumans() }}</div>
                                    </div>

                                    <div class="msg-text">
                                        {{ $row->message }}
                                    </div>
                                </div>
                            </div>
                        @else
                            <div class="msg right-msg mt-3">
                                <div class="msg-img"
                                    style="background-image: url({{ URL::asset('assets/images/users.png') }})">
                                </div>

                                <div class="msg-bubble">
                                    <div class="msg-info">
                                        <div class="msg-info-name">{{ Auth::user()->name }}</div>
                                        <div class="msg-info-time">
                                            {{ \Carbon\Carbon::parse($row->created_at)->diffForHumans() }}</div>
                                    </div>

                                    <div class="msg-text">
                                        {{ $row->message }}
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </main>

                @if ($ticket->status == 'open')
                    <div class="msger-inputarea">
                        <input type="text" class="msger-input" placeholder="Enter your message...">
                        <button type="submit" class="msger-send-btn">Send</button>
                    </div>
                @else
                    <div class="msger-inputarea">
                        <input type="text" class="msger-input" disabled placeholder="Enter your message...">
                        <button type="submit" class="msger-send-btn" disabled>Send</button>
                    </div>
                @endif
            </section>
        </div>

    </div>

    @if ($ticket->status == 'open')
        <script>
            var objDiv = document.querySelector(".msger-chat");
            $(document).ready(function() {
                var pusher = new Pusher('{{ env('PUSHER_APP_KEY') }}', {
                    cluster: 'ap1'
                });
                var channel = pusher.subscribe('chat');
                channel.bind('chat-event', function(data) {
                    var data = data.data;
                    if (data.type == 'admin') {
                        $('.msger-chat').append(data.html);
                        objDiv.scrollTop = objDiv.scrollHeight;
                    }
                });
            });
            // if press button enter
            $('.msger-input').keypress(function(e) {
                if (e.which == 13) {
                    e.preventDefault();
                    var message = $('.msger-input').val();
                    if (message != '') {
                        $.ajax({
                            url: "{{ route('send.message') }}",
                            type: "POST",
                            data: {
                                "_token": "{{ csrf_token() }}",
                                "message": message,
                                "ticket_id": "{{ $ticket->ticket_id }}"
                            },
                            dataType: "json",
                            success: function(data) {
                                $('.msger-input').val('');
                                $('.msger-chat').append(data.html);
                                objDiv.scrollTop = objDiv.scrollHeight;
                            }
                        });
                    }
                }
            });
            $('.msger-send-btn').click(function() {
                var message = $('.msger-input').val();
                if (message != '') {
                    $.ajax({
                        url: "{{ route('send.message') }}",
                        type: "POST",
                        data: {
                            "_token": "{{ csrf_token() }}",
                            "message": message,
                            "ticket_id": "{{ $ticket->ticket_id }}"
                        },
                        dataType: "json",
                        success: function(data) {
                            $('.msger-input').val('');
                            $('.msger-chat').append(data.html);
                            objDiv.scrollTop = objDiv.scrollHeight;
                        }
                    });
                }
            });
            var objDiv = document.querySelector(".msger-chat");
            objDiv.scrollTop = objDiv.scrollHeight;
        </script>
    @endif
@endsection
