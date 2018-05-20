var express = require('express');
var router = express();
var mysql = require('mysql');
var async = require('async');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var bodyParser = require('body-parser');
var bkfd2Password = require("pbkdf2-password");
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var hasher = bkfd2Password();
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '111111',
  database: 'o3'
});
connection.connect(function(err) {
  if (!err) {
    console.log("Database is connected ... \n\n");
  } else {
    console.log("Error connecting database ... \n\n");
  }
});
router.set('view engine', 'ejs');
router.use(express.static('./views'));
router.use(bodyParser.urlencoded({
  extended: false
}));


//URLs
const loginUrl = `/user/login`;
const logoutUrl = `/user/logout`;
const registerUrl = `/user/register`;
const timelineUrl = `/user/timeline`;
const timelineFollowContainerUrl = `/user/timeline/container/follow`;
const timelineSaleContainerUrl = `/user/timeline/container/sale`;

/*
const storeMainContentContainerUrl = `/user/storeMain/container`;
const storeMainContentDetailUrl = `/user/storeMain/container/detail`;
const storeMainContentUploadUrl = `/user/storeMain/upload/content`;
const storeMainFollowerUrl = `/user/storeMain/follower`;
const storeMainSaleUrl = `/user/storeMain/sale`;
const reviewListUrl = `/user/storeMain/review/list`;
const reviewListContainerUrl = `/user/storeMain/review/list/container`;
const reviewDetailUrl = `/user/storeMain/review/detail`;
const uploadUrl = `/upload`;
*/

//Views
const loginView = `user_login`;
const registerView = `user_register`;
const timelineView = `user_timeline`;
const timelineFollowContainerView = `user_timelineFollowContainer`;
const timelineSaleContainerView = `user_timelineSaleContainer`;





router.use(session({
  secret: '1234DSFs@adf1234!@#$asd',
  resave: false,
  saveUninitialized: true,
  store: new MySQLStore({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '111111',
    database: 'o3'
  })
}));
router.use(passport.initialize());
router.use(passport.session());
router.get('/count', function(req, res) {
  if (req.session.count) {
    req.session.count++;
  } else {
    req.session.count = 1;
  }
  res.send('count : ' + req.session.count);
});

router.get(logoutUrl, function(req, res) {
  req.logout();
  res.redirect(loginUrl);
});

passport.serializeUser(function(user, done) {
  console.log('serializeUser', user);
  done(null, user.user_auth);
});
passport.deserializeUser(function(id, done) {
  console.log('deserializeUser', id);
  var sql = 'SELECT * FROM user WHERE user_auth=?';
  connection.query(sql, [id], function(err, results) {
    console.log(sql, 'err:' + err, results);
    if (err) {
      console.log(err);
      done('There is no user.');
    } else {
      done(null, results[0]);
    }
  });
});

//local login function
passport.use(new LocalStrategy({
    usernameField: 'user_id',
    passwordField: 'user_password'
  },
  function(user_id, user_password, done) {
    console.log('login function start');
    var uname = user_id;
    var pwd = user_password;
    var sql = 'SELECT * FROM user WHERE user_auth=?';
    connection.query(sql, ['local:' + uname], function(err, results) {
      console.log(results);
      if (err) {
        return done('There is no user.');
      }
      var user = results[0];
      return hasher({
        password: pwd,
        salt: user.salt
      }, function(err, pass, salt, hash) {
        if (hash === user.user_password) {
          console.log('LocalStrategy', user);
          console.log('login success');
          done(null, user);
        } else {
          console.log('incorrect password');
          console.log(hash);
          console.log(user.user_password);
          done(null, false);
        }
      });
    });
  }
));
router.get(loginUrl, function(req, res) {
  res.render(loginView, {
    idBoxName: 'user_id',
    passwordBoxName: 'user_password',
    loginPostUrl: loginUrl,
    registerUrl: registerUrl
  });
});
router.post(loginUrl, passport.authenticate('local', {
  failureRedirect: loginUrl
}), function(req, res) {
  console.log('loginPostFunction');
  console.log(req.session.passport.user);
  res.redirect(timelineUrl);
});
router.get(registerUrl, function(req, res) {
  console.log('1, ' + registerUrl + 'get callback start');
  res.render(registerView, {
    idBoxName: 'user_id',
    passwordBoxName: 'user_password',
    nameBoxName: 'user_name',
    registerPostUrl: registerUrl
  });
});
router.post(registerUrl, function(req, res) {
  console.log('1, ' + registerUrl + 'post callback start');
  hasher({
    password: req.body.user_password
  }, function(err, pass, salt, hash) {
    var user = {
      user_auth: 'local:' + req.body.user_id,
      user_id: req.body.user_id,
      user_password: hash,
      salt: salt,
      name: req.body.user_name
    };
    console.log('1.1, ' + registerUrl + user);
    var sql = 'INSERT INTO user SET ?';
    connection.query(sql, user, function(err, results) {
      if (err) {
        console.log(err);
        res.status(500);
      } else {
        req.login(user, function(err) {
          req.session.save(function() {
            res.redirect(loginUrl);
          });
        });
      }
    });
  });
});

router.get(timelineUrl, function(req, res) {
  console.log('1, ' + timelineUrl + ' get callback start');
  const userAuth = req.session.passport.user;
  console.log('1.1, ' + timelineUrl + '/' + userAuth);
  res.render(timelineView, {
    iframeUrl: timelineFollowContainerUrl
  });
});

router.get(timelineFollowContainerUrl, function(req, res) {
  console.log('1, ' + timelineFollowContainerUrl + ' get callback start');
  const userAuth = req.session.passport.user;
  console.log('1.1, ' + timelineFollowContainerUrl + '/' + userAuth);
  const sql1 = `SELECT owner_auth FROM follow WHERE user_auth=` + mysql.escape(userAuth);
  connection.query(sql1, function(err, results) {
    if (err) return done(err);
    console.log(results);
    let sql2 = `SELECT content_list.*, owner.store, owner.image_url FROM content_list, owner`;
    for (var i = 0; i < results.length; i++) {
      if (results.length > 0) {
        sql2 += ` WHERE `;
      }
      sql2 += `content_list.owner_auth=` + mysql.escape(results[i].owner_auth);
      if (i < results.length - 1) {
        sql2 += ' or ';
      }
    }
    sql2 += ` ORDER BY date ASC`;
    console.log(sql2);
    connection.query(sql2, function(err, results2) {
      res.render(timelineFollowContainerView, {
        contents: results2,
        iframeUrl: timelineSaleContainerUrl
      });
    });
  });
});

router.get(timelineSaleContainerUrl, function(req, res) {
  console.log('1, ' + timelineSaleContainerUrl + ' get callback start');
  const sql1 = `SELECT product_info.owner_auth, product_info.product, owner.image_url FROM product_info, owner WHERE product_info.sale is not NULL`;
  connection.query(sql1, function(err, results) {
    res.render(timelineSaleContainerView, {
      contents: results
    });
  });
});

router.listen(80, function() {
  console.log('connect 80 port user server');
});
