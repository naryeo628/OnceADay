var express = require('express');
var router = express();
router.set('view engine', 'ejs');
router.use(express.static('./views'));
router.get('/',function(req,res){
res.render('changeInfo');});

router.listen(80, function(){
console.log('connect 80 port');});

                                      
