var schedule = require('node-schedule');
var rule = new schedule.RecurrenceRule();
rule.minute = 22;

var j = schedule.scheduleJob(rule, function(){
  console.log('Test nao :))))');
});
