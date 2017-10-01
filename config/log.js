

exports.d = function(tag, msg) {
  console.log(tag.toString().toUpperCase() + ":" + JSON.stringify(msg));

}

exports.e = function(tag, msg) {
  console.error(tag.toString().toUpperCase() + ":" + JSON.stringify(msg));

}
