<html>
<head>
<h2>form</h2>
<body>
<h4>Blog id: {{$id}}</h4>
{!! Form::open(array('action'=>'HomeController@blog_upload', 'files'=>true)) !!}
	       
      {!! Form::label('blog_id') !!}
             {!! Form::text('blog_id', $id, 
        array('required', 
              'class'=>'form-control', 
              'placeholder'=>'blog_id')) !!}
 
      {!! Form::label('image', 'Upload Image')!!}
	{!! Form::file('image') !!}
      

	{!! Form::submit('Submit') !!}
   	{!! Form::close() !!}
     
</body>
</html>