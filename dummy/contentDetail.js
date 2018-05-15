var express =require('express');
var router = express();
var mysql=require('mysql');
var async = require('async');

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


router.set('view engine', 'ejs');
router.use(express.static('./views'));
          
router.get('/contentDetail',function(req,res){
          
        const sql='select * from content_list';
        connection.query(sql,function(err,results,field){
                console.log(results);
                res.render('contentDetail',{url:results[0].url, owner_id:results[0].owner_id, 
					    content: results[0].content, date:results[0].date});
        });
             
}); 
module.exports=router;
router.listen(3000, function(){
console.log('connect 3000 port');
});

