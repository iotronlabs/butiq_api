<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddImagesToProductsVariationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('product_variations', function (Blueprint $table) {
            $table->string('pv_image_1')->nullable();
            $table->string('pv_image_2')->nullable();
            $table->string('pv_image_3')->nullable();
            $table->string('pv_image_4')->nullable();
            $table->string('pv_image_5')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_variations', function (Blueprint $table) {
           $table->drop('pv_image_1');
           $table->drop('pv_image_2');
           $table->drop('pv_image_3');
           $table->drop('pv_image_4');
           $table->drop('pv_image_5');


        });
    }
}
