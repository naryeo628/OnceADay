var express =require('express');
var router = express();
var mysql  = require('mysql');
var bodyParser = require('body-parser');
router.set('view engine', 'ejs');
router.use(express.static('./views'));
router.get('/storeInfo',function(req,res){
res.render('storeInfo');});

router.locals.pretty = true;
router.use(bodyParser.urlencoded({extended:false}))
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
router.post('/insertInfo',function(req, res){

        var address1=req.body.address1;
        var address2=req.body.address2;
        var address3=req.body.address3;
        var tel =req.body.tel;
        var time=req.body.tel;
        var id = lha;
var sql = 'INSERT INTO store_info(owner_id,address1,address2,address3,tel,time)VALUES(?,?,?,?,?,?) '

;

connection.query(sql,[id,address1,address2,address3,tel,time], function(err, result, fields) {
  if (err) {
        console.log(err);
        res.status(500);
      } else { 
            res.redirect('/storeLogin');
          }});});












router.listen(3000, function(){
console.log('connect 3000  port');});
                                  
