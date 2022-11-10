#!/usr/bin/with-contenv bashio

echo "Hello world!"

CONFIG_PATH=/data/options.json
USE_REPO="$(bashio::config 'use_repository')"
REPO="$(bashio::config 'repository')"

if [ $USE_REPO == true ]
then
  echo "Going to download repo"
  git init || echo "Already initiatilized"
  git remote add origin $REPO || echo "Remote already set"
  git pull origin main
else
  echo "Skipping repo downlaod"
fi

#python3 -m http.server 80
echo "Starting nginx PHP server on port 80"
#php -S 0.0.0.0:80

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
