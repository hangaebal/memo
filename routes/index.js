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

/* GET home page. */
router.get('/', function(req, res, next) {

  var mainMenuSql = 'SELECT id, name FROM menu ' + 
    'WHERE parent_id = 0 AND disable_yn = "n" AND del_yn = "n" ' + 
    'ORDER BY seq ';
  var subMenuSql = 'SELECT id, parent_id, name, shortcut, url, line_yn FROM menu ' + 
      'WHERE parent_id != 0 AND disable_yn = "n" AND del_yn = "n" ' +
      'ORDER BY parent_id, seq ';
  connection.query(mainMenuSql + ';' + subMenuSql, function(err, results, fields) {
    if (err) throw err;

    console.log(results);
    console.log(fields);

    //res.send({mainMenus: results[0], subMenus: results[1]})
    res.render('index', {mainMenus: results[0], subMenus: results[1]})
  });
  

});

module.exports = router;
