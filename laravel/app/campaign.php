<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class campaign extends Model {

	protected $fillable = ['name',
                  'campaign_text', 'constituency',
                  'started_by','category', 'status', 'start_date']; 

}
