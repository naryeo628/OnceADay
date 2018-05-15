var express =require('express');
var router = express();
var mysql=require('mysql');

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

router.get('/followstore',function(req,res){

	const sql='select * from follow';
	connection.query(sql,function(err,results,field){
		console.log(results);
		res.render('followStore', {follow: results});
	});

});

module.exports=router;
router.listen(80, function(){
console.log('connect 80 port');
});


