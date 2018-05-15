var express =require('express');
var router = express();
var mysql      = require('mysql');
var bodyParser = require('body-parser');
router.locals.pretty = true; 
router.use(bodyParser.urlencoded({extended:false}))
router.set('view engine', 'ejs');
router.set('views','./views');
router.use(express.static('public'));
router.get('/search',function(req,res){
res.render('search2');});




var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '111111',
  database : 'o2'
});
connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... \n\n");
} else {
    console.log("Error connecting database ... \n\n");
}
});


router.post('/searchInfo',function(req, res){
var data;
	var si=req.body.address1;
        var gu=req.body.address2;
        var dong=req.body.address3;
var sql = 'SELECT owner_id  from storeinfo where address1 = ?, address2 = ?, address3 = ? '

;

connection.query(sql,[si,gu,dong], function(err, result) {
 if (err) {
        console.log(err);
        res.status(500);
      } else {
        
            res.send(result);
}})});





 

     



router.listen(80, function(){
console.log('connect 80 port');});
                    












                    
