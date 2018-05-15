var express    =  require("express");
var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '111111',
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
var data;
connection.query('SELECT * from profile', function(err, rows, fields) {
  if (!err){
       data+="<html><head><title>Store Main Page</title></head><body>"

       for(var i in rows){
         data+="<div><img src=" +rows[i].url+ " width=100 height=100 /></div>"
       }
       data+="<div>"
       data+="<button onclick= location.href='/follow2.js' >팔로워</button>"
       data+="<button onclick= /changeInfo()>프로필 수정</button>"
       data+="<button onclicK= /Review()>리뷰</button>"
       data+="</div>"
}
else console.log('Error Query');
});

connection.query('select * from image',function(err,rows,fields){
  if(!err){
       for (var i in rows){
         if(i%3!=2){
          data+= "<image src=" +rows[i].url+ " width=150 height=150 >"}
         else{
           data+= "<image src=" +rows[i].url+ " width=150 height=150 ></br>"}
       }
       data+="</body></html>"
  }
  else console.log('Error while performing Query1.');

response.send(data);
});

//response.send(data);

});

app.listen(80,function(){
  console.log('connect 80 port');
});
