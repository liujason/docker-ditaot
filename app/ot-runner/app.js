var kue = require('kue');
var jobs = kue.createQueue();

jobs.process('new_job', function(job, done){
  console.log("Got new_job, processing");
  setTimeout(function(){
    console.log('Job', job.id, job.data.name, 'is done');
    done();
  }, 5000);
});
