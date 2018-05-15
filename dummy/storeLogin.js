var express = require('express');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var bodyParser = require('body-parser');
var bkfd2Password = require("pbkdf2-password");
var passport = require('passport')
var LocalStrategy = require('passport-local').Strategy;
var hasher = bkfd2Password();

var mysql = require('mysql');
var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '111111',
  database: 'o2'
});
conn.connect();

var app = express();
app.set('view engine', 'ejs');
app.use(express.static('./views'));
app.locals.pretty = true;

app.use(bodyParser.urlencoded({
  extended: false
}))



app.get('/storeInfo',function(req, res){
res.render('storeInfo');});



app.post('/insertInfo',function(req, res){

        var address1=req.body.address1;
        var address2=req.body.address2;
        var address3=req.body.address3;
	 var address4=req.body.address4;
	 var tel =req.body.tel;
        var time=req.body.time;
        
var sql = 'INSERT INTO store_info(address1,address2,address3,address4,tel,time)VALUES(?,?,?,?,?,?,?) '

;

conn.query(sql,[id,address1,address2,address3,address4,tel,time], function(err, result, fields) {
  if (err) {
        console.log(err);
        res.status(500);
      } else {
            res.redirect('/storeLogin');
          }});});





app.use(session({
  secret: '1234DSFs@adf1234!@#$asd',
  resave: false,
  saveUninitialized: true,
  store: new MySQLStore({
    host: 'localhost',
    port: 3306,
    user: 'root',
 password: '111111',
    database: 'o2'
  })
}));

app.use(passport.initialize());
app.use(passport.session());

app.get('/count', function(req, res) {
  if (req.session.count) {
    req.session.count++;
  } else {
    req.session.count = 1;
  }
  res.send('count : ' + req.session.count);
});
app.get('/auth/logout', function(req, res) {
  req.logout();
  res.redirect('/storeLogin');
});
app.get('/storeLogin', function(req, res) {

 
    // res.send(`
    //   <h1>Hello, ${req.user.store}</h1>
    //   <a href="/auth/logout">logout</a>
    // `);
   // res.render('contents_owner');
res.render('storeLogin');
   
});

passport.serializeUser(function(user, done) {
  console.log('serializeUser', user);
  done(null, user.authId);
});
passport.deserializeUser(function(id, done) {
                                           console.log('deserializeUser', id);
  var sql = 'SELECT * FROM owner WHERE authId=?';
  conn.query(sql, [id], function(err, results) {
    console.log(sql, err, results);
    if (err) {
      console.log(err);
      done('There is no user.');
    } else {
      done(null, results[0]);
    }
  });
});

//local login function
passport.use(new LocalStrategy(
  function(username, password, done) {
    var uname = username;
    var pwd = password;
    var sql = 'SELECT * FROM owner WHERE authId=?';
    conn.query(sql, ['local:' + uname], function(err, results) {
      console.log(results);
      if (err) {
        return done('There is no user.');
      }
      var user = results[0];
      return hasher({
        password: pwd,
        salt: user.salt
      }, function(err, pass, salt, hash) {
        if (hash === user.owner_password) {
          console.log('LocalStrategy', user);
          console.log('login success');
                                                            done(null, user);
        } else {
          console.log('incorrect password');
          console.log(hash);
          console.log(user.owner_password);
          done(null, false);
        }
      });
    });
  }
));

app.post('/storelogin', passport.authenticate(
  'local', {
    successRedirect: '/storeMain',
    failureRedirect: '/storeLogin',
    failureFlash: false
  }));
app.get('/storeRegister',function(req, res){
res.render('storeRegister');});
app.post('/storeRegisterInfo', function(req, res) {
  hasher({
    password: req.body.owner_pw
  }, function(err, pass, salt, hash) {
    var user = {
      authId: 'local:' + req.body.owner_id,
      owner_id: req.body.owner_id,
      owner_password: hash,
      salt: salt,
      store: req.body.owner_name
    };
    var sql = 'INSERT INTO owner SET ?';
  conn.query(sql, user, function(err, results) {
      if (err) {
        console.log(err);
        res.status(500);
      } else {
        req.login(user, function(err) {
          req.session.save(function() {
            res.redirect('/storeInfo');
          });
        });
      }
    });
  });
});

app.get('/auth/register', function(req, res) {
  res.render('storeRegister');
});
app.get('/auth/login', function(req, res) {
  res.render('storeLogin');
});
//DELETE all sessions
app.get('/auth/dsessions', function(req, res) {
  var sql = 'DELETE FROM sessions';
  conn.query(sql, function(err, results) {
    if (err) {
      console.log(err);
      res.status(500);
    } else {
      console.log(sql);
      res.redirect('/storeLogin');
    }
                                                      });
});
//DELETE all users
app.get('/auth/dusers', function(req, res) {
  var sql = 'DELETE FROM owner';
  conn.query(sql, function(err, results) {
    if (err) {
      console.log(err);
      res.status(500);
    } else {
      console.log(sql);
      res.redirect('/storeLogin');
    }
  });
});


app.get('/storeMain',function(req,res){

        const sql='select * from store_info,content_list where store_info.owner_id=content_list.owner_id and content_list.owner_id=?';
        params=["hyk1031"];
        conn.query(sql,params,function(err,results,field){
                console.log(results);
                res.render('storeMain',{image:results, owner:results[0],
                                        storeinfo:results[0]});
        });


});

app.get('/contentUpload',function(req,res){
        res.render('contentUpload');
});

Upload = require('../s3upload/uploadservice'),
app.post('/upload', function (req, res) {
    var tasks =[
        function (callback) {
            Upload.formidable(req, function (err, files, field) {
                callback(err, files);
            })
        },
        function (files, callback) {
            Upload.s3(files, function (err, result) {
                callback(err, files);
                                                                  
  });
        }
    ];
   async.waterfall(tasks, function (err, result) {
        if(!err){
            //res.json({success:true, msg:'업로드 성공'})
                return res.redirect('/storeMain');

        }else{
            res.json({success:false, msg:'실패', err:err})
        }
    });
});


app.get('/follow',function(req,res){

        const sql='select * from follow';
        conn.query(sql,function(err,results,field){
                console.log(results);
                res.render('follow', {follow: results});
        });

});

app.get('/contentDetail',function(req,res){

        const sql='select * from content_list';
        conn.query(sql,function(err,results,field){
                                                                    

  console.log(results);
                 res.render('contentDetail',{url:results[0].url, owner_id:results[0].owner_id,
                                            content: results[0].content, date:results[0].date});

         });

});


app.get('/sale',function(req,res){
        res.render('sale');
});

Upload = require('../s3upload/uploadservice'),
app.post('/saleProduct', function (req, res) {
    var tasks =[
        function (callback) {
            Upload.formidable(req, function (err, files, field) {
                callback(err, files);
            })
        },
        function (files, callback) {
            Upload.s3(files, function (err, result) {
                callback(err, files);
            });

   }
    ];
                                                                              
   async.waterfall(tasks, function (err, result) {
        if(!err){
            res.json({success:true, msg:'업로드 성공'})
        }else{
            res.json({success:false, msg:'실패', err:err})
        }
    });

});
module.exports=app;

app.listen(3000, function() {
  console.log('Connected 3000  port!!!');
});
                                        
