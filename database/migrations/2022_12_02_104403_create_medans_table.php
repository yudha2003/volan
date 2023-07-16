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
        Schema::create('medans', function (Blueprint $table) {
            $table->id();
            $table->string('category');
            $table->string("name");
            $table->integer('price');
            $table->integer('min');
            $table->integer('max');
            $table->text('description');
            $table->enum('type', ['primary', 'custom_comments']);
            $table->string('refill');
            $table->string('masa_refill');
            $table->string('average_time');
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
        Schema::dropIfExists('medans');
    }
};
