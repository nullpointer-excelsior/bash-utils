#!/bin/bash

python_version="$1"

# ejecutar el script with source init-python-env.sh
virtualenv -p "python$python_version" venv; source venv/bin/activate;