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
        Schema::create('histories', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->string('layanan');
            $table->text('target');
            $table->string('quantity');
            $table->string('start_count');
            $table->string('remains');
            $table->enum('status', ['pending', 'partial', 'process', 'done', 'error']);
            $table->enum('refill', ['1', '0']);
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
        Schema::dropIfExists('histories');
    }
};
