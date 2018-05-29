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
var logout = require('express-passport-logout');
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




/*FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
});

function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}*/

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
const mainUserInfoUrl = `/user/main/profile`;
const userProfileImageUploadUrl = `/user/main/profile/image`
const successUrl = `/success`;
const followUrl = `/user/main/store/follow`
const writeReviewUrl = `/user/main/store/review/write`;
const followBtnUrl = `/followBtn`;
const productUrl = `/user/main/store/product`;
const productDetailUrl = `/user/main/store/product/detail`;

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

//Views
const loginView = `user_login`;
const registerView = `user_register`;
const timelineView = `user_timeline`;
const timelineFollowContainerView = `user_timelineFollowContainer`;
const timelineSaleContainerView = `user_timelineSaleContainer`;
const mainSearchView = `search2`;
const mainUserInfoView = `user_userInformation`;
const searchResultView = `user_searchResult`;
const storeMainContentDetailView = `user_contentDetail`;
const followBtnView = `followBtn`;
const followingStoreView = `user_followingStore`;

const storeMainView = `user_storeMain`;
const storeMainContentContainerView = `user_storeMainContentContainer`;
const storeMainContentUploadView = `contentUpload`;
const storeMainFollowerView = `follow`;
const storeMainSaleView = `sale`;
const reviewListView = `review_reviewList`;
const reviewListContainerView = ``;
const reviewDetailView = `review_reviewDetail`;
const writeReviewView = `user_review_write`;
const successView = `success`;
const productView = `product`;
const productDetailView = `productDetail`;

//const facebookLoginUrl = `/user/facebook/login`;
const facebookLoginCallbackUrl = `/user/facebook/login/callback`;

/*router.get(
  facebookLoginUrl,
  passport.authenticate(
    'facebook'
  )
);
router.get(
  facebookLoginCallbackUrl,
  passport.authenticate(
    'facebook',
    {
      successRedirect: mainUrl,
      failureRedirect: loginUrl
    }
  )
);






router.get(
  facebookLoginUrl,
  passport.authenticate(
    'facebook'
  )
);
router.get(
  facebookLoginCallbackUrl,
  passport.authenticate(
    'facebook',
    {
      successRedirect: mainUrl,
      failureRedirect: loginUrl
    }
  )
);*/
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
    clientID: '216415682421891',
    clientSecret: '5e5496e434f708672bba99270cffd1ca',
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
        });
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
router.get(logoutUrl, function(req, res) {
  console.log('logout', req.session.passport.user);
  req.session.destroy(function() {
    req.session;
  });
  console.log('logout success');
  res.redirect('/');
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
      name: req.body.user_name,
      image_url: 'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-user-20.png'
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

router.get(mainUrl, function(req, res) {
  console.log('1, ' + mainUrl + ' get callback start');
  var userAuth = req.session.passport.user;
  console.log('1.1, ' + mainUrl + '/' + userAuth);
  console.log();
  res.render(timelineView, {
    logoutUrl: logoutUrl,
    iframeUrl: mainTimelineUrl,
    searchUrl: mainSearchUrl,
    followsUrl: mainFollowsUrl,
    userInfoUrl: mainUserInfoUrl
  });
});

//관심가게 리스트 보기
router.get(mainFollowsUrl, function(req, res) {
  const userAuth = req.session.passport.user;
  const sql = 'select * from owner where owner_auth in (select owner_auth from follow where user_auth=?);'
  var params = userAuth;
  connection.query(sql, params, function(err, results) {
    var isStore = 1;
    if (results.length == 0) {
      isStore = 0;
    }
    //console.log(results);
    res.render(followingStoreView, {
      isStore: isStore,
      followBtnUrl: followBtnUrl,
      storeUrl: mainStoreUrl,
      contents: results
    });
  });
});


router.get(mainTimelineUrl, function(req, res) {
  console.log('1, ' + mainTimelineUrl + ' get callback start');
  const userAuth = req.session.passport.user;
  console.log('1.1, ' + mainTimelineUrl + '/' + userAuth);
  const sql1 = `SELECT owner_auth FROM follow WHERE user_auth=` + mysql.escape(userAuth);
  connection.query(sql1, function(err, results) {
    if (err) return done(err);
    //console.log('results1 : ', results);
    //console.log('sql1 : ', sql1);
    if (results.length != 0) {
      let sql2 = `
    SELECT DISTINCT content_list.*, owner.store, owner.image_url
    FROM content_list, owner
    `;
      //console.log(results.length);
      for (var i = 0; i < results.length; i++) {
        if (results.length > 0 && i == 0) {
          sql2 += ` WHERE `;
        }
        sql2 += `(content_list.owner_auth=` + mysql.escape(results[i].owner_auth) + ` and owner.owner_auth=` + mysql.escape(results[i].owner_auth) + ')';
        if (i < results.length - 1) {
          sql2 += ' or ';
        }
      }
      sql2 += ` ORDER BY content_list.date ASC`;
      // console.log('mainTimelineUrl.sql2 :', sql2);
      connection.query(sql2, function(err, results2) {
        //console.log(results2);
        res.render(timelineFollowContainerView, {
          contents: results2,
          iframeUrl: mainBargainsUrl,
          storeUrl: mainStoreUrl
        });
      });
    } else {
      res.render(timelineFollowContainerView, {
        contents: null,
        iframeUrl: mainBargainsUrl,
        storeUrl: mainStoreUrl
      });
    }
  });
});

router.get(mainBargainsUrl, function(req, res) {
  console.log('1, ' + mainBargainsUrl + ' get callback start');
  const userAuth = req.session.passport.user;
  const sql1 = `SELECT owner_auth FROM follow WHERE user_auth=` + mysql.escape(userAuth);
  connection.query(sql1, function(err, results1) {
    var sql2 = `SELECT product_info.*, owner.image_url, owner.store FROM product_info INNER JOIN owner ON product_info.owner_auth=owner.owner_auth WHERE (product_info.sale is not null) and (`;
    for (var i = 0; i < results1.length; i++) {
      sql2 += `product_info.owner_auth=`;
      sql2 += mysql.escape(results1[i].owner_auth);
      if (i < results1.length - 1) {
        sql2 += ` OR `;
      }
    }
    sql2 += `)`;
    //console.log('mainBargains.results1', results1);
    //console.log('mainBargains.sql2 : ', sql2);
    connection.query(sql2, function(err, results) {
      // console.log('mainBargains.results', results);
      res.render(timelineSaleContainerView, {
        storeUrl: mainStoreUrl,
        contents: results
      });
    });
  });
});

router.get(mainSearchUrl, function(req, res) {
  var userAuth = req.session.passport.user;
  var sql = `SELECT address1, address2, address3 FROM user WHERE user_auth=` + mysql.escape(userAuth);
  connection.query(sql, function(err, results) {
    // console.log('result', results);
    res.render(mainSearchView, {
      contents: results,
      searchUrl: mainSearchUrl
    });
  });
});
router.post(mainSearchUrl, function(req, res) {
  console.log('1, ', mainSearchUrl);
  var address1 = req.body.address1.slice(0, -1);
  var address2 = req.body.address2.slice(0, -1);
  var address3 = req.body.address3.slice(0, -1);
  var store = req.body.store;
  // console.log('address');
  // console.log(address1,address2, address3);
  // if(address3 == null)console.log('null');
  // if(address3 == '')console.log('blank');
  var sql = `SELECT owner_auth, owner_id, store, image_url FROM owner`;
  if (address1 != '' || address2 != '' || address3 != '' || store != '') {
    sql += ` WHERE `;
    if (store != '') {
      sql += `store LIKE ` + mysql.escape('%' + store + '%');
    } else {
      if (address1 != '') {
        sql += `address1 LIKE ` + mysql.escape('%' + address1 + '%');
      }
      if (address1 != '' && (address2 != '' || address3 != '')) {
        sql += ` and `;
        if (address2 != '') {
          sql += `address2 LIKE ` + mysql.escape('%' + address2 + '%');
        }
      }
      if ((address1 != '' || address2 != '') && address3 != '') {
        sql += ` and `;
      }
      if (address3 != '') {
        sql += `address3 LIKE ` + mysql.escape('%' + address3 + '%');
      }
    }
  }
  console.log('search sql = ', sql);
  connection.query(sql, function(err, results) {
    //console.log('search results = ', results);
    //console.log(req.headers);
    var isStore = 1;
    if (results.length == 0) {
      isStore = 0;
    }
    res.render(searchResultView, {
      followBtnUrl: followBtnUrl,
      isStore: isStore,
      contents: results,
      storeUrl: mainStoreUrl
    });
  });
});
router.get(mainUserInfoUrl, function(req, res) {
  var userAuth = req.session.passport.user;
  var sql = `SELECT * FROM user WHERE user_auth=` + mysql.escape(userAuth);
  connection.query(sql, function(err, results) {
    //console.log('results : ',results);
    res.render(mainUserInfoView, {
      contents: results,
      userInfoPostUrl: mainUserInfoUrl,
      uploadUrl: userProfileImageUploadUrl
    });
  });
});
router.post(mainUserInfoUrl, function(req, res) {
  var userAuth = req.session.passport.user;
  var user = {
    name: req.body.name,
    address1: req.body.address1,
    address2: req.body.address2,
    address3: req.body.address3,
    address4: req.body.address4,
  };
  var sql = `UPDATE user SET ? WHERE user_auth=` + mysql.escape(req.session.passport.user);
  connection.query(sql, user, function(err, results) {
    res.redirect(mainUserInfoUrl);
  });
});









router.get(mainStoreUrl + '/:owner_auth', function(req, res) {
  console.log('1, storeMain');
  const ownerAuth = req.params.owner_auth;
  console.log('1.1, ' + ownerAuth);
  var sql1 = `SELECT number FROM content_list WHERE owner_auth=` + mysql.escape(ownerAuth);
  connection.query(sql1, function(err, results1) {
    var sql2 = `SELECT user_auth FROM follow WHERE owner_auth=` + mysql.escape(ownerAuth);
    connection.query(sql2, function(err, results2) {
      var sql = 'SELECT * FROM owner WHERE owner_auth=' + mysql.escape(ownerAuth);
      connection.query(sql, function(err, results) {
        //console.log(results);
        console.log('2, storeMain');
        // console.log(results1.length);
        // console.log(results2.length);
        if (err) return done(err);
        const info = results[0];
        console.log('3, before render');
        res.render(storeMainView, {
          productUrl: productUrl + '/' + ownerAuth + '/' + results[0].store,
          followBtnUrl: followBtnUrl + '/' + ownerAuth,
          contentCount: results1.length,
          followerCount: results2.length,
          contents: results[0],
          saleUrl: storeMainSaleUrl + '/' + ownerAuth,
          followUrl: storeMainFollowerUrl + '/' + ownerAuth,
          reviewUrl: reviewListUrl + '/' + ownerAuth,
          contentUploadUrl: storeMainContentUploadUrl + '/' + ownerAuth,
          iframeUrl: storeMainContentContainerUrl + '/' + ownerAuth
        });
        console.log('4, after render');
      });
    });
  });
  console.log('5, after query');
});
router.get(productUrl + '/:owner_auth/:store', function(req, res) {
  const ownerAuth = req.params.owner_auth;
  const userAuth = req.session.passport.user;
  var sql = `SELECT * FROM product_info WHERE owner_auth=` + mysql.escape(ownerAuth);
  connection.query(sql, function(err, results) {
    res.render(productView, {
      isOwner: 0,
      productDetailUrl: productDetailUrl,
      store: req.params.store,
      contents: results
    });
  });
});
router.get(productDetailUrl + '/:owner_auth/:store/:number', function(req, res) {
  const ownerAuth = req.params.owner_auth;
  const userAuth = req.session.passport.user;
  var sql = `SELECT * FROM product_info WHERE owner_auth=` + mysql.escape(ownerAuth) + ` and number=` + mysql.escape(req.params.number);
  connection.query(sql, function(err, results) {
    console.log(results);
    res.render(productDetailView, {
      isOwner: 0,
      store: req.params.store,
      contents: results[0]
    });
  });
});
router.get(followBtnUrl + '/:owner_auth', function(req, res) {
  const ownerAuth = req.params.owner_auth;
  const userAuth = req.session.passport.user;
  var sql = `SELECT * FROM follow WHERE user_auth=` + mysql.escape(userAuth) + ` and owner_auth=` + mysql.escape(ownerAuth);
  connection.query(sql, function(err, results) {
    if (results != '') { //팔로우를 했으면
      var isFollow = 1;
    } else {
      var isFollow = 0;
    }
    res.render(followBtnView, {
      isFollow: isFollow,
      followUrl: followUrl + '/' + ownerAuth
    });
  });
});

router.get(followUrl + '/:owner_auth', function(req, res) {
  console.log('1, store follow');
  var ownerAuth = req.params.owner_auth;
  var userAuth = req.session.passport.user;
  var sql = `SELECT * FROM follow WHERE user_auth=` + mysql.escape(userAuth) + ` and owner_auth=` + mysql.escape(ownerAuth);
  connection.query(sql, function(err, results) {
    console.log('2, store follow sql conn');
    if (results != '') {
      var sql2 = `DELETE FROM follow WHERE user_auth=` + mysql.escape(userAuth) + ` and owner_auth=` + mysql.escape(ownerAuth);
    } else {
      var sql2 = `INSERT INTO follow VALUES (?,?)`;
    }
    connection.query(sql2, [ownerAuth, userAuth], function(err, results) {
      res.redirect(followBtnUrl + '/' + ownerAuth);
    });
  });
});

router.get(storeMainContentContainerUrl + '/:owner_auth', function(req, res) {
  console.log('1, storeMainContainer');
  const ownerAuth = req.params.owner_auth;
  var sql = 'SELECT * FROM content_list WHERE owner_auth=';
  connection.query(sql + mysql.escape(ownerAuth), function(err, results) {
    //console.log(results);
    res.render(storeMainContentContainerView, {
      owner_auth: ownerAuth,
      contents: results,
      storeMainContentDetailUrl: storeMainContentDetailUrl + '/' + ownerAuth
    });
  });
});

router.get(storeMainContentDetailUrl + '/:owner_auth/:number', function(req, res) {
  console.log('1, contentDetail');
  const ownerAuth = req.params.owner_auth;
  const sql1 = 'select * from content_list where owner_auth=';
  const sql2 = 'and number='
  connection.query(sql1 + mysql.escape(ownerAuth) + sql2 + mysql.escape(req.params.number), function(err, results) {
    // console.log(results);
    res.render(storeMainContentDetailView, {
      url: results[0].url,
      owner_auth: ownerAuth,
      content: results[0].content,
      date: results[0].date
    });
  });
});

router.get(storeMainContentUploadUrl + '/:owner_auth', function(req, res) {
  console.log('1, contentUpload');
  const ownerAuth = req.params.owner_auth;
  res.render(storeMainContentUploadView, {
    uploadUrl: uploadUrl + '/' + ownerAuth,
    storeMainUrl: storeMainUrl + '/' + ownerAuth
  });
});

router.get(storeMainFollowerUrl + '/:owner_auth', function(req, res) {
  console.log('1, follow');
  const ownerAuth = req.params.owner_auth;
  const sql = 'SELECT * FROM follow WHERE owner_auth=';
  connection.query(sql + mysql.escape(ownerAuth), function(err, results) {
    // console.log(results);
    res.render(storeMainFollowerView, {
      contents: results
    });
  });
});

router.get(storeMainSaleUrl + '/:owner_auth', function(req, res) {
  console.log('1, sale');
  const ownerAuth = req.params.owner_auth;
  res.render(storeMainSaleView);
});

//Review List
router.get(reviewListUrl + '/:owner_auth', function(req, res) {
  console.log('1, reviewList');
  const ownerAuth = req.params.owner_auth;
  console.log('1.1, ' + ownerAuth);
  var query = connection.query('SELECT store FROM owner WHERE owner_auth=' + mysql.escape(ownerAuth), function(err, results) {
    // console.log(results);
    console.log('2, review list before render');
    res.render(reviewListView, {
      owner_auth: ownerAuth,
      store: results[0].store,
      iframeUrl: reviewListContainerUrl + '/' + ownerAuth,
      isUser: 1,
      writeReviewUrl: writeReviewUrl
    });
    console.log('3, review list after render');
  });
  console.log('4, review list after callback');
});

//Reviews Container
router.get(reviewListContainerUrl + '/:owner_auth', function(req, res) {
  console.log('1, reviewContainer');
  const ownerAuth = req.params.owner_auth;
  console.log('1.1, reviewContainer/' + ownerAuth);
  const sql1 = 'SELECT owner.store, review.* FROM review, owner WHERE owner.owner_auth=';
  const sql2 = 'and review.owner_auth=';
  var query = connection.query(sql1 + mysql.escape(ownerAuth) + sql2 + mysql.escape(ownerAuth), function(err, results) {
    if (err) throw err;
    // console.log(results);
    console.log('2, review container before render');
    var html = `
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="utf-8">
        <title></title>
        <style>
          html, form, table, tbody, body {
            height: 100%;
            width: 100%;
            margin: 0;
          }
        </style>
      </head>
      <body>
        <table>`;
    //별점 넣기
    //<span class="star#" style="color:#ccc;">★</span> : 옅은 별
    //<span class="star#" style="color:#777;">★</span> : 짙은 별
    for (var i = 0; i < results.length; i++) { //results[i].user_id
      //여기에 리뷰 클릭시 이동할 url입력.
      var reviewRow = `
          <tr onclick="parent.change_parent_url('${reviewDetailUrl}/${ownerAuth}/${i}');">
            <td>${results[i].user_auth}</td>
            <td style="text-align: center">`;
      var stars = ``;
      for (var j = 0; j < results[i].score; j++) {
        stars += `
              <span style="color:yellow;">★</span>`;
      }
      for (var j = 5; j > results[i].score; j--) {
        stars += `
              <span style="color:#ccc;">★</span>`;
      }
      var reviewRow2 = `
            </td>
            <td><div>장점-${results[i].good}</div><div>단점-${results[i].bad}</div></td>
          </tr>`;
      html += reviewRow + stars + reviewRow2;
    }
    var htmlFooter = `
        </table>
      </body>
      </html>`;
    html = html + htmlFooter;
    res.send(html);
    console.log('3, review container after render');
  });
  console.log('4, review container after callback');
});

//Review Detail
router.get(reviewDetailUrl + '/:owner_auth' + '/:number', function(req, res) {
  console.log('1, reviewDetail');
  const ownerAuth = req.params.owner_auth;
  const reviewNumber = req.params.number;
  console.log('1.1, review/detail/' + ownerAuth + '/' + reviewNumber);
  var sql1 = 'SELECT owner.store, review.* FROM review, owner WHERE owner.owner_auth=';
  var sql2 = 'and review.owner_auth=';
  var query = connection.query(sql1 + mysql.escape(ownerAuth) + sql2 + mysql.escape(ownerAuth), function(err, results) {
    if (err) throw err;
    // console.log(results);
    console.log('2, review detail before render');
    res.render(reviewDetailView, {
      owner_auth: ownerAuth,
      user_name: results[reviewNumber].user_auth,
      store: results[reviewNumber].store,
      score: results[reviewNumber].score,
      good: results[reviewNumber].good,
      bad: results[reviewNumber].bad,
      reviewImg: results[reviewNumber].image
    });
    console.log('3, review detail after render');
  });
  console.log('4, review detail after callback');
});
router.get(writeReviewUrl + '/:owner_auth', function(req, res) {
  const ownerAuth = req.params.owner_auth;
  var sql = `SELECT store FROM owner WHERE owner_auth=` + mysql.escape(ownerAuth);
  connection.query(sql, function(err, results) {
    res.render(writeReviewView, {
      store: results[0].store,
      writeReviewPostUrl: writeReviewUrl + '/' + ownerAuth
    });
  });
});
router.post(writeReviewUrl + '/:owner_auth', function(req, res) {
  const ownerAuth = req.params.owner_auth;
  const userAuth = req.session.passport.user;
  var review = {
    owner_auth: ownerAuth,
    user_auth: userAuth,
    good: req.body.good,
    bad: req.body.bad,
    score: req.body.rating
  };
  var sql1 = `SELECT * FROM review WHERE owner_auth=` + mysql.escape(ownerAuth) + ` and user_auth=` + mysql.escape(userAuth);
  connection.query(sql1, function(err, results1) {
    //console.log('results1 : ', results1, typeof results1, !results1, results1=='');
    if (results1 == '') {
      var sql = `INSERT INTO review SET ?`;
    } else {
      var sql = `UPDATE review SET ? WHERE owner_auth=` + mysql.escape(ownerAuth) + ` and user_auth=` + mysql.escape(userAuth);
    }
    connection.query(sql, review, function(err, results2) {
      res.render(successView, {
        success: reviewListUrl + '/' + ownerAuth
      });
    });
  });
});
router.get(successUrl, function(req, res) {
  res.render(successView, {
    success: successUrl
  });
});



Upload = require('./s3upload/uploadservice')
router.post(userProfileImageUploadUrl, function(req, res) {
  //var content=req.body.content;
  console.log('1, upload');

  var tasks = [
    function(callback) {
      Upload.formidable(req, function(err, files, field) {
        callback(err, files);
      })
    },
    function(files, callback) {
      Upload.s3(files, function(err, result) {
        // console.log(result);
        callback(err, files);
        const userAuth = req.session.passport.user;
        var sql = ' into user(image_url) values (?)';
        var sql = `UPDATE user SET image_url=? WHERE user_auth=` + mysql.escape(userAuth);
        var params = result;
        connection.query(sql, [params.Location], function(err, rows) {
          // console.log(rows);
          if (err) {
            console.log(err);
          } else {
            // console.log(rows);
          }
        });
      });
    }
  ];
  //사용자에게 알려줌
  async.waterfall(tasks, function(err, result) {
    if (!err) {
      //res.json({success:true, msg:'업로드 성공'})
      return res.redirect(mainUserInfoUrl);
    } else {
      res.json({
        success: false,
        msg: '실패',
        err: err
      })
    }
  });
});
router.post(uploadUrl, function(req, res) {
  //var content=req.body.content;

  console.log('1, upload');
  var tasks = [
    function(callback) {
      Upload.formidable(req, function(err, files, field) {
        callback(err, files);
      })
    },
    function(files, callback) {
      Upload.s3(files, function(err, result) {
        // console.log(result);
        callback(err, files);

        //var sql='insert into content_list (owner_auth, url, content) values ("hyk1031",?,?)';
        var sql = 'insert into content_list(owner_auth, url) values ("hyk1031",?)';
        var params = result;
        connection.query(sql, [params.Location], function(err, rows, fields) {
          // console.log(rows);
          if (err) {
            console.log(err);
          } else {
            // console.log(rows);
          }
        });

      });
    }
  ];
  //사용자에게 알려줌
  async.waterfall(tasks, function(err, result) {
    if (!err) {
      //res.json({success:true, msg:'업로드 성공'})
      return res.redirect('/');
    } else {
      res.json({
        success: false,
        msg: '실패',
        err: err
      })
    }
  });
});

Upload = require('./s3upload/uploadservice'),
  router.post('/saleProduct', function(req, res) {
    console.log('1, saleProduct');
    var tasks = [
      function(callback) {
        Upload.formidable(req, function(err, files, field) {
          callback(err, files);
        })
      },
      function(files, callback) {
        Upload.s3(files, function(err, result) {
          callback(err, files);
        });
      }
    ];
    async.waterfall(tasks, function(err, result) {
      if (!err) {
        res.json({
          success: true,
          msg: '업로드 성공'
        })
      } else {
        res.json({
          success: false,
          msg: '실패',
          err: err
        })
      }
    });

  });
router.listen(80, function() {
  console.log('connect 80 port user server');
});
