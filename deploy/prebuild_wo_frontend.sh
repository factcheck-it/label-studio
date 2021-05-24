#!/usr/bin/env bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "SCRIPT_DIR: ${SCRIPT_DIR}"
if [ -z ${GOOGLE_CREDENTIALS+x} ]
then
    echo "Writing Google credentials to file ${GOOGLE_APPLICATION_CREDENTIALS}..."
    echo $GOOGLE_CREDENTIALS > $GOOGLE_APPLICATION_CREDENTIALS; 
fi

MANAGE=${SCRIPT_DIR}/../label_studio/manage.py

echo "=> Collect static..."
python3 $MANAGE collectstatic --no-input

echo "=> Create version file..."
python3 ${SCRIPT_DIR}/../label_studio/core/version.py
