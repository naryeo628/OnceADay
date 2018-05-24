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
var FacebookStrategy = require('passport-facebook').Strategy;
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
const facebookLoginUrl = `/user/facebook/login`;
const logoutUrl = `/user/logout`;
const registerUrl = `/user/register`;
const mainUrl = `/user/main`;
const mainTimelineUrl = `/user/main/timeline`;
const mainBargainsUrl = `/user/main/sale`;
const mainSearchUrl = `/user/main/search`;
const mainFollowsUrl = `/user/main/follows`;
const mainStoreUrl = `/user/main/store`;
const mainUserInfoUrl = `/user/main/userInfo`;
const successUrl = `/success`;
const followUrl = `/user/main/store/follow`

const storeMainUrl = `/owner/storeMain`;
const storeMainContentContainerUrl = `/owner/storeMain/container`;
const storeMainContentDetailUrl = `/owner/storeMain/container/detail`;
const storeMainContentUploadUrl = `/owner/storeMain/upload/content`;
const storeMainFollowerUrl = `/owner/storeMain/follower`;
const storeMainSaleUrl = `/owner/storeMain/sale`;
const reviewListUrl = `/owner/storeMain/review/list`;
const reviewListContainerUrl = `/owner/storeMain/review/list/container`;
const reviewDetailUrl = `/owner/storeMain/review/detail`;
const uploadUrl = `/upload`;
const writeReviewUrl = `/owner/storeMain/review/write`;

//Views
const loginView = `user_login`;
const registerView = `user_register`;
const timelineView = `user_timeline`;
const timelineFollowContainerView = `user_timelineFollowContainer`;
const timelineSaleContainerView = `user_timelineSaleContainer`;
const mainSearchView = `search2`;
const mainUserInfoView = `user_userInformation`;
const searchResultView = ``;

const storeMainView = `user_storeMain`;
const storeMainContentContainerView = `user_storeMainContentContainer`;
const storeMainContentDetailView = `contentDetail`;
const storeMainContentUploadView = `contentUpload`;
const storeMainFollowerView = `follow`;
const storeMainSaleView = `sale`;
const reviewListView = `review_reviewList`;
const reviewListContainerView = ``;
const reviewDetailView = `review_reviewDetail`;
const writeReviewView = `user_review_write`;
const successView = `success`;



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
  delete req.session.passport.user; //세션 삭제
  req.session.save(function() { //데이터 저장이 끝났을때 호출됨 안전하게 redirect하기 위함
    res.redirect('/');
  });
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
var FacebookStrategy = require('passport-facebook').Strategy;
passport.use(new FacebookStrategy({
    clientID: '236726423560804',
    clientSecret: '92125918173fe7cc55b7212bf2a9f135',
    callbackURL: "/user/facebook/login",
    profileFields: ['id', 'email', 'gender', 'link', 'locale', 'name', 'timezone', 'updated_time', 'verified', 'displayName']
  },
  function(accessToken, refreshToken, profile, done) {
    console.log(profile);
    var userAuth = 'facebook:' + profile.id;
    var sql = 'SELECT * FROM user WHERE user_auth=' + mysql.escape(userAuth);
    conn.query(sql, function(err, results) {
      if (results.length > 0) {
        done(null, results[0]);
      } else {
        var newuser = {
          'user_auth': authId,
          'user_id': profile.id,
          'name': profile.displayName
        };
        var sql = 'INSERT INTO users SET ?'
        conn.query(sql, newuser, function(err, results) {
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
router.get('/', function(req, res) {
  res.redirect(loginUrl);
});
router.get(loginUrl, function(req, res) {
  if (req.session.passport) {
    if (req.session.passport.user) {
      res.redirect(mainUrl);
    }
  } else {
    res.render(loginView, {
      idBoxName: 'user_id',
      passwordBoxName: 'user_password',
      loginPostUrl: loginUrl,
      registerUrl: registerUrl
    });
  }
});
router.post(loginUrl, passport.authenticate('local', {
  failureRedirect: loginUrl
}), function(req, res) {
  console.log('loginPostFunction');
  console.log(req.session.passport.user);
  res.redirect(mainUrl);
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
            res.redirect('/welcome');
      }
    });
  });
});

router.get('/welcome',function(req,res){
  res.render('welcome');
});

router.listen(80, function() {
  console.log('connect 80 port user server');
});
