
var express = require('express');
var router = express();
var mysql=require('mysql');
var async = require('async');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '111111',
  database : 'test'
});

connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... \n\n");
} else { 
    console.log("Error connecting database ... \n\n");
}        
});     

             
router.set('view engine', 'ejs');
router.use(express.static('./views'));
router.get('/storeMain',function(req,res){

        const sql='select * from image';
        connection.query(sql,function(err,results,field){
                console.log(results);
                res.render('storeMain',{image: results});
        });

});

 


router.get('/sale',function(req,res){
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
});

                           
module.exports=router;
router.listen(3000, function(){

console.log('connect 3000 port');
});

                    
