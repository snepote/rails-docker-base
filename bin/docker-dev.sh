#!/bin/bash
set -ex
cp config/docker-compose.development.yml docker-compose.override.yml
docker-compose stop && docker-compose up -d
