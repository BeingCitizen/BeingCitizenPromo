var express = require('express');

var app = express();

var mysql = require('mysql');

var bodyParser = require('body-parser');


app.use(express.static(__dirname + '/'));

app.use(bodyParser.urlencoded());


var connection = mysql.createConnection({
	host:'localhost',
	user:'root',
	password:'',
	database:'trialrun'
});


connection.connect();


app.post('/get_details',function(req,res)
{
	
var json_object = req.body;
	
var query = "select * from leaders where Constituency = '"+json_object['address']+"'";
	
connection.query(query,function(err,rows){

		if(!err)

		{

			res.send(rows);

		}

		else

		{

			console.log('Unidentified Address');

		}

	});

});



app.get('/geolocate',function(req,res){

    res.sendfile('basic.html');

});


var server = app.listen(3000, function () {


  var host = server.address().address;

  var port = server.address().port;


  console.log('Example app listening at http://%s:%s', host, port);


});