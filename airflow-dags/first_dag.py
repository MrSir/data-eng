from datetime import timedelta
from airflow import DAG
from airflow.utils.dates import days_ago

dag = DAG(
    dag_id='my_test',
    default_args={"owner": "admin"},
    schedule_interval='0 0 * * *',
    start_date=days_ago(2),
    dagrun_timeout=timedelta(minutes=60),
)
