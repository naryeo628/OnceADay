var express = require('express');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var bodyParser = require('body-parser');
var bkfd2Password = require("pbkdf2-password");
var passport = require('passport')
var LocalStrategy = require('passport-local').Strategy;
var hasher = bkfd2Password();

var mysql = require('mysql');
const ownerId;
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



app.get('/storeInfo', function(req, res) {
  res.render('storeInfo');
});



app.post('/insertInfo', function(req, res) {

  var address1 = req.body.address1;
  var address2 = req.body.address2;
  var address3 = req.body.address3;
  var address4 = req.body.address4;
  var tel = req.body.tel;
  var owner_id = req.body.owner_id;
  var time = req.body.time;
  var store = req.body.owner_name;
  var pwd = req.body.owner_pw;
  /* var sql2= 'select owner_id from owner';
var sql3 = 'select store from owner';*/

  var sql = 'INSERT INTO store_info(owner_id,store,pwd,address1,address2,address3,address4,tel,time)VALUES(?,?,?,?,?,?,?,?,?) ';


  conn.query(sql, [owner_id, store, pwd, address1, address2, address3, address4, tel, time], function(err, result, fields) {
    if (err) {
      console.log(err);
      res.status(500);
    } else {

      res.redirect('/storeLogin');
    }
  });
});

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
  res.render('storeLogin', {
    storeRegisterUrl: '/storeRegister',
    storeloginPostUrl: '/storelogin'
  });

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

// app.post('/storelogin', passport.authenticate(
//   'local', {
//     successRedirect: '/storeMain',
//     failureRedirect: '/storeLogin',
//     failureFlash: false
//   }));
app.post('/storelogin', passport.authenticate('local', {
  failureRedirect: '/storeLogin'
}), function(req, res) {
  console.log('으아아아아아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ' + req.session.passport.user);
  ownerId=req.session.passport.user;
  res.redirect('/storeMain/'+ ownerId);
});
app.get('/storeRegister', function(req, res) {
  res.render('storeRegister', {
    storeRegisterPostUrl: '/storeRegister'
  });
});
app.post('/storeRegister', function(req, res) {
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
            res.redirect('/storeLogin');
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

app.listen(3000, function() {
  console.log('Connected 3000  port!!!');
});
