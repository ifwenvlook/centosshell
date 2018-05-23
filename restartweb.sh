<<<<<<< HEAD
#!/bin/sh -x

service mysqld restart
sleep 3
killall -9 nginx
sleep 3
service redis stop
sleep 3
killall -9 uwsgi
sleep 3
killall -9 celery
sleep 3
/usr/local/bin/uwsgi /home/blog/config.ini -d /home/blog/uwsgi.log
sleep 1
service redis start
sleep 1
/usr/bin/nginx
sleep 1
=======
#!/bin/bash

service mysqld restart
service nginx  restart
service redis stop
killall -9 uwsgi
uwsgi /home/blog/config.ini -d /home/log/uwsgi.log
killall -9 celery
sleep 3
service redis start
>>>>>>> 69af27780aba1a18f2881451aa1b250985d5c8b6
cd /home/blog
celery worker -A celery_worker.celery -l INFO &
