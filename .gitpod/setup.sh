#!/bin/bash
set -e

git config --global user.name "Matthew Hemingway"
git config --global user.email dpplrdr435@gmail.com
git config --global core.editor vim
git config --global core.autocrlf input

docker compose up -d
sleep 50

touch .env
echo "MONGO_URI=mongodb://localAdmin:mongolocal@localhost:27017/test" >> .env
