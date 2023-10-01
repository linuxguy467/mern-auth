#!/bin/bash
set -e

#Configure Git
git config --global user.name "Matthew Hemingway"
git config --global user.email dpplrdr435@gmail.com
git config --global core.editor vim
git config --global core.autocrlf input

docker compose up -d -f ./docker-compose.yml
sleep 70

# Backend environments
cp .env.example .env
sed -Ei 's/NODE_ENV=.*/NODE_ENV=development/' .env
sed -Ei 's/PORT=.*/PORT=5000/' .env
sed -Ei 's/MONGO_URI=.*/MONGO_URI=mongodb:\/\/mernauthapp:mernauthpass@localhost:27017\/\?authSource=admin\&readPreference=primary\&ssl=false\&directConnection=true/' .env
sed -Ei 's/JWT_SECRET=.*/JWT_SECRET=abc123/' .env

# Frontend environments
cd frontend/
cp .env.example .env
sed -Ei 's/VITE_ENV=.*/VITE_ENV=development/' .env
