#!/bin/bash

apt-get update

# basic tools
apt-get -y install vim curl

# install git
apt-get -y install git

# install python
apt-get -y install python3-pip
pip3 install --upgrade pip

# install airflow
bash /var/www/provision/install_airflow.sh

apt-get autoclean
apt-get -y autoremove

# print versions
python3 -V
airflow versions
