
var express = require('express');
var router  = express();
var async = require('async');

Upload = require('../server/uploadservice'),
router.set('view engine', 'ejs');
router.use(express.static('./views'));
router.get('/',function(req,res){
res.render('storeMain');});
router.post('/upload', function (req, res) {
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
});
router.listen(80, function(){
console.log('connect 80 port')});

