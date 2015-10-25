'use strict';

var kue = require('kue');
var queue = kue.createQueue();


exports.upload = function(req, res){
  var job = queue.create('guest_output', {
    file:req.file,
    outputType: req.body.outputType
  })
  .ttl(600000) //if job doesn't finish in 10 minutes, kill it.
  .save(function(err){
    if(err){
      console.log(err);
    }else{
      console.log(job.id);
    }
  });

  job.on('complete', function(result){
    console.log('job complete. ', result);
  }).on('progress', function(progress, data){
    console.log(job.id + ' '+ progress+' %. '+data);
  }).on('failed', function(err){
    console.log(err);
  });

  res.status(200).json("{status:ok}");
};
