/* Queue service using Kue */

var kue = require('kue');
var queue = kue.createQueue();
var fs = require('fs');
//Fixed invalid signature problem by using "unzip2" instead of "unzip"
var unzip = require('unzip2');
var Docker = require('dockerode');
var docker = new Docker({socketPath: '/var/run/docker.sock'});

queue.process('guest_output', function(job, done){
  console.log("Got a new job: ["+job.data.outputType+"] "+ JSON.stringify(job.data.file));
  //unzip to temp folder
  fs.createReadStream(job.data.file.path).pipe(unzip.Extract({path: job.data.file.path+'/'}))
    .on('close', function(){
      console.log('unzip done, starting docker.');
      // manual ot run: docker run -v /tmp/uploads/1bf393c00ce87108500d0b58c143cf7b:/tmp/ot/input:ro -v /tmp/uploads/1bf393c00ce87108500d0b58c143cf7b-out:/tmp/ot/output ot -i /tmp/ot/input/index.ditamap -o /tmp/ot/output -f html5
      // remove lingering ot containers: docker ps --all | grep ot | awk '{print $1}' | xargs docker rm
      docker.run(
        'ot',
        ['-i','/tmp/ot/input/index.ditamap',
        '-o','/tmp/ot/output',
        '-f','html5',
        '-v'],
        [process.stdout, process.stderr],
        {
          Tty:false,
          Binds:[
            job.data.file.path+':/tmp/ot/input:ro',
            job.data.file.path+'-out:/tmp/ot/output'
          ]
        },
        function(err, data, container){
          console.log("docker finished with statud code= "+data.StatusCode);
          container.remove(function(err, data){
            console.log(err);
            console.log(data);
          });
          done();
        }
      );
    })
    .on('error', function(err){
      console.log("unzip error: "+err);
    });

});
