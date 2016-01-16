<?php namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

use Input;
use DB;
use Request;
use Response;
use App\leader;

class LeaderController extends Controller {

	public function index()
	{
          if(Request::ajax([])) {
           $leader = Input::all();
           $addr=$leader['address'];
           $data= DB::table('leaders')->where('Constituency', $leader)->first();           
           if(!empty($data))
           print_r(json_encode($data));
           } 
      }

	

}
