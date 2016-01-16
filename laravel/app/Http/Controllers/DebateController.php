<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Input;
use DB;
use Illuminate\Http\Request;
use App\user;
use App\debate;
use App\debate_category;
use App\leader;
use App\comment;
use View;
class DebateController extends Controller {

	public function index()
	{
           $debate = Input::all();
           $title=$debate['title'];
           $category=$debate['categ'];
           $text=$debate['body'];
           $id = DB::table('debates')->insertGetId(['name'=>$title, 'debate_text'=>$text,'category'=>$category, 'start_date'=>date('Y-m-d H:i:s'), 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
         
            print_r(json_encode($id)); 
 

      }
      public function show_debateCategory()
      {
          $debate=Input::all();
          $cid=$debate['category'];
          $data= DB::table('debates')->where('category', $cid)->get();
           if(!empty($data))
           print_r(json_encode($data));

      }
 
      public function all_debate()
      {
           $data= DB::table('debates')->select('category')->distinct()->get();
           if(!empty($data))
           print_r(json_encode($data));

      }
      public function show_debateSorted()
      {
          //$campaign=Input::all();
          //$cid=$campaign['debate_id'];
          $data= DB::table('debates')->orderBy('start_date','desc')->get();
           if(!empty($data))
           print_r(json_encode($data));

      }

      public function show()
      {
          $debate=Input::all();
         $did=$debate['debate_id'];
          $data= DB::table('debates')->where('debate_id', $did)->first();  
           if(!empty($data))
           print_r(json_encode($data));

      }
      
      public function show_comments()
      {
          $debate=Input::all();
          $did=$debate['debate_id'];
          $data= DB::table('debate_comments1')
                 ->where('debate_id', $did)
                 ->leftJoin('users', 'users.user_id', '=', 'debate_comments1.user_id')
                 ->leftJoin('debate_upvote', 'debate_upvote.comment_id', '=', 'debate_comments1.comment_id')
                 ->select('debate_comments1.*', 'users.name','users.pic_link','users.user_id',DB::raw('count(debate_upvote.upvote) as likes'))
                 ->groupBy('debate_comments1.comment_id'); 
          $data2= DB::table('debate_comments2')
                  ->where('debate_id', $did)
                 ->leftJoin('users', 'users.user_id', '=', 'debate_comments2.user_id')
                 ->leftJoin('debate_upvote', 'debate_upvote.comment_id', '=', 'debate_comments2.comment_id')
                 ->select('debate_comments2.*', 'users.name','users.pic_link','users.user_id',DB::raw('count(debate_upvote.upvote) as likes'))
                 ->groupBy('debate_comments2.comment_id');//->orderBy('likes', 'desc');  
 
          $data3= DB::table('debate_comments3')
                 ->where('debate_id', $did)
                 ->leftJoin('users', 'users.user_id', '=', 'debate_comments3.user_id')
                 ->leftJoin('debate_upvote', 'debate_upvote.comment_id', '=', 'debate_comments3.comment_id')
                  ->select('debate_comments3.*', 'users.name','users.pic_link','users.user_id',DB::raw('count(debate_upvote.upvote) as likes'))
                 ->groupBy('debate_comments3.comment_id');//->orderBy('likes', 'desc');
           $result=$data->union($data2)->union($data3)->orderBy('likes', 'desc')->get();
          //while(!empty($data))
          //$id=DB::table('user_comment')
          
          print_r(json_encode($result));

      }
        public function delete_comment()
      {
          $comment=Input::all();
          $comment_id=$comment['comment_id'];
          $user_id=$comment['uid'];
          DB::table('debate_comments1')->where(['user_id'=>$user_id,'comment_id'=>$comment_id])->delete();
       
          DB::table('debate_comments2')->where(['user_id'=>$user_id,'comment_id'=>$comment_id])->delete();

          DB::table('debate_comments3')->where(['user_id'=>$user_id,'comment_id'=>$comment_id])->delete();

         
      }

       public function set_comment()
      {
          $debate=Input::all();
          $content=$debate['comment'];
          $did=$debate['debate_id'];
          $opinion=$debate['opinion'];
          $uid=$debate['uid']; 
          
          DB::table('debate_comments1')->where(['user_id'=>$uid])->delete();
       
          DB::table('debate_comments2')->where(['user_id'=>$uid])->delete();

          DB::table('debate_comments3')->where(['user_id'=>$uid])->delete();

 
          $id = DB::table('debate_comments1')->insertGetId(['content'=>$content,'debate_id'=>$did,'yes_no'=>$opinion,'user_id'=>$uid, 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
        
          if($id==NULL){
          $id = DB::table('debate_comments2')->insertGetId(['content'=>$content,'debate_id'=>$did,'yes_no'=>$opinion,'user_id'=>$uid, 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
          if($id==NULL){
          $id = DB::table('debate_comments3')->insertGetId(['content'=>$content,'debate_id'=>$did,'yes_no'=>$opinion,'user_id'=>$uid, 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
          } 
          }
      }
        public function upvote()
      {
        
        $cid=Input::all(); 
        $id=$cid['comment_id'];
        $uid=$cid['uid'];  
        $data=DB::table('debate_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        //if(empty($data))
        print_r(json_encode($data)); 
      
     }
       public function like()
      {
        
        $cid=Input::all(); 
        $id=$cid['cid'];
         $uid=$cid['uid'];    
        $data=DB::table('debate_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data)) 
        DB::table('debate_upvote')->insert(['comment_id'=> $id,'user_id'=>$uid,'upvote'=>1]);
       /** else{
         DB::table('debate_upvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('upvote' => 1)); 
        }*/
        $res=DB::table('debate_downvote')->where(['comment_id'=> $id,'user_id'=>$uid]);
        if(!empty($res)){
        DB::table('debate_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();
        }

       // print_r(json_encode($data)); 
      
     }
       public function unlike()
      {
        
        $cid=Input::all(); 
        $id=$cid['cid'];
         $uid=$cid['uid'];    
        /**$data=DB::table('debate_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data))
         DB::table('debate_upvote')->insert(['comment_id'=> $id,'upvote'=>0,'user_id'=>$uid]);
        else{
         DB::table('debate_upvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('upvote' => 0));  
       // print_r(json_encode($data)); 
      }*/
        DB::table('debate_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();

     }

    public function downvote()
      {
        
        $cid=Input::all(); 
        $id=$cid['comment_id'];
         $uid=$cid['uid'];    
        $data=DB::table('debate_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        //if(empty($data))
        print_r(json_encode($data)); 
      
     }
       public function set_downvote()
      {
        
        $cid=Input::all(); 
        $id=$cid['cid'];
         $uid=$cid['uid'];    
        $data=DB::table('debate_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data)) 
        DB::table('debate_downvote')->insert(['comment_id'=> $id,'downvote'=>1,'user_id'=>$uid]);
        else{
         DB::table('debate_downvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('downvote' => 1)); 
        }
        $res=DB::table('debate_upvote')->where(['comment_id'=> $id,'user_id'=>$uid]);
        if(!empty($res)){
        DB::table('debate_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();
        }

       // print_r(json_encode($data)); 
      
     }
       public function unset_downvote()
      {
        
        $cid=Input::all(); 
        $id=$cid['cid'];
         $uid=$cid['uid'];    
        $data=DB::table('debate_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data))
         DB::table('debate_downvote')->insert(['comment_id'=> $id,'downvote'=>0,'user_id'=>$uid]);
        else{
         DB::table('debate_downvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('downvote' => 0));  
       // print_r(json_encode($data)); 
      }
     }
        public function upload($id)
     {
         //$data['id'] = $id;
         return View::make('debate_upload',['id' => $id]);
     } 


        public function vote()
       {
          $vote=Input::all();
          $cid=$vote['vote_id'];  
           $uid=$vote['uid'];  
          $data= DB::table('user_comment')->where('cid', $cid)->where('uid', $uid)->first();
          print_r(json_encode($data));
       }

}
