#!/bin/bash
/usr/bin/pg_ctlcluster 9.1 main start
su postgres -c 'echo "select * from pg_user;" | psql postgres'
su postgres -c 'createuser --createdb --createrole --no-superuser redmine'
su postgres -c 'createdb --encoding=UTF8 --owner=redmine --template=template0 redmine' 
su postgres -c 'echo "select * from pg_user;" | psql redmine'
/usr/bin/pg_ctlcluster 9.1 main stop
