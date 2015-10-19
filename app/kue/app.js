/* Queue service using Kue */

/* So far, this is testing only. */

var kue = require('kue');
var jobs = kue.createQueue();

function newJob(){
  var job = jobs.create ('new_job', {
    name: 'Job Name'
  });

  job.on('enqueue', function(){
    console.log('Job', job.id, 'is enqueued.');
  }).on('complete', function(){
    console.log('Job', job.id, 'is done.');
  }).on('failed', function(){
    console.log('Job', job.id, 'is failed.');
  });

  job.save();
}

jobs.process('new_job', function(job, done){
  setTimeout(console.log("Processed"), 1000);
  console.log('Job', job.id, job.data.name, 'is done');
  done();
});

setInterval(newJob, 3000);
