@extends('app1')
@section('content')
<br/>
<br/>
<hr/>
<h1>WELCOME</h1>
<hr/>
<div class='form'>
{!! Form::open(['url' => 'items'])  !!}
<br/>
<br/>
{!! Form::label('username','User name:') !!}
{!! Form::text('username',null,['class' => 'form-control']) !!}<br/><br/>
{!! Form::label('password','Password:') !!}
{!! Form::text('password',null,['class' => 'form-control']) !!}<br/><br/>
{!! Form::submit() !!}
{!! Form::close() !!}
</div>
<p>If not existing user,<a href=signup>SignUp</a><p>
<a href=about><h3>About us</h3> </a>
<a href=contact><h3>Contact us</h3> </a>
@stop