<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Input;
use Illuminate\Http\Request;
use DB;
use Session;
use View;
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
            //print_r();
           }
           else {
           $id=DB::table('users')->insertgetId(['name'=>$name, 'gender'=>$gender, 'password'=>$password, 'contact_no'=>$contact, 'residence'=>$residence, 'state'=>$state, 'constituency'=>$neighbour, 'pic_link'=>$image, 'about_user'=>$about, 'start_date'=>date('Y-m-d H:i:s'), 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
           $data= DB::table('users')->where(['name' =>$name,'password'=>$password])->select('user_id','name', 'gender', 'contact_no', 'residence', 'state', 'constituency', 'pic_link', 'about_user', 'start_date', 'created_at', 'updated_at')->first();
           session()->regenerate();
           Session::put('user_id', $data);
           print_r(json_encode($id));   
              }
     }
	  public function blog_upload($id)
     {
         //$data['id'] = $id;
         return View::make('blog_upload',['id' => $id]);
     } 

	 public function set_blogs(){
		 $blogs=Input::all();
		 $title= $blogs['title'];
		 $body= $blogs['body'];
		 $uid= $blogs['uid'];
		 $id= DB::table("blogs")->insertgetId(['title'=>$title, 'body'=> $body, 'user_id'=>$uid,'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
		 print_r(json_encode($id));  
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
            //print_r();
           }
           else {
           DB::table('mla_details')->insert(['name'=>$name, 'gender'=>$gender, 'password'=>$password, 'contact_no'=>$contact, 'residence'=>$residence, 'state'=>$state, 'constituency'=>$neighbour, 'pic_link'=>$image, 'about_user'=>$about, 'start_date'=>date('Y-m-d H:i:s'), 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
            }
           $id=DB::table('mla_details')->orderBy('created_at','desc')->select('user_id','name', 'gender', 'contact_no', 'residence', 'state', 'constituency', 'pic_link', 'about_user', 'start_date', 'created_at', 'updated_at')->first();
           session()->regenerate();
           Session::put('mla_id', $id);
           //print_r(json_encode($data));
           print_r(json_encode($id));   
     }
 
     public function login()
     {
        $user = Input::all();
        $uname=$user['user_name'];
        $passwd=$user['password'];
        $data= DB::table('users')->where(['name' =>$uname,'password'=>$passwd])->select('user_id','name', 'gender', 'contact_no', 'residence', 'state', 'constituency', 'pic_link', 'about_user', 'start_date', 'created_at', 'updated_at')->first(); 
        if($data) 
        { 
        session()->regenerate();
        Session::put('user_id', $data);
        print_r(json_encode($data));
        }
     }
	 public function login_admin()
     {
        $user = Input::all();
        $uname=$user['username'];
        $passwd=$user['password'];
        $data= DB::table('admin')->where(['name' =>$uname,'passward'=>$passwd])->select('admin_id','name','start_time')->first(); 
        if($data) 
        { 
        session()->regenerate();
        Session::put('admin_details', $data);
        print_r(json_encode($data));
        }
     }
      public function leaders()
     {
        $user = Input::all();
        $uname=$user['constituency'];
        $data= DB::table('leaders')->where(['Constituency' =>$uname])->get(); 
        if($data) 
        { 
         print_r(json_encode($data));
        }
      }
     public function login_mla()
     {
        $user = Input::all();
        $uname=$user['user_name'];
        $passwd=$user['password'];
        $data= DB::table('mla_details')->where(['name' =>$uname,'password'=>$passwd])->select('user_id','name', 'gender', 'contact_no', 'residence', 'state', 'constituency', 'pic_link', 'about_user', 'start_date', 'created_at', 'updated_at')->first(); 
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
	   public function admin_id()
	{
         session()->regenerate();
         $data=Session::get('admin_details');
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
         $data= DB::table('users')->where('user_id',$uid)->select('user_id','name', 'gender', 'contact_no', 'residence', 'state', 'constituency', 'pic_link', 'about_user', 'start_date', 'created_at', 'updated_at')->first(); 
         if($data)
         print_r(json_encode($data));
      }    
	  public function mla()
	{ 
         $user = Input::all();
         $uid=$user['uid'];
         $data= DB::table('mla_details')->where('user_id',$uid)->select('user_id','name', 'gender', 'contact_no', 'residence', 'state', 'constituency', 'pic_link', 'about_user', 'start_date', 'created_at', 'updated_at')->first(); 
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

        public function mla_hashtags()
	{
         //$camp=0;
         $user = Input::all();
         $uid=$user['uid'];
        
          $data= DB::table('mla_hashtag_posts')->where('user_id', $uid)->select('content','post_date')->orderBy('post_date', 'desc')->get();   
                     
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
      public function poll_vote(){
        $poll=Input::all();
        $uid=$poll['user_id'];
        $poll_id=$poll['poll_id'];
        $choice=$poll['choice'];
        $check=DB::table('user_pollrecord')->where(['poll_id'=>$poll_id, 'user_id'=>$uid])->get();
        if(!$check){//if user hasn't voted yet
        DB::table('user_pollrecord')->insert(['poll_id'=>$poll_id, 'user_id'=>$uid, 'choice'=>$choice]);
          if($choice==1){
            DB::table('poll_count')->where(['poll_id'=>$poll_id])->increment('yes_count');
          }
          else if($choice==0){
            DB::table('poll_count')->where(['poll_id'=>$poll_id])->increment('no_count');
          }
          else if($choice==2){
            DB::table('poll_count')->where(['poll_id'=>$poll_id])->increment('other_count');
          }
        }
     //if user has already voted
        else{
        //  $prechoice=DB::table('user_pollRecord')->where(['poll_id'=>$poll_id, 'user_id'=>$uid, 'choice'=>$choice])->first();
          DB::table('user_pollrecord')->where(['poll_id'=>$poll_id, 'user_id'=>$uid])->update(['choice'=>$choice]);
          if($choice==1){
        // DB::table('poll_count')->where(['poll_id'=>$poll_id])->decrement($prechoice['choice']);
            DB::table('poll_count')->where(['poll_id'=>$poll_id])->increment('yes_count');
           }
           else if($choice==0){
          //DB::table('poll_count')->where(['poll_id'=>$poll_id])->decrement($prechoice['choice']);
            DB::table('poll_count')->where(['poll_id'=>$poll_id])->increment('no_count');
           }
           else if($choice==2){
          //DB::table('poll_count')->where(['poll_id'=>$poll_id])->decrement($prechoice['choice']);
            DB::table('poll_count')->where(['poll_id'=>$poll_id])->increment('other_count');
           }
        }
    print_r(json_encode($check));
        }
    
      public function create_poll(){
        $poll=Input::all();
        $title=$poll['title'];
        $descript=$poll['description'];
        $id=DB::table('poll_details')->insertGetId(['poll_title'=>$title, 'poll_description'=>$descript]);
        DB::table('poll_count')->insert(['poll_id'=>$id]);
      }
      public function edit_poll(){
        $poll=Input::all();
        $id=$poll['poll_id'];
        $title=$poll['title'];
        $poll_description=$poll['description'];
        $id=DB::table('poll_details')->where(['poll_id'=>$id])->update(array('poll_title' =>$title ,'poll_description'=>$poll_description ));
        DB::table('poll_count')->insert(['poll_id'=>$id]);
      }
       public function show_poll(){
        $data=DB::table('poll_details')->leftJoin('poll_count','poll_count.poll_id','=','poll_details.poll_id')->get();
        if(!empty($data))
           print_r(json_encode($data));
      }
       public function delete_poll(){
        $poll=Input::all();
        $id=$poll['poll_id'];
       // $id=DB::table('poll_details')->where(['poll_title'=>$title])->select('poll_id');
        DB::table('poll_count')->where(['poll_id'=>$id])->delete();
        DB::table('poll_details')->where(['poll_id'=>$id])->delete();
        DB::table('user_pollRecord')->where(['poll_id'=>$id])->delete();
      }

                  
}
