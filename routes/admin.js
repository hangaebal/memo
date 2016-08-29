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

router.get('/login', function(req, res, next) {
  res.render('admin/login');
});

router.post('/login', function(req, res, next) {
  if (req.body.id == 'admin' && req.body.password == 'test') {
    req.session.adminId = req.body.id;
    res.redirect('/admin');
  } else {
    res.render('admin/login', {errorMsg:'잘못된 정보!!'});
  }
});

module.exports = router;
