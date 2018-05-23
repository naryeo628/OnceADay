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


//URLs
const loginUrl = `/owner/login`;
const logoutUrl = `/owner/logout`;
const registerUrl = `/owner/register`;
const storeMainUrl = `/owner/storeMain`;
const storeMainContentContainerUrl = `/owner/storeMain/container`;
const storeMainContentDetailUrl = `/owner/storeMain/container/detail`;
const storeMainContentUploadUrl = `/owner/storeMain/upload/content`;
const storeMainFollowerUrl = `/owner/storeMain/follower`;
const storeMainSaleUrl = `/owner/storeMain/sale`;
const reviewListUrl = `/owner/storeMain/review/list`;
const reviewListContainerUrl = `/owner/storeMain/review/list/container`;
const reviewDetailUrl = `/owner/storeMain/review/detail`;
const writeContentUrl = `/owner/storeMain/write`;
const uploadUrl = `/owner/storeMain/upload`;


//Views
const loginView = `storeLogin`;
const registerView = `storeRegister`;
const logoutView = ``;
const storeMainView = `storeMain`;
const storeMainContentContainerView = ``;
const storeMainContentDetailView = `contentDetail`;
const storeMainContentUploadView = `contentUpload`;
const storeMainFollowerView = `follow`;
const storeMainSaleView = `sale`;
const reviewListView = `review_reviewList`;
const reviewListContainerView = ``;
const reviewDetailView = `review_reviewDetail`;

router.get('/', function(req, res) {
  res.redirect(loginUrl);
});

router.get(logoutUrl, function(req, res) {
  req.logout();
  res.redirect(loginUrl);
});

passport.serializeUser(function(user, done) {
  console.log('serializeUser', user);
  done(null, user.owner_auth);
});
passport.deserializeUser(function(id, done) {
  console.log('deserializeUser', id);
  var sql = 'SELECT * FROM owner WHERE owner_auth=';
  connection.query(sql + mysql.escape(id), function(err, results) {
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
passport.use(new LocalStrategy({
    usernameField: 'owner_id',
    passwordField: 'owner_password'
  },
  function(owner_id, owner_password, done) {
    console.log('start login function');
    var uname = owner_id;
    var pwd = owner_password;
    var sql = 'SELECT * FROM owner WHERE owner_auth=';
    connection.query(sql + mysql.escape('local:' + uname), function(err, results) {
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

router.get(loginUrl, function(req, res) {
  res.render(loginView, {
    storeRegisterUrl: registerUrl,
    storeloginPostUrl: loginUrl,
    idBoxName: 'owner_id',
    passwordBoxName: 'owner_password'
  });
});
router.post(loginUrl, passport.authenticate('local', {
  failureRedirect: loginUrl
}), function(req, res) {
  console.log(req.session.passport.user);
  res.redirect(storeMainUrl);
});
router.get(registerUrl, function(req, res) {
  console.log('1, ' + registerUrl + 'get callback start');
  res.render(registerView, {
    storeRegisterPostUrl: registerUrl
  });
});
router.post(registerUrl, function(req, res) {
  console.log('1, ' + registerUrl + 'post callback start');
  hasher({
    password: req.body.owner_pw
  }, function(err, pass, salt, hash) {
    var owner = {
      owner_auth: 'local:' + req.body.owner_id,
      owner_id: req.body.owner_id,
      owner_password: hash,
      salt: salt,
      store: req.body.owner_name,
      address1: req.body.address1,
      address2: req.body.address2,
      address3: req.body.address3,
      address4: req.body.address4,
      tel: req.body.tel,
      time: req.body.time
    };
    console.log('1.1, ' + registerUrl + owner);
    var sql = 'INSERT INTO owner SET ?';
    connection.query(sql, owner, function(err, results) {
      if (err) {
        console.log(err);
        res.status(500);
      } else {
        req.login(owner, function(err) {
          req.session.save(function() {
            res.redirect(loginUrl);
          });
        });
      }
    });
  });
});

router.get(storeMainUrl, function(req, res) {
  console.log('1, storeMain');
  var sql = 'SELECT * FROM owner WHERE owner_auth=';
  const ownerAuth = req.session.passport.user;
  console.log('1.1, ' + ownerAuth);
  connection.query(sql + mysql.escape(ownerAuth), function(err, results) {
    console.log(results);
    console.log('2');
    if (err) return done(err);
    const info = results[0];
    console.log('3, before render');
    res.render(storeMainView, {
      contents: results[0],
      saleUrl: storeMainSaleUrl,
      followerListUrl: storeMainFollowerUrl,
      reviewUrl: reviewListUrl,
      contentUploadUrl: storeMainContentUploadUrl,
      iframeUrl: storeMainContentContainerUrl
    });
    console.log('4, after render');
  });
  console.log('5, after query');
});

router.get(storeMainContentContainerUrl, function(req, res) {
  console.log('1, storeMainContainer');
  var sql = 'SELECT * FROM content_list WHERE owner_auth=';
  connection.query(sql + mysql.escape(req.session.passport.user), function(err, results) {
    console.log(results);
    var html = `
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="utf-8">
        <title></title>
        <style>
          html, form, table, tbody, body, span, iframe {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
          }
          td, h1, h4 {
            margin: 0;
            padding: 0;
          }
          img {
            width: 100%;
            height: auto;
          }
        </style>
      </head>

      <body>
        <table>`;
    var content = ``;
    for (var i = 0; i < results.length; i += 3) {
      content += `
          <tr>
      `;
      if (results.length - i <= 3) {
        var temp = `
            <td><span><img src="${results[i + j].url}" alt="${results[i + j].content}" onclick = "location.href = '${storeMainContentDetailUrl} + '/' + ${results[i + j].number}'"></span></td>`;
        for (var j = 0; j < results.length % 3; j++) {
          content += temp;
        }
      } else {
        for (var j = 0; j < 3; j++) {
          content += temp;
        }
      }
      content += `
          </tr>`;
    }
    html += content + `
        </table>
      </body>
      </html>`;
    res.send(html);
  });
});

router.get(storeMainContentDetailUrl + '/:number', function(req, res) {
  console.log('1, contentDetail');
  const sql1 = 'select * from content_list where owner_auth=';
  const sql2 = 'and number='
  connection.query(sql1 + mysql.escape(req.session.passport.user) + sql2 + mysql.escape(req.params.number), function(err, results) {
    console.log(results);
    res.render(storeMainContentDetailView, {
      url: results[0].url,
      owner_auth: results[0].owner_auth,
      content: results[0].content,
      date: results[0].date
    });
  });
});

router.get(storeMainContentUploadUrl, function(req, res) {
  console.log('1, contentUpload');
  res.render(storeMainContentUploadView, {
    uploadUrl: uploadUrl,
    storeMainUrl: storeMainUrl
  });
});

router.get(storeMainFollowerUrl, function(req, res) {
  console.log('1, follow');
  const sql = 'SELECT * FROM follow WHERE owner_auth=';
  connection.query(sql + mysql.escape(req.session.passport.user), function(err, results) {
    console.log(results);
    res.render(storeMainFollowerView, {
      follow: results
    });
  });
});


router.get(storeMainSaleUrl, function(req, res) {
  console.log('1, sale');
  res.render(storeMainSaleView);
});

//Review List
router.get(reviewListUrl, function(req, res) {
  console.log('1, reviewList');
  const ownerAuth = req.session.passport.user;
  console.log('1.1, ' + ownerAuth);
  var query = connection.query('SELECT store FROM owner WHERE owner_auth=' + mysql.escape(ownerAuth), function(err, results) {
    console.log(results);
    console.log('2, review list before render');
    res.render(reviewListView, {
      owner_auth: ownerAuth,
      store: results[0].store,
      iframeUrl: reviewListContainerUrl
    });
    console.log('3, review list after render');
  });
  console.log('4, review list after callback');
});

//Reviews Container
router.get(reviewListContainerUrl, function(req, res) {
  console.log('1, reviewContainer');
  const ownerAuth = req.session.passport.user;
  console.log('1.1, reviewContainer/' + ownerAuth);
  const sql1 = 'SELECT owner.store, review.* FROM review, owner WHERE owner.owner_auth=';
  const sql2 = 'and review.owner_auth=';
  var query = connection.query(sql1 + mysql.escape(ownerAuth) + sql2 + mysql.escape(ownerAuth), function(err, results) {
    if (err) throw err;
    console.log(results);
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
          <tr onclick="parent.change_parent_url('${reviewDetailUrl}/${i}');">
            <td>${results[i].user_auth}</td>
            <td>`;
      var stars = ``;
      for (var j = 0; j < results[i].score; j++) {
        stars += `
              <span class="star#" style="color:#777;">★</span>`;
      }
      for (var j = 5; j > results[i].score; j--) {
        stars += `
              <span class="star#" style="color:#ccc;">★</span>`;
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
router.get(reviewDetailUrl + '/:number', function(req, res) {
  console.log('1, reviewDetail');
  const ownerAuth = req.session.passport.user;
  const reviewNumber = req.params.number;
  console.log('1.1, review/detail/' + ownerAuth + '/' + reviewNumber);
  var sql1 = 'SELECT owner.store, review.* FROM review, owner WHERE owner.owner_auth=';
  var sql2 = 'and review.owner_auth=';
  var query = connection.query(sql1 + mysql.escape(ownerAuth) + sql2 + mysql.escape(ownerAuth), function(err, results) {
    if (err) throw err;
    console.log(results);
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



////////////
router.get(uploadUrl, function(req, res) {
  res.render(storeMainContentUploadView);
});
Upload = require('./s3upload/uploadservice'),
  router.post(uploadUrl, function(req, res) {
    //var content=req.body.content;
    var ownerAuth = req.session.passport.user;
    console.log('1, upload');
    var tasks = [
      function(callback) {
        Upload.formidable(req, function(err, files, field) {
          callback(err, files);
        });
      },
      function(files, callback) {
        Upload.s3(files, function(err, result) {
          console.log('upload.s3');
          console.log(result);
          callback(err, files);

          var sql='insert into content_list (owner_auth, url, content) values ("hyk1031",?,?)';
          var sql = 'INSERT INTO content_list(owner_auth, url) values (?,?)';
          var params = result;
          var sql1 = `SELECT MAX(number) FROM content_list WHERE owner_auth=` + mysql.escape(ownerAuth);
          connection.query(sql1, function(err, results) {
          console.log(results);
            connection.query(sql, [ownerAuth, params.Location], function(err, rows, fields) {
              console.log(rows);
              if (err) {
                console.log(err);
              } else {
                console.log(rows);
              }
            });
          });
        });
      }
    ];
    //사용자에게 알려줌
    async.waterfall(tasks, function(err, result) {
      if (!err) {
        //res.json({success:true, msg:'업로드 성공'})
        return res.redirect(storeMainUrl);
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

/*
module.exports = router;
*/
router.listen(3000, function() {
  console.log('connect 3000 port owner server');
});
