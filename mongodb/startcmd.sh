#!/bin/bash
chown -R mongo /data/db
touch /var/log/mongo.log
chown mongo /var/log/mongo.log
exec "/usr/bin/supervisord"
