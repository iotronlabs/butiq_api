<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShippingMethodStateTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shipping_method_state', function (Blueprint $table) {
           $table->integer('state_id')->unsigned()->index();
           $table->integer('shipping_method_id')->unsigned()->index();


           $table->foreign('state_id')->references('id')->on('states');
           $table->foreign('shipping_method_id')->references('id')->on('shipping_methods');


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('shipping_method_state');
    }
}
