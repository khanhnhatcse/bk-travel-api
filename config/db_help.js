// const DB_HOST = "localhost";
// const DB_USER = "bktravel";
// const DB_PASS = "123456";
// const DB_NAME = "test";

const DB_HOST = "mysql://mysql:3306/";
const DB_USER = "bktravel";
const DB_PASS = "123456";
const DB_NAME = "test";

// Username: bktravel
// Password: 123456
// Database Name: test
// Connection URL: mysql://mysql:3306/

var HOST = 'http://192.168.1.8:3000';

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : DB_HOST,
  user     : DB_USER,
  password : DB_PASS,
  database : DB_NAME
});

connection.connect(function(err){
  if(!err) {
      console.log("Database is connected ... nn");
  } else {
      console.log("Error connecting database ... nn" + err);
  }
});


module.exports = connection
