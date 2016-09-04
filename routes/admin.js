var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  res.locals.session = req.session;
  if (req.session.adminId == 'admin') {
    res.render('admin/index');
  } else {
    res.redirect('/admin/login');
  }
  
});

/*로그인 뷰*/
router.get('/login', function(req, res, next) {
  res.render('admin/login');
});

/*로그인 처리*/
router.post('/login', function(req, res, next) {
  if (req.body.id == 'admin' && req.body.password == 'test') {
    req.session.adminId = req.body.id;
    res.redirect('/admin');
  } else {
    res.render('admin/login', {errorMsg:'잘못된 정보!!'});
  }
});

/*로그아웃*/
router.get('/logout', function(req, res, next) {
  req.session.destroy(function(err) {
    res.redirect('/admin/login');
  });
});



module.exports = router;
