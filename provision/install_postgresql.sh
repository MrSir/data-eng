#!/bin/bash

sudo apt-get -y install postgresql postgresql-contrib

sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/*/main/postgresql.conf
sudo sed -i "s/local   all             postgres                                peer/local   all             postgres                                trust/" /etc/postgresql/*/main/pg_hba.conf
sudo service postgresql restart

sudo psql -U postgres -c "CREATE DATABASE data_warehouse"
sudo psql -U postgres -c "CREATE DATABASE data_science"

sudo psql -U postgres -c "CREATE DATABASE airflow"
sudo psql -U postgres -c "CREATE ROLE ubuntu"
sudo psql -U postgres -c "GRANT ALL PRIVILEGES on database airflow to ubuntu"
sudo psql -U postgres -c "ALTER ROLE ubuntu SUPERUSER"
sudo psql -U postgres -c "ALTER ROLE ubuntu CREATEDB"
sudo psql -U postgres -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to ubuntu"

sudo psql -U postgres -c "ALTER USER postgres PASSWORD 'Test1234'"

sudo sed -i "s/local   all             postgres                                trust/local   all             postgres                                md5/" /etc/postgresql/*/main/pg_hba.conf
sudo sed -i "s/host    all             all             127.0.0.1\/32            md5/host    all             all             0.0.0.0\/0            md5/" /etc/postgresql/*/main/pg_hba.conf
sudo service postgresql restart