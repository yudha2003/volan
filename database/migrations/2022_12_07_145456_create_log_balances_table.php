<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('log_balances', function (Blueprint $table) {
            $table->id();
            $table->integer("user_id");
            $table->string('type');
            $table->text('kategori');
            $table->integer('jumlah');
            $table->integer('before_balance');
            $table->integer('after_balance');
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('log_balances');
    }
};
