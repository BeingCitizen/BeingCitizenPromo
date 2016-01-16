<html>
<head>
<h2>form</h2>
<body>
<h4>Campaign id: {{$id}}</h4>
{!! Form::open(array('action'=>'HomeController@index', 'files'=>true)) !!}
	       
      {!! Form::label('campaign_id') !!}
             {!! Form::text('campaign_id', $id, 
        array('required', 
              'class'=>'form-control', 
              'placeholder'=>'campaign_id')) !!}
 
      {!! Form::label('image', 'Upload Image')!!}
	{!! Form::file('image') !!}
      

	{!! Form::submit('Submit') !!}
   	{!! Form::close() !!}
     
</body>
</html>