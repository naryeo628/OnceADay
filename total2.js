var express = require('express');
var router = express();
var mysql = require('mysql');
var async = require('async');
<<<<<<< HEAD
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var bodyParser = require('body-parser');
var bkfd2Password = require("pbkdf2-password");
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var hasher = bkfd2Password();
=======
>>>>>>> cc04271b48e8ecbc0dc042e0b80f1bfdaaa0c4e1

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '111111',
  database: 'o2'
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

<<<<<<< HEAD
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
    database: 'o2'
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
  done(null, user.authId);
});
passport.deserializeUser(function(id, done) {
  console.log('deserializeUser', id);
  var sql = 'SELECT * FROM owner WHERE authId=?';
  connection.query(sql, [id], function(err, results) {
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

router.get('/owner/logout', function(req, res) {
  req.logout();
  res.redirect('/storeLogin');
});
router.get('/owner/login', function(req, res) {
  res.render('storeLogin', {
    storeRegisterUrl: '/owner/register'
  })
});
router.post('/owner/login', passport.authenticate(
  'local', {
    successRedirect: '/storeMain',
    failureRedirect: '/owner/login',
    failureFlash: false
  }
));

router.post('/login', passport.authenticate('local', {
  failureRedirect: '/'
}), (req, res) => {
  res.redirect('/owner/storeMain/req.session.user.');
});

router.get('/owner/register', function(req, res) {
  res.render('storeRegister', {
    storeRegisterUrl: '/owner/register'
  });
});
router.post('/owner/register', function(req, res) {
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
    connection.query(sql, user, function(err, results) {
      if (err) {
        console.log(err);
        res.status(500);
      } else {
        req.login(user, function(err) {
          req.session.save(function() {
            res.redirect('/owner/storeInfo');
          });
        });
      }
=======
/*
router.get('/storeMain', function(req, res) {
  console.log('1');
  const sql = 'select * from store_info,content_list where store_info.owner_id=content_list.owner_id and content_list.owner_id=?';
  params = ["hyk1031"];
  connection.query(sql, params, function(err, results, field) {
    console.log(results);
    console.log('2');
    console.log('3, before render');
    res.render('storeMain', {
      address1: '서울시',
      address2: '성북구', 
      address3: '삼선동', 
      address4: '한성대학교', 
      tel: '010-7577-4937', 
      storeTime: '09:00~18:00', 
      followerListUrl: '/follow', 
      image: results,
      owner_id: results[0],
      store: '팥고당', 
      storeinfo: results[0],
      reviewUrl: '/owner/review/list/' + params, 
      contentUploadUrl: '/contentUpload', 
      iframeUrl: '/owner/storeMain/container/' + params
>>>>>>> cc04271b48e8ecbc0dc042e0b80f1bfdaaa0c4e1
    });
    console.log('4, after render');
  });
  console.log('5, after query');
});
<<<<<<< HEAD

router.get('/owner/storeInfo', function(req, res) {
  res.render('storeInfo'{
    storeInfoUrl: '/owner/storeInfo'
  });
});

router.post('/owner/storeInfo', function(req, res) {

  var address1 = req.body.address1;
  var address2 = req.body.address2;
  var address3 = req.body.address3;
  var address4 = req.body.address4;
  var tel = req.body.tel;
  var time = req.body.time;

  var sql = 'INSERT INTO store_info(address1,address2,address3,address4,tel,time)VALUES(?,?,?,?,?,?,?) '

  ;

  connection.query(sql, [id, address1, address2, address3, address4, tel, time], function(err, result, fields) {
    if (err) {
      console.log(err);
      res.status(500);
    } else {
      res.redirect('/storeLogin');
    }
  });
});
=======
*/
>>>>>>> cc04271b48e8ecbc0dc042e0b80f1bfdaaa0c4e1

router.get('/owner/storeMain/:owner_id', function(req, res) {
  console.log('1, storeMain');
  var sql = 'SELECT * FROM store_info WHERE owner_id=';
  const ownerId = req.params.owner_id;
  console.log('1.1, ' + ownerId);
  connection.query(sql + mysql.escape(ownerId), function(err, results) {
    console.log(results);
    console.log('2');
<<<<<<< HEAD
    if (err) return done(err);
=======
    if(err) return done(err);
>>>>>>> cc04271b48e8ecbc0dc042e0b80f1bfdaaa0c4e1
    const info = results[0];
    //storeMainFix -> storeMain
    console.log('3, before render');
    res.render('storeMain', {
      owner_id: ownerId,
      store: info.store,
      address1: info.address1,
      address2: info.address2,
      address3: info.address3, 
      address4: info.address4,
      tel: info.tel, 
      storeTime: info.time,
      /*
      store: results[0].store,
      address1: results[0].address1,
      address2: results[0].address2,
      address3: results[0].address3,
      address4: results[0].address4,
      tel: results[0].tel,
      storeTime: results[0].time,
      */
      followerListUrl: '/follow',
      reviewUrl: '/owner/review/list/' + req.params.owner_id,
      contentUploadUrl: '/contentUpload',
      iframeUrl: '/owner/storeMain/container/' + req.params.owner_id
    });
    console.log('4, after render');
    return;
  });
  console.log('5, after query');
  return;
});

router.get('/owner/storeMain/container/:owner_id', function(req, res) {
  console.log('1, storeMainContainer');
  var sql = 'SELECT * FROM content_list WHERE owner_id=';
  connection.query(sql + mysql.escape(req.params.owner_id), function(err, results) {
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
        for (var j = 0; j < results.length % 3; j++) {
          content += `
            <td><span><img src=" ${results[i + j].url} " alt="${results[i + j].content}"></span></td>`;
        }
      } else {
        for (var j = 0; j < 3; j++) {
          content += `
            <td><span><img src=" ${results[i + j].url} " alt="${results[i + j].content}"></span></td>`;
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

router.get('/contentUpload', function(req, res) {
  console.log('1, contentUpload');
  res.render('contentUpload');
});

Upload = require('../s3upload/uploadservice'),
<<<<<<< HEAD
  router.post('/upload', function(req, res) {
    console.log('1, upload');
=======
 router.post('/upload', function(req, res) {
	//var content=req.body.content;

  console.log('1, upload');
>>>>>>> cc04271b48e8ecbc0dc042e0b80f1bfdaaa0c4e1
    var tasks = [
      function(callback) {
        Upload.formidable(req, function(err, files, field) {
          callback(err, files);
        })
      },
      function(files, callback) {
        Upload.s3(files, function(err, result) {
<<<<<<< HEAD
          callback(err, files);
=======
          console.log(result);
	  callback(err, files);
	
	//var sql='insert into content_list (owner_id, url, content) values ("hyk1031",?,?)';
	var sql='insert into content_list(owner_id, url) values ("hyk1031",?)';
	var params=result;
	connection.query(sql,[params.Location],function(err, rows, fields) {
	   console.log(rows);
	  if(err){
	   console.log(err);
	  }else{
	   console.log(rows);}
	});

>>>>>>> cc04271b48e8ecbc0dc042e0b80f1bfdaaa0c4e1
        });
      }
    ];
    async.waterfall(tasks, function(err, result) {
      if (!err) {
        //res.json({success:true, msg:'업로드 성공'})
        return res.redirect('/storeMain');
      } else {
        res.json({
          success: false,
          msg: '실패',
          err: err
        })
      }
    });
  });

router.get('/follow', function(req, res) {
  console.log('1, follow');
  const sql = 'select * from follow';
  connection.query(sql, function(err, results, field) {
    console.log(results);
    res.render('follow', {
      follow: results
    });
  });
});

router.get('/contentDetail', function(req, res) {
  console.log('1, contentDetail');
  const sql = 'select * from content_list where owner_id=?';
  params = ["hyk1031"];
  connection.query(sql, params, function(err, results, field) {
    console.log(results);
    res.render('contentDetail', {
      url: results[0].url,
      owner_id: results[0].owner_id,
      content: results[4].content,
      date: results[0].date
    });
  });
});


router.get('/sale', function(req, res) {
  console.log('1, sale');
  res.render('sale');
});

Upload = require('../s3upload/uploadservice'),
  router.post('/saleProduct', function(req, res) {
<<<<<<< HEAD
    console.log('1, saleProduct');
=======
  console.log('1, saleProduct');
>>>>>>> cc04271b48e8ecbc0dc042e0b80f1bfdaaa0c4e1
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

//Review List
router.get('/owner/review/list/:owner_id', function(req, res) {
  console.log('1, reviewList');
  const ownerId = req.params.owner_id;
  console.log('1.1, ' + ownerId);
  var query = connection.query('SELECT store FROM owner WHERE owner_id=' + mysql.escape(ownerId), function(err, results) {
    console.log(results);
    console.log('2, review list before render');
    res.render('review_reviewList', {
      owner_id: ownerId,
      // user_id: req.params.user_id,
      store: results[0].store,
      iframeUrl: '/owner/review/container/' + ownerId
    });
    console.log('3, review list after render');
  });
  console.log('4, review list after callback');
});

//Reviews Container
router.get('/owner/review/container/:owner_id', function(req, res) {
  console.log('1, reviewContainer');
  const ownerId = req.params.owner_id;
  console.log('1.1, reviewContainer/' + ownerId);
  var sql1 = 'SELECT owner.store, review.user_id, review.score, review.good, review.bad FROM review, owner WHERE owner.owner_id='
  var sql2 = 'and review.owner_id='
  var query = connection.query(sql1 + mysql.escape(ownerId) + sql2 + mysql.escape(ownerId), function(err, results) {
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
          <tr onclick="parent.change_parent_url('/owner/review/detail/${ownerId}/${i}');">
            <td>${results[i].user_id}</td>
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
router.get('/owner/review/detail/:owner_id/:number', function(req, res) {
  console.log('1, reviewDetail');
  const ownerId = req.params.owner_id;
  const reviewNumber = req.params.number;
  console.log('1.1, review/detail/' + ownerId + '/' + reviewNumber);
  var sql1 = 'SELECT owner.store, review.user_id, review.score, review.good, review.bad, review.image FROM review, owner WHERE owner.owner_id='
  var sql2 = 'and review.owner_id='
  var query = connection.query(sql1 + mysql.escape(ownerId) + sql2 + mysql.escape(ownerId), function(err, results) {
    if (err) throw err;
    console.log(results);
    console.log('2, review detail before render');
    res.render('review_reviewDetail', {
      owner_id: ownerId,
      user_id: results[reviewNumber].user_id,
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
/*
module.exports = router;
*/
router.listen(3000, function() {
  console.log('connect 3000 port');
});
