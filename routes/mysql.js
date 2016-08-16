var express = require('express');
var router = express.Router();


var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'memo',
  password : '1234',
  database : 'memo'
});


router.get('/', function(req, res, next) {

  var result = 'MySQL SYSDATE() : ';
  connection.query('SELECT SYSDATE() AS sysdate', function(err, rows, fields) {
    if (err) throw err;
    result += rows[0].sysdate;
    console.log(result);

    res.send(result);
  });


});


module.exports = router;
