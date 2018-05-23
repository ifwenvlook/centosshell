#!/bin/bash

service mysqld stop
service redis stop
<<<<<<< HEAD
service nginx stop || nginx -s stop
=======
service nginx stop
>>>>>>> 69af27780aba1a18f2881451aa1b250985d5c8b6
killall -9 uwsgi
killall -9 celery
