#!/bin/sh
default="--conf /caddy/Caddyfile --log stdout -agree"
args=${RUN_ARGS:-$default}

if [ ! -f /caddy/Caddyfile ]; then
  echo "Creating default Caddyfile..."
  cp /opt/assets/Caddyfile /caddy/Caddyfile
fi

if [ ! -f /var/www/index.html ] && [ ! -f /.index_created ]; then
  echo "Creating default index.html..."
  cp /opt/assets/index.html /var/www/
  touch /.index_created
fi

echo "Executing: /usr/local/bin/caddy $args"
/usr/local/bin/caddy $args
