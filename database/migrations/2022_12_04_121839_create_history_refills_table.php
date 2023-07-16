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
        Schema::create('history_refills', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('refill_id');
            $table->text('layanan');
            $table->text('target');
            $table->enum('status', ['pending', 'process', 'done', 'failed']);
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
        Schema::dropIfExists('history_refills');
    }
};
