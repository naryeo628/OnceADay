var express =  require('express');
var bodyParser = require('body-parser');
var app = express();
var MySQLStore = require('express-mysql-session')(session);
var bkfd2Password = require("pbkdf2-password");
var hasher = bkfd2Password();
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var session = require('express-session');
var mysql = require('mysql');

app.set('view engine', 'ejs');
app.set('views','./views');
app.get('/', function(req,res){
  res.render('register');
});
app.use(bodyParser.urlencoded({extended : false}));

app.use(session({
secret:'shjkdfnwnedlvkfkfkdls',
resave:  false,
saveUninitialized: true,
store : new MySQLStore({
host: '172.31.18.205',
port: 3306,
user : 'root',
password :'111111',
database:'o2'
})
}));
var conn = mysql.createConnection({
host : '172.31.18.205',
user : 'root',
password : '111111',
database : 'o2',
port : 3306
});
conn.connect();

app.use(passport.initialize());
app.use(passport.session());
app.post('/registerInfo',function(req, res){
hasher({password:req.body.user_pw}, function(err, pass, salt, hash){
var user = {
id : req.body.user_id,
username:req.body.user_name,
password : hash,
salt:salt,

}})});


var sql = 'INSERT INTO users SET ?';
conn.query(sql, user, function(err, results){
if(err){
console.log(err);
res.status(500);
}else{
res.send('hello');
}
});
passport.serializeUser(function(user, done){
done(null, user.id);
});
passport.deserializeUser(function(id, done){
for(var i=0; i < user.length; i++){
var user = users[i];
if(user.id === id){
done(null, user);
}}});
app.listen(3000, function(){
console.log('Conneted 3000 port!');
});
