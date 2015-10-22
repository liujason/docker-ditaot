# DITA OT runner

ot-runner monitors job queue (using kue) for pending jobs, consumes a job, runs
ot in docker, reports progress, and final status back through status queue. 
