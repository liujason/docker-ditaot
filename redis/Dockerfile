FROM ubuntu:14.04

RUN apt-get update -y && \
    apt-get install -y wget build-essential supervisor curl && \
    mkdir -p /var/log/supervisor /data && \
    curl -SL http://download.redis.io/releases/redis-3.0.5.tar.gz \
    | tar -xzC /opt

RUN cd /opt/redis-3.0.5 && make

ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD redis.conf /opt/redis-3.0.5/redis.conf

EXPOSE 6379

CMD "/usr/bin/supervisord"
