#!/bin/bash
echo "Iniciando contenedor de Nginx"
docker-compose -f docker-compose-nginx.yaml -p nginx up -d 
echo "Iniciando contenedor de Apache"
docker-compose -f docker-compose-apache.yaml -p apache up -d 
echo "Iniciando contenedor con información interna"
docker-compose -f docker-compose-container-info.yaml -p echo up -d
