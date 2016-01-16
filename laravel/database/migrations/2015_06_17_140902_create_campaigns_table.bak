<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampaignsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('campaigns', function(Blueprint $table)
		{
			$table->increments('cid');
                  $table->string('name');
                  $table->text('campaign_text'); 
                  $table->string('constituency')->references('Constituency')->on('constituency')->onDelete('cascade');
                  $table->integer('started_by')->references('uid')->on('users')->onDelete('cascade');
                  $table->integer('status');
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
		Schema::drop('campaigns');
	}

}
