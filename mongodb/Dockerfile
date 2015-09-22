FROM ubuntu:14.04

RUN apt-get update -y && \
    apt-get install -y supervisor curl && \
    mkdir -p /var/log/supervisor /data /logs && \
    curl -SL https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1404-3.0.6.tgz \
    | tar -xzC /opt
ADD mongo.conf.yaml /opt/mongodb-linux-x86_64-ubuntu1404-3.0.6/mongo.conf.yaml
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
EXPOSE 27017
CMD "/usr/bin/supervisord"
