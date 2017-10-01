var db = require('../config/db_help.js');
var Log =require('./log.js');
exports.get = (query, params) => {
  return new Promise((resolve, reject) => {
    db.query(query,params, function(err, result, field) {

      if(err) reject(err);
      else resolve(result);
    });
  });
}
