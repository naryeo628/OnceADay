var express =require('express');
var router = express();
router.set('view engine', 'ejs');
router.use(express.static('./views'));
router.get('/storeRegister',function(req,res){
res.render('storeRegister');});
router.listen(3000, function(){
console.log('connect 3000 port');});
                                  
