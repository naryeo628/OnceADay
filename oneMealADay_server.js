var express = require('express');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var bodyParser = require('body-parser');
var bkfd2Password = require("pbkdf2-password");
var passport = require('passport');
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

app.use(bodyParser.urlencoded({
  extended: false
}));
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
  res.redirect('/welcome');
});
app.get('/welcome', function(req, res) {
  // if (req.user && req.user.store) {
  //   // res.send(`
  //   //   <h1>Hello, ${req.user.store}</h1>
  //   //   <a href="/auth/logout">logout</a>
  //   // `);
  //   res.render('contents_owner');
  // } else {
  res.render('welcome');
  //}
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

app.post('/auth/owner/login', passport.authenticate(
  'local', {
    successRedirect: '/welcome',
    failureRedirect: '/auth/owner/login',
    failureFlash: false
  }));

app.post('/auth/owner/register', function(req, res) {
  hasher({
    password: req.body.password
  }, function(err, pass, salt, hash) {
    var user = {
      authId: 'local:' + req.body.username,
      owner_id: req.body.username,
      owner_password: hash,
      salt: salt,
      store: req.body.displayName
    };
    var sql = 'INSERT INTO owner SET ?';
    conn.query(sql, user, function(err, results) {
      if (err) {
        console.log(err);
        res.status(500);
      } else {
        req.login(user, function(err) {
          req.session.save(function() {
            res.redirect('/welcome');
          });
        });
      }
    });
  });
});

app.get('/auth/owner/register', function(req, res) {
  res.render('signup_owner');
});
app.get('/auth/owner/login', function(req, res) {
  res.render('login_owner');
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
      res.redirect('/welcome');
    }
    select
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
      res.redirect('/welcome');
    }
  });
});

//Review List Page
app.get('/review/list', function(req, res) {
  res.render('reviews');
});
app.get('/review/container', function(req, res) {
  var sql1 = 'SELECT owner.store, review.owner_id, review.score, review.good, review.bad FROM review, owner WHERE owner.owner_id='
  var sql2 = 'and review.owner_id='
  var query = conn.query(sql1 + mysql.escape(req.user.owner_id) + sql2 + mysql.escape(req.user.owner_id), function(err, results, fields) {
    if (err) throw err;

    res.json(results);
    console.log(results[0].good);
    var html = "";
    //res.send(`${results[0].good}`);
    for (var i = 0; i < results.length; i++) {
      html = html + i;
    }
    //res.send(`${html}`);
  });
  //res.send(`aaa`);
});

//Review page
app.get('/review', function(req, res) {
  var owid = 'wook';
  var textGood = 'SELECT good FROM review WHERE owner_id=?';
  var textBad = 'SELECT bad FROM review WHERE owner_id=?';
  var query = conn.query(textGood, owid, function(err, results) {
    console.log(results);
    res.json(results);
  });
  console.log(query);
  //res.send(`aaa`);
});






app.listen(80, function() {
  console.log('Connected 80 port!!!');
});
