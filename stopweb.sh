#!/bin/bash

service mysqld stop
service redis stop
service nginx stop || nginx -s stop
killall -9 uwsgi
killall -9 celery
