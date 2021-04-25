#!/bin/bash

sudo rm -Rf /usr/lib/python3/dist-packages/yaml
sudo rm -Rf /usr/lib/python3/dist-packages/PyYAML-*

sudo pip3 install paramiko

AIRFLOW_VERSION=2.0.1
PYTHON_VERSION="$(python3.6 --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
sudo pip3 install "apache-airflow[async,postgres,google,apache.spark,ssh]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
