<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class debate extends Model {

	protected $fillable = ['name',
                  'debate_text','category',
                   'start_date']; 


}
