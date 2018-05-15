var express = require('express');
var bodyParser = require('body-parser');
 var app = express();
 app.locals.pretty = true;
 app.set('view engine', 'ejs');
 app.set('views', './views');
 app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: false }))
app.get('/', function(req,res){
res.render('test');
});
 app.post('/form_receiver', function(req, res){
var title = req.body.title;
   res.send(title);
 });
app.listen(8080,function(){
console.log('conneted');});
