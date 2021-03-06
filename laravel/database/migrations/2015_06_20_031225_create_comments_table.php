<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCommentsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('comments', function(Blueprint $table)
		{
			$table->increments('id');
                  $table->text('content');
                  $table->integer('qid')->references('did')->on('debates')->onDelete('cascade');
                  $table->string('view');
                  $table->integer('uid')->references('uid')->on('users')->onDelete('cascade');
                  $table->integer('upvotes');
                  $table->integer('downvotes');  
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
		Schema::drop('comments');
	}

}
