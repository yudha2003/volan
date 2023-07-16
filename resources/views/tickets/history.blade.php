@extends('templates.main')
@section('content')
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
@livewireStyles
<livewire:ticket-table />
@livewireScripts
@endsection