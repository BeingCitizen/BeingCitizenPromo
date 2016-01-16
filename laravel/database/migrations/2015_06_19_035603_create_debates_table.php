<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDebatesTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('debates', function(Blueprint $table)
		{
			$table->increments('did');
                  $table->string('name');
                  $table->text('debate_text'); 
                  $table->string('category');   
                  $table->date('start_date');  
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
		Schema::drop('debates');
	}

}
