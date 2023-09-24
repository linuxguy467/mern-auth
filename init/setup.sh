#!/bin/bash
set -e

#Configure Git
git config --global user.name "Matthew Hemingway"
git config --global user.email dpplrdr435@gmail.com
git config --global core.editor vim
git config --global core.autocrlf input

docker compose up -d
sleep 70

cp .env.example .env
sed -Ei 's/NODE_ENV=.*/NODE_ENV=development/' .env
sed -Ei 's/PORT=.*/PORT=5001/' .env
sed -Ei 's/MONGO_URI=.*/MONGO_URI=mongodb:\/\/mernauthapp:mernauthpass@localhost:27017\/\?authSource=admin\&readPreference=primary\&ssl=false\&directConnection=true/' .env
