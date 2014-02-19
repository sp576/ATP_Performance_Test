#!/bin/sh

# Copyright (C) 2011 by Blade Polska s.c.
# Full rights belong to Tomek Kopczuk (@tkopczuk).
# www.askthepony.com
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#pgBouncer configuration
#Modify the configuration file (or the sample configuration file available in etc/pgbouncer.ini of the source code copied over to /usr/local/etc/pgbouncer.ini):

#Modify the [databases] section to look like this (if your server is on your local machine on the default port):
#[databases]
#* = host=127.0.0.1 port=5432
#In [pgbouncer] section:
#Set the listening port for example to:
#listen_port = 6432
#Set the authorization file, if using PostgreSQL 8.x on default settings:
#auth_file = /var/lib/postgresql/<your postgres version, ie. 8.3>/main/global/pg_auth
#Set the log and pid files:
#logfile = /var/log/pgbouncer.log
#pidfile = /tmp/pgbouncer.pid
#You have to set the user pgBouncer will run as:
#user = postgres
#You can choose any user, as long as it’s not root. We will not dwell about security here.

#Run by executing:
#su -l postgres -c "pgbouncer -d /usr/local/etc/pgbouncer.ini"
#Modify the settings.py file, set the database port accordingly (in this example – 6432).
#Done. Let’s get it smoking:

apt-get install libevent-dev
cd /tmp
wget http://pgfoundry.org/frs/download.php/3085/pgbouncer-1.4.2.tgz
tar xzf pgbouncer-1.4.2.tgz 
cd pgbouncer-1.4.2
./configure --prefix=/usr/local
make
make install
mkdir -p /var/log/pgbouncer/
chown postgres /var/log/pgbouncer
