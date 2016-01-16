<?php namespace App\Http\Controllers;
use Input;
use DB;
use Response;
use Request;
use App\leader;
class DetailsController extends Controller {

/**	public function __construct()
	{
		$this->middleware('guest');
	}*/

	public function index()
	{
          if(Request::ajax([])) {
           $leader = Input::all();
           $addr=$leader['address'];
           $data= DB::table('leaders')->where('Constituency', $leader)->first();           
           print_r(json_encode($data));
           } 
      }

}
