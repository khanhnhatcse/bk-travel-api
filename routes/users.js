var express = require('express');
var router = express.Router();
var db = require('../config/db_help.js');
var user_controller = require('../controllers/user_controller.js');
/* GET users listing. */
router.post('/', function(req, res, next) {
  var username = req.body.username;
  var password = req.body.password;
  res.json({username : username, password : password })
});

router.post('/login', user_controller.login);
router.post('/register', user_controller.resgister);
router.post('/forget', user_controller.forget_password)
router.post('/forget_password', user_controller.forget_now);
router.get('/forget/:id',user_controller.forget);
module.exports = router;
