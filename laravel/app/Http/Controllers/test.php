<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Input;
use Illuminate\Http\Request;
use DB;
use Session;
class UserController extends Controller {

     public function signup()
	{

	     $user = Input::all();
           $name=$user['user_name'];
           $gender=$user['gender'];

           $password=$user['password'];
           $contact=$user['contact']; 
           $residence=$user['residence'];
           $state=$user['state'];
           $neighbour=$user['neighbourhood'];
           $about=$user['about_user'];
           $image=$user['picture_link'] ;
           if(!$image){
           if($gender=="female")
           $image = '/laravel/public/public/user_pic/female.gif';
           else
           $image='/laravel/public/public/user_pic/male.gif';
           }  
           $data= DB::table('users')->where(['name'=>$name,'password'=>$password])->first();
           if(!empty($data))
           {
            //print_r('User name not available');
            print_r();
           }
           else {
           $id=DB::table('users')->insertgetId(['name'=>$name, 'gender'=>$gender, 'password'=>$password, 'contact_no'=>$contact, 'residence'=>$residence, 'state'=>$state, 'constituency'=>$neighbour, 'pic_link'=>$image, 'about_user'=>$about, 'start_date'=>date('Y-m-d H:i:s'), 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
           print_r(json_encode($id));   
              }
     }
     public function mla_signup()
	{

	     $user = Input::all();
           $name=$user['user_name'];
           $gender=$user['gender'];

           $password=$user['password'];
           $contact=$user['contact']; 
           $residence=$user['residence'];
           $state=$user['state'];
           $neighbour=$user['neighbourhood'];
           $about=$user['about_user'];
           $image=$user['picture_link'] ;
           if(!$image){
           if($gender=="female")
           $image = '/laravel/public/public/user_pic/female.gif';
           else
           $image='/laravel/public/public/user_pic/male.gif';
           }  
           $data= DB::table('mla_details')->where(['name'=>$name,'password'=>$password])->first();
           if(!empty($data))
           {
            //print_r('User name not available');
            print_r();
           }
           else {
           $id=DB::table('mla_details')->insertgetId(['name'=>$name, 'gender'=>$gender, 'password'=>$password, 'contact_no'=>$contact, 'residence'=>$residence, 'state'=>$state, 'constituency'=>$neighbour, 'pic_link'=>$image, 'about_user'=>$about, 'start_date'=>date('Y-m-d H:i:s'), 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
            print_r(json_encode($id)); 
              }
     }
 
     public function login()
     {
        $user = Input::all();
        $uname=$user['user_name'];
        $passwd=$user['password'];
        $data= DB::table('users')->where(['name' =>$uname,'password'=>$passwd])->first(); 
        if($data) 
        { 
        session()->regenerate();
        Session::put('user_id', $data);
        print_r(json_encode($data));
        }
     
     
      }
     public function login_mla()
     {
        $user = Input::all();
        $uname=$user['user_name'];
        $passwd=$user['password'];
        $data= DB::table('mla_details')->where(['name' =>$uname,'password'=>$passwd])->first(); 
        if($data) 
        { 
        session()->regenerate();
        Session::put('mla_id', $data);
        print_r(json_encode($data));
        }
     
     
      }

     public function logout()
     {
      session::flush();

     }
     public function campaign_comment()
	{
         $user = Input::all();
         $uid=$user['uid'];
         $data= DB::table('users')->where('user_id', $uid)->first(); 
         print_r(json_encode($data));
      }    
      public function user_id()
	{
         session()->regenerate();
         $data=Session::get('user_id');
         //$uid=json_encode($uid);
         //$uid=$uid[user_id];
         //$data= DB::table('users')->where('user_id', $uid)->first();
         if($data)
         print_r(json_encode($data));
      }
       public function user_id_mla()
	{
         session()->regenerate();
         $data=Session::get('mla_id');
         if($data)
         print_r(json_encode($data));
      }

       public function user()
	{ 
         $user = Input::all();
         $uid=$user['uid'];
         $data= DB::table('users')->where('user_id',$uid)->first(); 
         if($data)
         print_r(json_encode($data));
      }    
       public function error()
	{ 
         $data='404 Error';
         print_r(json_encode($data));
      }    

       public function user_profile()
	{
         //$camp=0;
         $user = Input::all();
         $uid=$user['uid'];
        
          $camp= DB::table('campaigns')->where('started_by',$uid)->get();  
            

         
         print_r(json_encode($camp));
      }              
        public function user_camp_follow()
	{
         //$camp=0;
         $user = Input::all();
         $uid=$user['uid'];
        
          $data= DB::table('camp_follow')->where('user_id', $uid)->join('campaigns', 'campaigns.campaign_id', '=', 'camp_follow.campaign_id')->select('campaigns.*')->get();   
            

         
         print_r(json_encode($data));
      }    

        public function user_hashtags()
	{
         //$camp=0;
         $user = Input::all();
         $uid=$user['uid'];
        
          $data= DB::table('hashtag_posts')->where('user_id', $uid)->select('content','post_date')->orderBy('post_date', 'desc')->get();   
                     
         print_r(json_encode($data));
      }    

        public function user_follow()
	{
         //$camp=0;
         $user = Input::all();
         $uid=$user['uid'];
        
          $data= DB::table('users as u1')->where('u1.user_id', $uid)->join('users as u2', 'u2.constituency', '=', 'u1.constituency')->select('u2.*')->where('u2.user_id', '!=', $uid)->get();   
                     
         print_r(json_encode($data));
      } 
         public function check_follow()
      {
       
        $user_id=Input::all(); 
        $id=$user_id['user_id'];
        $uid=$user_id['follower_id'];  
        $data=DB::table('user_follow')->where(['user_id'=> $uid,'follow_id'=>$id])->first();
        //if(empty($data))
        print_r(json_encode($data)); 
      
     }
       
       public function follow()
      {
          
          $user_id=Input::all();
          $id=$user_id['user_id'];
          $uid=$user_id['follower_id'];
          //$data= DB::table('user_follow')->where('user_id', $uid)->first();  
          //if(empty($data))
          DB::table('user_follow')->insert(['user_id'=>$uid, 'follow_id'=>$id]);
      }
       public function unfollow()
      {
            //$uid=1;
          $user_id=Input::all(); 
          $id=$user_id['user_id'];
         $uid=$user_id['follower_id'];  
         //$data= DB::table('user_follow')->where('user_id', $uid)->first();  
          //if(!empty($data))

           DB::table('user_follow')->where([ 'user_id'=>$uid, 'follow_id'=>$id])->delete();
           


      }

                  
}
