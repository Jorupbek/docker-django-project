#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

echo "Migrating the database before starting the server"
python manage.py migrate
/usr/local/bin/gunicorn test_project.wsgi --bind 0.0.0.0:8000 --chdir=/app