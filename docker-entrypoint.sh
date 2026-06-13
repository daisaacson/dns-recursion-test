#!/bin/bash
set -eo pipefail

cat > /etc/named.conf <<EOF
$CONF
EOF

exec "$@"
