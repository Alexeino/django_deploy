#!/bin/bash

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for Postgresql"

    while ! nc -z $DB_HOST $DB_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL Started"
fi
# confirm current directory
pwd
# Flush all data inside database 
python src/manage.py flush --no-input

python src/manage.py migrate

# Loading fixtures
python src/manage.py loaddata src/fixtures/*.json


exec "$@"