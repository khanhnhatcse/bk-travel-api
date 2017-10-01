var express = require('express');
var router = express.Router();
var con = require('../controllers/tour_controller');
/* GET users listing. */
router.get('/', con.gets);
router.post('/run', con.run);
router.get('/tour_share', con.tour_share);

module.exports = router;
