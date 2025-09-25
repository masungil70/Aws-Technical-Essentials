#!/bin/bash -ex
yum -y install python3 mariadb105
pip3 install -r requirements.txt
yum -y install stress
export PHOTOS_BUCKET=${SUB_PHOTOS_BUCKET}
export DATABASE_HOST=${SUB_DATABASE_HOST}
export DATABASE_USER=${SUB_DATABASE_USER}
export DATABASE_PASSWORD=${SUB_DATABASE_PASSWORD}
export DATABASE_DB_NAME=employees
export AWS_DEFAULT_REGION=ap-northeast-2
cat database_create_tables.sql | \
mysql -h $$DATABASE_HOST -u $$DATABASE_USER -p$$DATABASE_PASSWORD
FLASK_APP=application.py /usr/local/bin/flask run --host=0.0.0.0 --port=80

