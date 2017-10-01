var express = require('express');
var router = express.Router();
var controller = require('../controllers/plan_controller.js');

/* GET users listing. */
router.post('/', controller.create);
router.get('/',controller.gets);
module.exports = router;
