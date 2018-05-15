var express = require('express');
var router = express();
var http=require('http');
router.set('view engine', 'ejs');
router.use(express.static('./views'));
router.get('/reviewList',function(req,res){
res.render('reviewList');});

router.set('port',process.env.PORT||3000);
http.createServer(router).listen(router.get('port'),function(){
console.log('connect 3000: ' +router.get('port'));
});
//router.listen(3000, function(){
//console.log('connect 80 port');});
                                  
