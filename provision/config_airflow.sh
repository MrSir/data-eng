#!/bin/bash

sudo sed -i "s/dags_folder = \/home\/vagrant\/airflow\/dags/dags_folder = \/var\/www\/airflow-dags/" /home/vagrant/airflow/airflow.cfg
sudo sed -i "s/sql_alchemy_conn = sqlite:\/\/\/\/home\/vagrant\/airflow\/airflow.db/sql_alchemy_conn = postgresql:\/\/postgres:Test1234@localhost:5432\/airflow/" /home/vagrant/airflow/airflow.cfg
sudo sed -i "s/load_examples = True/load_examples = False/" /home/vagrant/airflow/airflow.cfg

airflow db init

airflow users create \
    --username admin \
    --firstname Mitko \
    --lastname Tochev \
    --role Admin \
    --email mr.sir88@gmail.com \
    --password Admin1234

airflow webserver --port 8080 --daemon

airflow scheduler --daemon