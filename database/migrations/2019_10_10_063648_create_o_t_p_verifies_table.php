<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOTPVerifiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('o_t_p_verifies', function (Blueprint $table) {
            $table->increments('id');
            $table->string('temp_email');
            $table->integer('token_email')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->boolean('verified')->default(0);

        
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
        Schema::dropIfExists('o_t_p_verifies');
    }
}
