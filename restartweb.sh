#!/bin/sh -x

service mysqld restart
service nginx  restart  || /usr/bin/nginx 
service redis stop
sleep 3
killall -9 uwsgi
/usr/local/bin/uwsgi /home/blog/config.ini -d /home/blog/uwsgi.log
killall -9 celery
sleep 3
service redis start
sleep 3
cd /home/blog
celery worker -A celery_worker.celery -l INFO &
