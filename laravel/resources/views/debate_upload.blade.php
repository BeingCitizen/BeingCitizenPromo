<html>
<head>
<h2>form</h2>
<body>
<h4>Debate id: {{$id}}</h4>
{!! Form::open(array('action'=>'HomeController@debate_upload', 'files'=>true)) !!}
	       
      {!! Form::label('debate_id') !!}
             {!! Form::text('debate_id', $id, 
        array('required', 
              'class'=>'form-control', 
              'placeholder'=>'debate_id')) !!}
 
      {!! Form::label('image', 'Upload Image')!!}
	{!! Form::file('image') !!}
      

	{!! Form::submit('Submit') !!}
   	{!! Form::close() !!}
     
</body>
</html>