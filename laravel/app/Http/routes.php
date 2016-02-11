<?php
Route::post('get_constituency', 'DetailsController@get');
Route::get('/',function(){ echo "welcome" ;});
Route::post('set_campaigns','CampaignController@index');
Route::post('status','CampaignController@campaign_status');
Route::post('get_campaignCategory','CampaignController@show_campaignCategory');
Route::post('set_debates','DebateController@index');
Route::post('get_debate','DebateController@show');
Route::post('get_debate','DebateController@show');
Route::post('get_campaign','CampaignController@show_campaign');
Route::post('campaigns_dateSorted','CampaignController@show_campaignSorted');
Route::post('debates_dateSorted','DebateController@show_debateSorted');
Route::post('get_debateCategory','DebateController@show_debateCategory');
Route::post('get_campaignTag','CampaignController@show_campaignTag');
Route::post('campaigns_tags','CampaignController@campaigns_tags');
Route::post('get_campaignConstituency','CampaignController@show_campaignConstituency');
Route::post('campaigns_constituencies','CampaignController@campaigns_constituencies');
Route::post('user_hashtags', 'UserController@user_hashtags');
Route::post('mla_hashtags', 'UserController@mla_hashtags');
Route::post('get_postsWithHash', 'TagController@get_postsWithHash');
Route::post('get_postsWithHash_mla', 'TagController@get_postsWithHash_mla');
Route::post('leaders', 'UserController@leaders');
Route::post('setcampaign_comment','CampaignController@set_comment');
Route::post('setcampaign_comment_mla','CampaignController@set_comment_mla');
Route::post('campaign_comments','CampaignController@show_comments');
Route::post('campaign_mla_comments','CampaignController@show_mla_comments');
Route::post('camp_follow','CampaignController@follow');
Route::post('camp_unfollow','CampaignController@unfollow');
Route::post('like_unlike','CampaignController@vote');
Route::post('like','CampaignController@like');
Route::post('unlike','CampaignController@unlike');
Route::post('like_unlike_mla','CampaignController@vote_mla');
Route::post('like_mla','CampaignController@like_mla');
Route::post('unlike_mla','CampaignController@unlike_mla');
Route::post('set_downvote_mla','CampaignController@set_downvote_mla');
Route::post('unset_downvote_mla','CampaignController@unset_downvote_mla');
Route::post('downvote_mla','CampaignController@downvote_mla');
Route::post('follow_unfollow','CampaignController@follow_unfollow');
Route::post('set_volunteer','CampaignController@set_volunteer');
Route::post('volunteer','CampaignController@volunteer');
Route::post('const_camp','CampaignController@const_camp');
Route::post('not_volunteer','CampaignController@not_volunteer');
Route::post('downvote','CampaignController@downvote');
Route::post('campaign_deleteComment','CampaignController@delete_comment');
Route::post('campaigns','CampaignController@all_campaign');
Route::post('debates','DebateController@all_debate');
Route::post('debate_deleteComment','DebateController@delete_comment');
Route::post('set_downvote','CampaignController@set_downvote');
Route::post('unset_downvote','CampaignController@unset_downvote');
Route::post('debate_downvote','DebateController@downvote');
Route::post('debate_set_downvote','DebateController@set_downvote');
Route::post('debate_unset_downvote','DebateController@unset_downvote');
Route::post('debate_like_unlike','DebateController@upvote');
Route::post('debate_like','DebateController@like');
Route::post('debate_unlike','DebateController@unlike');
Route::post('comments','DebateController@show_comments');
Route::post('set_comment','DebateController@set_comment');
Route::post('vote_id','DebateController@vote');
Route::post('fetch_camp', 'CampaignController@fetch_camp');
Route::get('upload/{id}', 'CampaignController@show');
	//return View::make('upload');
Route::post('tag', 'TagController@index');
Route::controller('notifications', 'NotificationController');
Route::post('hash_tag', 'TagController@hash_tag');
Route::post('get_posts', 'TagController@get_posts');
Route::post('get_posts_mla', 'TagController@get_posts_mla');
Route::post('hashtag_data', 'TagController@hashtag_data');
Route::post('fetch_tags', 'CampaignController@tags');
Route::post('change_status', 'CampaignController@change_status');
Route::post('user_signup', 'UserController@signup');
Route::post('mla_signup', 'UserController@mla_signup');
Route::post('get_user', 'UserController@campaign_comment');
Route::post('user_profile', 'UserController@user_profile');
Route::post('users_follow', 'UserController@user_follow');
Route::post('follow_people', 'UserController@follow');
Route::post('unfollow_people', 'UserController@unfollow');
Route::post('check_follow', 'UserController@check_follow');
Route::post('user_camp_follow', 'UserController@user_camp_follow');
Route::post('login','UserController@login');
Route::post('login_admin','UserController@login_admin');
Route::post('login_mla','UserController@login_mla');
Route::post('logout','UserController@logout');
Route::post('user_id','UserController@user_id');
Route::post('admin_id','UserController@admin_id');
Route::post('user_id_mla','UserController@user_id_mla');
Route::post('error','UserController@error');
Route::post('set_blogs','UserController@set_blogs');
Route::post('user','UserController@user');
Route::post('mla','UserController@mla');
Route::post('show-poll','UserController@show_poll');
Route::post('poll-vote','UserController@poll_vote');
Route::post('edit-poll','UserController@edit_poll');
Route::post('check-vote','UserController@check_vote');
Route::post('delete-poll','UserController@delete_poll');
Route::post('create-poll','UserController@create_poll');
Route::get('/debate_upload/{id}', 'DebateController@upload');
Route::get('/blog_upload/{id}', 'UserController@blog_upload');
Route::post('/upload/{id}', 'HomeController@index');
Route::post('/debate_upload/{id}', 'HomeController@debate_upload');
Route::post('/blog_upload/{id}', 'HomeController@blog_upload');
Route::controllers([

	'auth' => 'Auth\AuthController',

	'password' => 'Auth\PasswordController'
      
]);
?>
