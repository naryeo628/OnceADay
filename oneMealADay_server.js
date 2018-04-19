var express = require('express');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var bodyParser = require('body-parser');
var bkfd2Password = require("pbkdf2-password");
var passport = require('passport')
var LocalStrategy = require('passport-local').Strategy;
var FacebookStrategy = require('passport-facebook').Strategy;
var hasher = bkfd2Password();

var mysql = require('mysql');
var conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '111111',
  database: 'test'
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
    database: 'test'
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
  if (req.user && req.user.store) {
    res.send(`
      <h1>Hello, ${req.user.store}</h1>
      <a href="/auth/logout">logout</a>
    `);
  } else {
    res.render('welcome');
  }
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
//facebook login function
passport.use(new FacebookStrategy({
    clientID: '158535638148302',
    clientSecret: '96fb5a70da2400f078c780e6b096185c',
    callbackURL: "/auth/facebook/callback",
    profileFields: ['id', 'email', 'gender', 'link', 'locale',
      'name', 'timezone', 'update_time', 'verified', 'displayName'
    ]
  },
  function(accessToken, refreshToken, profile, done) {
    console.log(profile);
    var authId = 'facebook:' + profile.id;
    var sql = 'SELECT * FROM owner WHERE authId=?';
    conn.query(sql, [authId], function(err, results) {
      if (results.length > 0) {
        done(null, results[0]);
      } else {
        var newuser = {
          'authId': authId,
          'displayName': profile.displayName,
          'email': profile.emails[0].value
        };
        var sql = 'INSERT INTO owner SET ?'
        conn.query(sql, [], function(err, results) {
          if (err) {
            console.log(err);
            done('Error');
          } else {
            done(null, newuser);
          }
        })
      }
    });
  }
));

app.post('/auth/login', passport.authenticate(
  'local', {
    successRedirect: '/welcome',
    failureRedirect: '/auth/login',
    failureFlash: false
  }));

app.post('/auth/register', function(req, res) {
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

app.get('/auth/register', function(req, res) {
  res.render('signup_owner');
});
app.get('/auth/login', function(req, res) {
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
app.listen(80, function() {
  console.log('Connected 80 port!!!');
});
