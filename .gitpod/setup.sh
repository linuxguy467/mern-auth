#!/bin/bash
set -e

echo "setup.sh started"

WORKSPACE_PATH="/workspace/mern-auth"

#Configure Git
echo "Configuring Git..."
git config --global user.name "Matthew Hemingway"
git config --global user.email dpplrdr435@gmail.com
git config --global core.editor vim
git config --global core.autocrlf input

echo "Setting up MongoDB..."
cd $WORKSPACE_PATH/.gitpod/
docker compose up -d

echo "Waiting for MongoDB to start up..."
sleep 70

# Backend environments
echo "Setting up Backend environments..."
cd $WORKSPACE_PATH/
cp .env.example .env
sed -Ei 's/NODE_ENV=.*/NODE_ENV=development/' .env
sed -Ei 's/PORT=.*/PORT=5000/' .env
sed -Ei 's/MONGO_URI=.*/MONGO_URI=mongodb:\/\/mernauthapp:mernauthpass@localhost:27017\/\mernauth?authSource=admin\&readPreference=primary\&ssl=false\&directConnection=true/' .env
sed -Ei 's/JWT_SECRET=.*/JWT_SECRET=abc123/' .env

# Frontend environments
echo "Setting up Frontend environments..."
cd $WORKSPACE_PATH/frontend/
cp .env.example .env
sed -Ei 's/VITE_ENV=.*/VITE_ENV=development/' .env

echo "setup.sh complete"
