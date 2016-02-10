<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Input;
use View;
use DB;
use Illuminate\Http\Request;

class TagController extends Controller {

	public function index()
	{
           $tag=Input::all();
           $name=$tag['searchword'];
          
           $name=str_replace("@","",$name);
           $name=str_replace(" ","%",$name);
           
           $results = DB::table('ministeries_choice')
           ->where('name', 'LIKE', '%' . $name . '%')
           ->get();
            print_r(json_encode($results));      
     }
     public function hash_tag()
	{
           $tag=Input::all();
           $name=$tag['searchword'];
          
           $name=str_replace("#","",$name);
           $name=str_replace(" ","%",$name);
           
           $results = DB::table('hash_tag')
           ->where('tag', 'LIKE', '%' . $name . '%')
           ->get();
            print_r(json_encode($results));      
     }
    public function hashtag_data()
	{
           $tag = Input::all();
           $title=$tag['content'];
           $uid=$tag['user_id'];
		       $profile=$tag['profile'];
		       if($profile=="mla"){
			        $pid=DB::table('mla_hashtag_posts')->insertGetId(['user_id'=>$uid,'content'=>$title]);
		       }
		   else
           $pid=DB::table('hashtag_posts')->insertGetId(['user_id'=>$uid,'content'=>$title]);
           if($tag['tag']!=0)
           {
             $tag=$tag['tag'];
             foreach($tag as $hashtag){
              DB::table('post_tag')->insert(['post_id'=>$pid,'tag'=>$hashtag]);
  
             }

             }           
                   
      }
    public function get_posts()
	{
          // $tag = Input::all();
          // $title=$tag['tag'];
             $data=DB::table('post_tag')->leftJoin('hashtag_posts', 'hashtag_posts.post_id', '=', 'post_tag.post_id')->leftJoin('users', 'hashtag_posts.user_id', '=', 'users.user_id')->select('users.user_id','content','name','post_tag.post_id', 'pic_link', 'post_date')->distinct()->get();
             //$result= DB::table('hashtag_posts')->whereIn('post_id',$data)->get();
              print_r(json_encode($data)); 
                   
      }
    public function get_postsWithHash()
	{
             $tag = Input::all();
             $name=$tag['tag'];
             $name=str_replace("#","",$name);
            // $name=str_replace(" ","%",$name);

             $data=DB::table('post_tag')->leftJoin('hashtag_posts', 'hashtag_posts.post_id', '=', 'post_tag.post_id')->leftJoin('users', 'hashtag_posts.user_id', '=', 'users.user_id')->select('users.user_id','content','name','post_tag.post_id', 'pic_link', 'post_date')->where('tag',$name)->distinct()->get();
             //$result= DB::table('hashtag_posts')->whereIn('post_id',$data)->get();
              print_r(json_encode($data)); 
                   
      }
       public function get_posts_mla()
  {
          // $tag = Input::all();
          // $title=$tag['tag'];
             $data=DB::table('post_tag')->leftJoin('mla_hashtag_posts', 'mla_hashtag_posts.post_id', '=', 'post_tag.post_id')->leftJoin('mla_details', 'mla_hashtag_posts.user_id', '=', 'mla_details.user_id')->select('mla_details.user_id','content','name','post_tag.post_id', 'pic_link', 'post_date')->distinct()->get();
             //$result= DB::table('hashtag_posts')->whereIn('post_id',$data)->get();
              print_r(json_encode($data)); 
                   
      }
    public function get_postsWithHash_mla()
  {
             $tag = Input::all();
             $name=$tag['tag'];
             $name=str_replace("#","",$name);
            // $name=str_replace(" ","%",$name);

             $data=DB::table('post_tag')->leftJoin('mla_hashtag_posts', 'mla_hashtag_posts.post_id', '=', 'post_tag.post_id')->leftJoin('mla_details', 'mla_hashtag_posts.user_id', '=', 'mla_details.user_id')->select('mla_details.user_id','content','name','post_tag.post_id', 'pic_link', 'post_date')->where('tag',$name)->distinct()->get();
             //$result= DB::table('hashtag_posts')->whereIn('post_id',$data)->get();
              print_r(json_encode($data)); 
                   
      }


    }  