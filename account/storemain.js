var express    =  require("express");
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'hyk1031',
  database : 'test'
});
var app = express();

connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... \n\n");
} else {
    console.log("Error connecting database ... \n\n");
}
});

app.get("/",function(request,response){
connection.query('SELECT * from test', function(err, rows, fields) {
connection.end();
  if (!err){
       var data="<html><head><title>mysql test</title></head><body>"

       for (var i in rows){
         if(i%3!=2){
         data += "<image src=" +rows[i].url+ " width=150 height=150 >"}
         else{
           data += "<image src=" +rows[i].url+ " width=150 height=150 ></br>"}
       }
       data+="</body></html>"

       response.send(data);
  }
  else
  console.log('Error while performing Query.');
  });
});

app.listen(80,function(){
  console.log('connect 80 port');
});

