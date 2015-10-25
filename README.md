# Docker for DITA Open Toolkit

Before you start, make sure your system has at least 2GB free memory available.

To bring up a vagrant dev box, run `vagrant up` - be patient, it could take up
to 15 minutes for it to download and provision everything.

Once started, check to make sure redisDB and mongoDB are both running, by using
`docker ps`.

If they are not running, check if the container already exists (happens when
restarting vagrant), by `docker ps --all`. If the container already exists, run
`docker start [container_name]` to start both databases.

MongoDB is used as the main database for the site.
RedisDB is used to back a message queue (Kue).

To start the web service, goto /vagrant/app/webapp, and run `grunt serve`.
To start the outputGenerator worker, goto /vagrant/app/outputGenerator, and run
`node app`.
