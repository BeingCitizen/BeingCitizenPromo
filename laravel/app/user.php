<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class user extends Model {

		protected $fillable = ['name',
                  'views', 'password', 'pincode',
                  'email_id', 'start_date'];

}
