#!/bin/bash
if [ -z ${GOOGLE_CREDENTIALS+x} ]; then echo $GOOGLE_CREDENTIALS > $GOOGLE_APPLICATION_CREDENTIALS; fi
label-studio --host ${HOST:-""} --port ${PORT} --username ${USERNAME} --password ${PASSWORD}
