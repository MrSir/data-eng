#!/bin/bash

sudo apt-get update

# basic tools
sudo apt-get -y install vim curl

# install git
sudo apt-get -y install git

# install python
sudo apt-get -y install python3-pip
sudo pip3 install --upgrade pip

# install postgresql
/var/www/provision/install_postgresql.sh

# install & config Apache Airflow
/var/www/provision/install_airflow.sh
/var/www/provision/config_airflow.sh

sudo apt-get autoclean
sudo apt-get -y autoremove

# print versions
python3 -V
airflow version
