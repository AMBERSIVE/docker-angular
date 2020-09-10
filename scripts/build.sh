#!/bin/bash

echo "Set permissions"

chown -R root:www-data /var/www/html

find /var/www/html -type f -exec chmod 664 {} \;
find /var/www/html -type d -exec chmod 775 {} \;


echo "Build application"

npm i 
npm run build