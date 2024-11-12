#!/bin/bash
echo "Parando contenedor de Nginx"
docker-compose -f docker-compose-nginx.yaml -p nginx  down
echo "Parando contenedor de Apache"
docker-compose -f docker-compose-apache.yaml -p apache down
echo "Parando contenedor con información"
docker-compose -f docker-compose-container-info.yaml -p echo down
