#!/bin/bash

service mysqld restart
service nginx  restart || nginx -s reload
service redis stop
sleep 3
service redis start
killall -9 uwsgi
cd /home/blog
celery worker -A celery_worker.celery -l INFO &
uwsgi /home/blog/config.ini 
