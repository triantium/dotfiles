#!/bin/bash
apt-get install postgresql-9.4

sudo -u postgres psql
\password postgres
-u
sudo -u postgres createdb -O postgres marketingTool
sudo -u postgres createdb -O postgres postgres
sudo -u postgres createdb -O postgres pim
