<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategorysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('Categorys', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50);
            $table->integer('pid')->unsigned();
            $table->tinyInteger('sort');
            $table->boolean('status');

            $table->index('pid');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
        Schema::drop('Categorys');
    }
}
