<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use View;
use Input;
use DB;
use Schema;
use Illuminate\Http\Request;
use App\user;
use App\campaign;
use App\campaign_category;
use App\leader;
class CampaignController extends Controller {

	public function index()
	{
           $camp = Input::all();
           $title=$camp['title'];
           $category=$camp['categ'];
           $const=$camp['constituency']; 
           $text=$camp['body'];
           $volunteer=$camp['volunteer'];
           $follow=$camp['follow'];  
           //$image=$camp['image'];
           $uid=$camp['user_id'];
             
           $id = DB::table('campaigns')->insertGetId(['name'=>$title, 'campaign_text'=>$text, 'constituency'=>$const, 'category'=>$category, 'started_by'=>$uid, 'followers'=>$follow, 'volunteers'=>$volunteer, 'start_date'=>date('Y-m-d H:i:s'), 'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
           if($camp['tag']!=0)
           {
             $tag=$camp['tag'];
             foreach($tag as $ministery){
              DB::table('ministeries_tagged')->insert(['department'=>$ministery,'campaign_id'=>$id]);
  
             }

             }           
          print_r(json_encode($id)); 
          
      }
     public function show($id)
     {
         //$data['id'] = $id;
         return View::make('upload',['id' => $id]);
     } 
     public function show_campaign()
      {
          $campaign=Input::all();
          $cid=$campaign['campaign_id'];
          $data= DB::table('campaigns')->where('campaign_id', $cid)->first();
           if(!empty($data))
           print_r(json_encode($data));

      }
	   public function const_camp()
      {
          $campaign=Input::all();
          $cid=$campaign['constituency'];
          $data= DB::table('campaigns')->where('constituency', $cid)->get();
           if(!empty($data))
           print_r(json_encode($data));

      }
      public function show_campaignSorted()
      {
          //$campaign=Input::all();
          //$cid=$campaign['campaign_id'];
          $data= DB::table('campaigns')->orderBy('start_date','desc')->get();
           if(!empty($data))
           print_r(json_encode($data));

      }

   public function show_campaignCategory()
      {
          $campaign=Input::all();
          $cid=$campaign['category'];
          $data= DB::table('campaigns')->where('category', $cid)->get();
           if(!empty($data))
           print_r(json_encode($data));

      }
    
    public function show_campaignTag()
      {
          $campaign=Input::all();
          $cid=$campaign['tag'];
          $data= DB::table('ministeries_tagged')->where('department', $cid)->leftJoin('campaigns', 'campaigns.campaign_id', '=', 'ministeries_tagged.campaign_id')->distinct()->get();
          if(!empty($data))
           print_r(json_encode($data));

      }

   public function campaigns_tags()
      {
          $campaign=Input::all();
          $data= DB::table('ministeries_tagged')->select('department')->distinct()->get();
           if(!empty($data))
           print_r(json_encode($data));

      }

     public function campaign_status()
      {
          $campaign=Input::all();
          $cid=$campaign['campaign_id'];
          $status=$campaign['status'];
          $data= DB::table('campaigns')->where('campaign_id',$cid)->update(['status'=>$status]);
           

      }

 public function show_campaignConstituency()
      {
          $campaign=Input::all();
          $cid=$campaign['constituency'];
          $data= DB::table('campaigns')->where('constituency', $cid)->distinct()->get();
           if(!empty($data))
           print_r(json_encode($data));

      }

   public function campaigns_constituencies()
      {
          $campaign=Input::all();
          $data= DB::table('campaigns')->select('constituency')->distinct()->get();
           if(!empty($data))
           print_r(json_encode($data));

      }

  public function all_campaign()
      {
           $data= DB::table('campaigns')->select('category')->distinct()->get();
           if(!empty($data))
           print_r(json_encode($data));

      }

      public function fetch_camp()
      {
          $campaign=Input::all();
          $cid=$campaign['constituency'];
          $data= DB::table('campaigns')->where('constituency', $cid)->get();
           if(!empty($data))
           print_r(json_encode($data));

      }

      public function tags()
      {
          $campaign=Input::all();
          $cid=$campaign['campaign_id'];
          $data= DB::table('ministeries_tagged')->where('campaign_id',$cid)->get();
          print_r(json_encode($data));

      }

       public function follow_unfollow()
      {
       // $uid=1;
        $campaign_id=Input::all(); 
        $cid=$campaign_id['campaign_id'];
        $uid=$campaign_id['uid'];
        $data=DB::table('camp_follow')->where(['campaign_id'=>$cid,'user_id'=>$uid])->first();
        
        print_r(json_encode($data));
                
      
     }
       public function set_volunteer()
      {
        //$uid=1;
        $campaign_id=Input::all(); 
        $uid=$campaign_id['uid']; 
       $cid=$campaign_id['campaign_id'];
       
  
        $data=DB::table('camp_volunteer')->where(['campaign_id'=>$cid,'user_id'=>$uid])->first();
        

        print_r(json_encode($data)); 
      
     }

 
       public function follow()
      {
          //$uid=1;
          $campaign_id=Input::all();
          $cid=$campaign_id['campaign_id'];
          $uid=$campaign_id['uid'];
          $data= DB::table('camp_follow')->where('user_id', $uid)->first();  
          
          DB::table('camp_follow')->insert(['user_id'=>$uid, 'campaign_id'=>$cid]);
            
          
      }
       public function unfollow()
      {
            //$uid=1;
          $campaign_id=Input::all(); 
          $cid=$campaign_id['campaign_id'];
         $uid=$campaign_id['uid'];  
         $data= DB::table('camp_follow')->where('user_id', $uid)->first();  
          
           DB::table('camp_follow')->where([ 'user_id'=>$uid, 'campaign_id'=>$cid])->delete();
           


      }
      public function volunteer()
      {
          //$uid=1;
          $campaign_id=Input::all();
          $cid=$campaign_id['campaign_id'];
          $uid=$campaign_id['uid'];
          $data= DB::table('camp_volunteer')->where('user_id', $uid)->first();  
         
           DB::table('camp_volunteer')->insert(['user_id'=>$uid, 'campaign_id'=>$cid]);
            
          
      }
       public function not_volunteer()
      {
           // $uid=1;
          $campaign_id=Input::all(); 
          $cid=$campaign_id['campaign_id'];
          $uid=$campaign_id['uid'];
          $data= DB::table('camp_volunteer')->where('user_id', $uid)->first();  
          
           DB::table('camp_volunteer')->where([ 'user_id'=>$uid, 'campaign_id'=>$cid])->delete();
           


      }

       public function vote()
      {
       // $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['comment_id'];
        $uid=$campaign_id['uid'];  
        $data=DB::table('camp_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        //if(empty($data))
        print_r(json_encode($data)); 
      
     }
        public function vote_mla()
      {
       // $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['comment_id'];
        $uid=$campaign_id['uid'];  
        $data=DB::table('camp_upvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        //if(empty($data))
        print_r(json_encode($data)); 
      
     }

       public function like()
      {
        //$uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
         $uid=$campaign_id['uid']; 
        $data=DB::table('camp_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data)) 
        DB::table('camp_upvote')->insert(['comment_id'=> $id,'user_id'=>$uid,'upvote'=>1]);
        /**else{
         DB::table('camp_upvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('upvote' => 1)); 
         
      
        }*/
        $res=DB::table('camp_downvote')->where(['comment_id'=> $id,'user_id'=>$uid]);
        if(!empty($res)){
        DB::table('camp_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();
        }
       // print_r(json_encode($data)); 
      
     }
       public function unlike()
      {
      //  $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
        $uid=$campaign_id['uid'];  
        /**$data=DB::table('camp_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data))
         DB::table('camp_upvote')->insert(['comment_id'=> $id,'upvote'=>0,'user_id'=>$uid]);
        else{
         DB::table('camp_upvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('upvote' => 0));  
       // print_r(json_encode($data)); 
     // }*/
       DB::table('camp_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();

     }

    public function downvote()
      {
       // $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['comment_id'];
         $uid=$campaign_id['uid']; 
        $data=DB::table('camp_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        //if(empty($data))
        print_r(json_encode($data)); 
      
     }
       public function set_downvote()
      {
       // $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
         $uid=$campaign_id['uid']; 
        $data=DB::table('camp_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data)) 
        DB::table('camp_downvote')->insert(['comment_id'=> $id,'downvote'=>1,'user_id'=>$uid]);
        else{
         DB::table('camp_downvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('downvote' => 1)); 
        }
        $res=DB::table('camp_upvote')->where(['comment_id'=> $id,'user_id'=>$uid]);
        if(!empty($res)){
        DB::table('camp_upvote')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();
        }
 
       // print_r(json_encode($data)); 
      
     }
       public function unset_downvote()
      {
        //$uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
        $uid=$campaign_id['uid'];  
        $data=DB::table('camp_downvote')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data))
         DB::table('camp_downvote')->insert(['comment_id'=> $id,'downvote'=>0,'user_id'=>$uid]);
        else{
         DB::table('camp_downvote')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('downvote' => 0));  
       // print_r(json_encode($data)); 
      }
     }

         
    public function set_comment()
      {
          $campaign=Input::all();
          $content=$campaign['comment'];
          $cid=$campaign['campaign_id'];
          $uid=$campaign['uid'];
          $id = DB::table('camp_comment1')->insertGetId(['content'=>$content,'campaign_id'=>$cid,'user_id'=>$uid,'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
       
          if($id==NULL){
          $id = DB::table('camp_comment2')->insertGetId(['content'=>$content,'campaign_id'=>$cid,'user_id'=>$uid,'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
          if($id==NULL){
          $id = DB::table('camp_comment3')->insertGetId(['content'=>$content,'campaign_id'=>$cid,'user_id'=>$uid,'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
          } 
          }
      }
      public function set_comment_mla()
      {
          $campaign=Input::all();
          $content=$campaign['comment'];
          $cid=$campaign['campaign_id'];
          $uid=$campaign['uid'];
          $id = DB::table('camp_comment_mla')->insertGetId(['content'=>$content,'campaign_id'=>$cid,'user_id'=>$uid,'created_at'=>\Carbon\Carbon::now()->toDateTimeString(), 'updated_at'=>\Carbon\Carbon::now()->toDateTimeString()]);
               
      }

     public function delete_comment()
      {
          $comment=Input::all();
          $comment_id=$comment['comment_id'];
          $user_id=$comment['uid'];
          DB::table('camp_comment1')->where(['user_id'=>$user_id,'comment_id'=>$comment_id])->delete();
       
          DB::table('camp_comment2')->where(['user_id'=>$user_id,'comment_id'=>$comment_id])->delete();

          DB::table('camp_comment3')->where(['user_id'=>$user_id,'comment_id'=>$comment_id])->delete();
          //DB::table('camp_comment_mla')->where(['user_id'=>$user_id,'comment_id'=>$comment_id])->delete();
         
      }

 
      public function show_comments()
      {
          $campaign=Input::all();
          $cid=$campaign['campaign_id'];
          $data= DB::table('camp_comment1')
                 ->where('campaign_id', $cid)
                 ->leftJoin('users', 'users.user_id', '=', 'camp_comment1.user_id')
                 ->leftJoin('camp_upvote', 'camp_upvote.comment_id', '=', 'camp_comment1.comment_id')
                 ->select('camp_comment1.*', 'users.name','users.pic_link','users.user_id',DB::raw('count(camp_upvote.upvote) as likes'))
                 ->groupBy('camp_comment1.comment_id');//->orderBy('likes', 'DESC');  
          $data2= DB::table('camp_comment2')
                  ->where('campaign_id', $cid)
                 ->leftJoin('users', 'users.user_id', '=', 'camp_comment2.user_id')
                 ->leftJoin('camp_upvote', 'camp_upvote.comment_id', '=', 'camp_comment2.comment_id')
                 ->select('camp_comment2.*', 'users.name','users.pic_link','users.user_id',DB::raw('count(camp_upvote.upvote) as likes'))
                 ->groupBy('camp_comment2.comment_id');//->orderBy('likes', 'DESC');  
 
          $data3= DB::table('camp_comment3')
                 ->where('campaign_id', $cid)
                 ->leftJoin('users', 'users.user_id', '=', 'camp_comment3.user_id')
                 ->leftJoin('camp_upvote', 'camp_upvote.comment_id', '=', 'camp_comment3.comment_id')
                  ->select('camp_comment3.*', 'users.name','users.pic_link','users.user_id',DB::raw('count(camp_upvote.upvote) as likes'))
                 ->groupBy('camp_comment3.comment_id');//->orderBy('likes', 'DESC'); 
         
          $result=$data->union($data2)->union($data3)->orderBy('likes', 'DESC')->get(); 
          print_r(json_encode($result));
           // print_r($cid);
      }
      public function show_mla_comments()
      {
          $campaign=Input::all();
          $cid=$campaign['campaign_id'];
          $data= DB::table('camp_comment_mla')
                 ->where('campaign_id', $cid)
                 ->leftJoin('mla_details', 'mla_details.user_id', '=', 'camp_comment_mla.user_id')
                 ->select('camp_comment_mla.*', 'mla_details.name','mla_details.pic_link','mla_details.user_id');
                  $result=$data->get(); 
                  print_r(json_encode($result));
           // print_r($cid);
      }

   public function like_mla()
      {
        //$uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
         $uid=$campaign_id['uid']; 
        $data=DB::table('camp_upvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data)) 
        DB::table('camp_upvote_mla')->insert(['comment_id'=> $id,'user_id'=>$uid,'upvote'=>1]);
        /**else{
         DB::table('camp_upvote_mla')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('upvote' => 1)); 
         
      
        }*/
        $res=DB::table('camp_downvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid]);
        if(!empty($res)){
        DB::table('camp_downvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();
        }
       // print_r(json_encode($data)); 
      
     }
       public function unlike_mla()
      {
      //  $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
        $uid=$campaign_id['uid'];  
        /**$data=DB::table('camp_upvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data))
         DB::table('camp_upvote_mla')->insert(['comment_id'=> $id,'upvote'=>0,'user_id'=>$uid]);
        else{
         DB::table('camp_upvote_mla')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('upvote' => 0));  
       // print_r(json_encode($data)); 
     // }*/
       DB::table('camp_upvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();

     }

    public function downvote_mla()
      {
       // $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['comment_id'];
         $uid=$campaign_id['uid']; 
        $data=DB::table('camp_downvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        //if(empty($data))
        print_r(json_encode($data)); 
      
     }
       public function set_downvote_mla()
      {
       // $uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
         $uid=$campaign_id['uid']; 
        $data=DB::table('camp_downvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data)) 
        DB::table('camp_downvote_mla')->insert(['comment_id'=> $id,'downvote'=>1,'user_id'=>$uid]);
        else{
         DB::table('camp_downvote_mla')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('downvote' => 1)); 
        }
        $res=DB::table('camp_upvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid]);
        if(!empty($res)){
        DB::table('camp_upvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->delete();
        }
 
       // print_r(json_encode($data)); 
      
     }
       public function unset_downvote_mla()
      {
        //$uid=1;
        $campaign_id=Input::all(); 
        $id=$campaign_id['cid'];
        $uid=$campaign_id['uid'];  
        $data=DB::table('camp_downvote_mla')->where(['comment_id'=> $id,'user_id'=>$uid])->first();
        if(empty($data))
         DB::table('camp_downvote_mla')->insert(['comment_id'=> $id,'downvote'=>0,'user_id'=>$uid]);
        else{
         DB::table('camp_downvote_mla')
            ->where(['comment_id'=> $id,'user_id'=>$uid])
            ->update(array('downvote' => 0));  
       // print_r(json_encode($data)); 
      }
     }

       public function change_status()
      {
        //$uid=1;
        $campaign=Input::all(); 
        $campaign_id=$campaign['campaign_id'];
        $status=$campaign['status'];  
        DB::table('campaigns')
            ->where(['campaign_id'=> $campaign_id])
            ->update(array('status' => $status));  
       // print_r(json_encode($data)); 
      
     }


}
