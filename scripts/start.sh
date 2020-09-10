#!/bin/bash

## Check if a .env needs to be created.
touch .env

if [[ "$APP_ENV_SET" != "" ]] ; then   
    echo  'APP_ENV='$APP_ENV_SET >> .env
fi

chown root:www-data .env.local

# Application roles
set -e
role=${CONTAINER_ROLE:-app}

if [ "$role" = "app" ]; then

    echo "Start application"
    exec /usr/bin/supervisord -n

elif [ "$role" = "testing" ]; then

    echo "Start testing..."
    exec 1;
   
else
    echo "Could not match the container role \"$role\""
    exit 1
fi