FROM ubuntu:14.04

RUN apt-get update -y && \
    apt-get install -y supervisor curl && \
    mkdir -p /var/log/supervisor /data/mongo /logs && \
    curl -SL https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.6.tgz \
    | tar -xzC /opt
RUN useradd -ms /bin/bash mongo
ADD mongo.conf.yaml /opt/mongodb-linux-x86_64-3.0.6/mongo.conf.yaml
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
EXPOSE 27017
# fix permission issue for data mount
# https://github.com/boot2docker/boot2docker/issues/581#issuecomment-114804894
USER mongo
RUN usermod -u 1000 mongo
CMD "/usr/bin/supervisord"
