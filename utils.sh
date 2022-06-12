# Check memory
docker run --rm "debian:bullseye-slim" bash -c 'numfmt --to iec $(echo $(($(getconf _PHYS_PAGES) * $(getconf PAGE_SIZE))))'

# Download and setup Airflow 2.3 with python 3.9
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.2/docker-compose.yaml'
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.2/airflow.sh'
chmod +x airflow.sh

mkdir -p ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)" > .env

# Deploy airflow
docker-compose up airflow-init
docker-compose up
