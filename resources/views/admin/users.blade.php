@extends('templates.admin')
@section('content')
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
@livewireStyles
<livewire:admin.user-table />
@livewireScripts
@endsection