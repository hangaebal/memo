var express = require('express');
var router = express.Router();

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'memo',
  password : '1234',
  database : 'memo',
  multipleStatements: true
});

/*관리자 권한 처리*/
router.use('/*', function(req, res, next) {
  console.log(req.session.adminId);
  if (typeof req.session.adminId !== 'undefined') {
    res.locals.session = req.session;
    next();
  } else if (req.baseUrl == '/admin/login') {
    next();
  } else {
    res.redirect('/admin/login');
  }
});

/*관리자 메인 페이지*/
router.get('/', function(req, res, next) {
  res.render('admin/index');
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


/*메뉴 관리 뷰*/
router.get('/menu', function(req, res, next) {
  var mainMenuSql = "SELECT * " +
    "FROM menu menu " +
    "WHERE parent_id = 0 AND del_yn = 'n' " +
    "ORDER BY seq ";
  var subMenuSql = "SELECT * FROM menu " +
      "WHERE parent_id != 0 AND del_yn = 'n' " +
      "ORDER BY parent_id, seq ";
  connection.query(mainMenuSql + ';' + subMenuSql, function(err, results, fields) {
    if (err) throw err;

    //res.send({mainMenus: results[0], subMenus: results[1]})
    res.render('admin/menu', {mainMenus: results[0], subMenus: results[1]})
  });
});

/*메뉴 수정 처리*/
router.post('/menu', function(req, res, next) {
  var mainMenuObjList = [];
  req.body['main-id'].forEach(function(id,i){
    var mainmenuObj = new Object();
    //mainmenuObj.id = id;
    mainmenuObj.seq = req.body['main-seq'][i];
    mainmenuObj.name = req.body['main-name'][i];
    mainmenuObj.disable_yn = req.body['main-disable_yn'][i];
    mainMenuObjList.push(mainmenuObj);
    mainMenuObjList.push(id);
  });

  var subMenuObjList = [];
  req.body['id'].forEach(function(id,i){
    var submenuObj = new Object();
    //submenuObj.id = id;
    submenuObj.seq = req.body.seq[i];
    submenuObj.name = req.body.name[i];
    submenuObj.shortcut = req.body.shortcut[i];
    submenuObj.url = req.body.url[i];
    submenuObj.line_yn = req.body.line_yn[i];
    submenuObj.disable_yn = req.body.disable_yn[i];
    subMenuObjList.push(submenuObj);
    subMenuObjList.push(id);
  });

  console.log(mainMenuObjList);
  console.log(subMenuObjList);

  var updateSql = "UPDATE menu SET ? " +
  //"seq = ?, name = ?, disable_yn = ?" +
  "WHERE id = ?;";
  updateSql = updateSql.repeat(req.body['main-id'].length + req.body.id.length);

  var data = mainMenuObjList.concat(subMenuObjList);


  var query = connection.query(updateSql, data, function(err, results, fields) {
    if (err) throw err;
      res.redirect('/admin/menu');
  });
  console.log(query.sql);

});


/*메뉴 삭제 처리*/
router.post('/menu/delete', function(req, res, next) {
  var deleteSql = "UPDATE menu SET del_yn = 'y' WHERE id = ?";
  query = connection.query(deleteSql, req.body.id, function(err, results, fields) {
    if (err) throw err;
      res.redirect('/admin/menu');
  });
});

module.exports = router;
