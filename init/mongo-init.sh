#!/bin/bash
set -e

# Create db and collection
mongosh -u localAdmin \
        -p mongolocal \
        --eval "use mernauth" \
        --eval "db.createCollection('app_users')"

# Create users
mongosh -u localAdmin \
        -p mongolocal \
        --eval "use admin" \
        --eval "db.createUser({ user: 'mernauthapp', pwd: 'mernauthpass', roles: [{ role: 'readWrite', db: 'mernauth' }] })"