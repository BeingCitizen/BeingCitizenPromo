<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Input;
use App\user;
use App\campaign;
use App\campaign_category;
use DB;
use Redirect;
use Illuminate\Http\Request;
use Response;
class HomeController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index($id)
	{
        $data=Input::all();
        $id=$data['campaign_id'];
	  $image = Input::file('image');
	   $destinationPath = 'public/uploads/';
	  //print_r($image);
        if($image){
        $filename = rand(0,100000000000000)."-".$image->getClientOriginalName();
        Input::file('image')->move($destinationPath, $filename);
       // print_r($filename); 
        DB::update('update campaigns set image =? where campaign_id= ?',[$destinationPath.$filename, $id] );
        //print_r($destinationPath.$filename);
            }
          return Redirect::to('/../../BeingCitizen/campaign_display.html'."?".'camapign_id='.$id);
        //return Redirect::back()->with('message','Operation Successful !'); 
}
public function blog_upload($id)
	{
        $data=Input::all();
        $id=$data['blog_id'];
	    $image = Input::file('image');
	   $destinationPath = 'public/blog_uploads/';
	  //print_r($image);
        if($image){
        $filename = rand(0,100000000000000)."-".$image->getClientOriginalName();
        Input::file('image')->move($destinationPath, $filename);
       // print_r($filename); 
        DB::update('update blogs set image =? where blog_id= ?',[$destinationPath.$filename, $id] );
        //print_r($destinationPath.$filename);
            }
          return Redirect::to('/../../BeingCitizen/blog.html');
        //return Redirect::back()->with('message','Operation Successful !'); 
}
	public function debate_upload($id)
	{
        $data=Input::all();
        $id=$data['debate_id'];
	  $image = Input::file('image');
	   $destinationPath = 'public/debate_uploads/';
	  //print_r($image);
        if($image){
        $filename = rand(0,100000000000000)."-".$image->getClientOriginalName();
        Input::file('image')->move($destinationPath, $filename);
       // print_r($filename); 
        DB::update('update debates set image =? where debate_id= ?',[$destinationPath.$filename, $id] );
        //print_r($destinationPath.$filename);
            }
          return Redirect::to('/../../BeingCitizen/debate_comment.html'."?".'debate_id='.$id);
        //return Redirect::back()->with('message','Operation Successful !'); 
}



}
