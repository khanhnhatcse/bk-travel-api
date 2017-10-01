var express = require('express');
var router = express.Router();
var con = require('../controllers/SN_controller.js');

/* GET users listing. */
router.get('/', con.get_all_newfeed);

router.post('/post',con.add_newfeed);

router.get('/comment', con.get_comments);

router.post('/search', con.search);

module.exports = router;
