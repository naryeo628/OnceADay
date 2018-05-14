var express = require('express');
var router = express();
var mysql = require('mysql');
var async = require('async');

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

router.get('/storeMain/:owner_id', function(req, res) {
  var sql = 'SELECT * FROM store_info WHERE owner_id=';
  connection.query(sql + mysql.escape(req.params.owner_id), function(err, results, field) {
    console.log(results);
    //
    //storeMainFix -> storeMain
    //
    res.render('storeMainFix', {
      owner_id: req.params.owner_id,
      store: results[0].store,
      address1: results[0].address1,
      address2: results[0].address2,
      address3: results[0].address3,
      tel: results[0].tel,
      storeTime: results[0].time
    });
  });
});
router.get('/storeMain/container/:owner_id', function(req, res) {
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
          html,
          form,
          table,
          tbody,
          body,
          span,
          iframe {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
          }

          td,
          h1,
          h4 {
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
        <table>
    `;
    var content = ``;
    for (var i = 0; i < results.length; i+=3) {
      content += `
          <tr>
            <td><span><img src=" ${results[i + 0].url} " alt="${results[i + 0].content}"></span></td>
            <td><span><img src=" ${results[i + 1].url} " alt="${results[i + 1].content}"></span></td>
            <td><span><img src=" ${results[i + 2].url} " alt="${results[i + 2].content}"></span></td>
          </tr>
      `
    }
    html += content + `
        </table>
      </body>
      </html>
    `
    res.send(html);
  });
});

router.get('/contentUpload', function(req, res) {
  res.render('contentUpload');
});

Upload = require('../s3upload/uploadservice'),
  router.post('/upload', function(req, res) {
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

  const sql = 'select * from follow';
  connection.query(sql, function(err, results, field) {
    console.log(results);
    res.render('follow', {
      follow: results
    });
  });

});


/*router.get('/sale',function(req,res){
        res.render('sale');
});

Upload = require('../s3upload/uploadservice'),
router.post('/saleProduct', function (req, res) {
    var tasks =[
        function (callback) {
            Upload.formidable(req, function (err, files, field) {
                callback(err, files);
            })
        },
        function (files, callback) {
            Upload.s3(files, function (err, result) {
                callback(err, files);
            });

   }
    ];
   async.waterfall(tasks, function (err, result) {
        if(!err){
            res.json({success:true, msg:'업로드 성공'})
        }else{
            res.json({success:false, msg:'실패', err:err})
        }
    });

});*/
module.exports = router;
router.listen(3000, function() {
  console.log('connect 80 port');
});
