<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class leader extends Model {

	protected $fillable= ['S_No', 'Name', 'Constituency','Education', 'Profession', 'Assets', 'Liabilities', 'Household_Income', 'Criminal_Cases' ,'Localities'];

   }
