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

//Reviews Container
app.get('/owner/review/container/:owner_id', function(req, res) {
  var sql1 = 'SELECT owner.store, review.user_id, review.score, review.good, review.bad FROM review, owner WHERE owner.owner_id='
  var sql2 = 'and review.owner_id='
  var query = conn.query(sql1 + mysql.escape(req.params.owner_id) + sql2 + mysql.escape(req.params.owner_id), function(err, results, fields) {
    if (err) throw err;

    //res.json(results);
    console.log(results[0].good);
    var html = `
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="utf-8">
        <title>${results[0].store}</title>
        <style>
          html,
          form,
          table,
          tbody,
          body {
            height: 100%;
            width: 100%;
            margin: 0;
          }
        </style>
      </head>

      <body>
        <table>
    `;

    //별점 넣기
    //<span class="star#" style="color:#ccc;">★</span> : 옅은 별
    //<span class="star#" style="color:#777;">★</span> : 짙은 별
    for (var i = 0; i < results.length; i++) { //results[i].user_id
      //여기에 리뷰 클릭시 이동할 url입력.
      var reviewRow = `
          <tr onclick="parent.change_parent_url('/review/detail/${req.params.owner_id}/${i}');">
            <td>${results[i].user_id}</td>
            <td>
      `;
      var stars = ``;
      for (var j = 0; j < results[i].score; j++) {
        stars += `
              <span class="star#" style="color:#777;">★</span>
        `;
      }
      for (var j = 5; j > results[i].score; j--) {
        stars += `
              <span class="star#" style="color:#ccc;">★</span>
        `;
      }

      var reviewRow2 = `
            </td>
            <td><div>장점-${results[i].good}</div><div>단점-${results[i].bad}</div></td>
          </tr>
      `;
      html += reviewRow + stars + reviewRow2;
    }

    var htmlFooter = `
        </table>
      </body>
      </html>
    `;
    html = html + htmlFooter;
    res.send(html);
  });
});

//Review List
app.get('/owner/review/list/:owner_id', function(req, res) {
  var query = conn.query('SELECT store FROM owner WHERE owner_id=' + mysql.escape(req.params.owner_id), function(err, results) {
    res.render('review_reviewList', {
      owner_id: req.params.owner_id,
      user_id: req.params.user_id,
      store: results[0].store
    });
  });
})
//Review Detail
app.get('/owner/review/detail/:owner_id/:number', function(req, res) {
  var sql1 = 'SELECT owner.store, review.user_id, review.score, review.good, review.bad, review.url FROM review, owner WHERE owner.owner_id='
  var sql2 = 'and review.owner_id='
  var query = conn.query(sql1 + mysql.escape(req.params.owner_id) + sql2 + mysql.escape(req.params.owner_id), function(err, results) {
    if (err) throw err;
    res.render('review_detail', {
      owner_id: req.params.owner_id,
      user_id: results[req.params.number].user_id,
      store: results[req.params.number].store,
      score: results[req.params.number].score,
      good: results[req.params.number].good,
      bad: results[req.params.number].bad,
      reviewImg: results[req.params.number].url
    });
  });
  console.log(query);
});
//Create Review 개발중!
app.get('/owner/review/create/:owner_id/:store', function(req, res) {
  // var sql1 = 'SELECT owner.store, review.user_id, review.score, review.good, review.bad, review.url FROM review, owner WHERE owner.owner_id='
  // var sql2 = 'and review.owner_id='
  // var query = conn.query(sql1 + mysql.escape(req.params.owner_id) + sql2 + mysql.escape(req.params.owner_id), function(err, results) {
  //   if (err) throw err;
  res.render('review_createReview', {
    user_id:req.body.users.user_id,
    owner_id:req.params.owner_id,
    store:req.params.store
  });
  //});
  console.log(query);
});


app.listen(80, function() {
  console.log('Connected 80 port!!!');
});
