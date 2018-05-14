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
//
// //Reviews Container
// app.get('/review/container/:owner_id', function(req, res) {
//   var sql1 = 'SELECT owner.store, review.user_id, review.score, review.good, review.bad FROM review, owner WHERE owner.owner_id='
//   var sql2 = 'and review.owner_id='
//   var query = conn.query(sql1 + mysql.escape(req.params.owner_id) + sql2 + mysql.escape(req.params.owner_id), function(err, results, fields) {
//     if (err) throw err;
//
//     //res.json(results);
//     console.log(results[0].good);
//     var html = `
//       <!DOCTYPE html>
//       <html>
//
//       <head>
//         <meta charset="utf-8">
//         <title>${results[0].store}</title>
//         <style>
//           html,
//           form,
//           table,
//           tbody,
//           body {
//             height: 100%;
//             width: 100%;
//             margin: 0;
//           }
//         </style>
//       </head>
//
//       <body>
//         <table>
//     `;
//
//     //별점 넣기
//     //<span class="star#" style="color:#ccc;">★</span> : 옅은 별
//     //<span class="star#" style="color:#777;">★</span> : 짙은 별
//     for (var i = 0; i < results.length; i++) {//results[i].user_id
//       //여기에 리뷰 클릭시 이동할 url입력.
//       var reviewRow = `
//           <tr onclick="parent.change_parent_url('/review/detail/${req.params.owner_id}/${i}');">
//             <td>${results[i].user_id}</td>
//             <td>
//       `;
//       var stars = ``;
//       for (var j = 0; j < results[i].score; j++) {
//         stars += `
//               <span class="star#" style="color:#777;">★</span>
//         `;
//       }
//       for (var j = 5; j > results[i].score; j--) {
//         stars += `
//               <span class="star#" style="color:#ccc;">★</span>
//         `;
//       }
//
//       var reviewRow2 = `
//             </td>
//             <td><div>장점-${results[i].good}</div><div>단점-${results[i].bad}</div></td>
//           </tr>
//       `;
//       html += reviewRow + stars + reviewRow2;
//     }
//
//     var htmlFooter = `
//         </table>
//       </body>
//       </html>
//     `;
//     html = html + htmlFooter;
//     res.send(html);
//   });
// });
//
// //Review List
// app.get('/review/list/:owner_id', function(req, res) {
//   var query = conn.query('SELECT store FROM owner WHERE owner_id=' + mysql.escape(req.params.owner_id), function(err, results) {
//     res.render('review_reviewList', {
//       owner_id: req.params.owner_id,
//       user_id: req.params.user_id,
//       store: results[0].store
//     });
//   });
// })
// //Review Detail
// app.get('/review/detail/:owner_id/:number', function(req, res) {
//   var sql1 = 'SELECT owner.store, review.user_id, review.score, review.good, review.bad, review.url FROM review, owner WHERE owner.owner_id='
//   var sql2 = 'and review.owner_id='
//   var query = conn.query(sql1 + mysql.escape(req.params.owner_id) + sql2 + mysql.escape(req.params.owner_id), function(err, results) {
//     if (err) throw err;
//     res.render('review_detail', {
//       owner_id: req.params.owner_id,
//       user_id: results[req.params.number].user_id,
//       store: results[req.params.number].store,
//       score: results[req.params.number].score,
//       good: results[req.params.number].good,
//       bad: results[req.params.number].bad,
//       reviewImg: results[req.params.number].url
//     });
//   });
//   console.log(query);
// });


app.listen(80, function() {
  console.log('Connected 80 port!!!');
});
