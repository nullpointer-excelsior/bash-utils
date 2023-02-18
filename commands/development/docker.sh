#!/bin/bash

#document root de docker (carpetas de docker)
docker info | grep -i root  
#ver opciones del comando docker
docker COMANDO --help
docker COMANDO COMMAND
#ver opciones mas avanzada del comando 
docker COMANDO OPCION --help 
docker network create --help
#descargar imagen
docker pull IMAGEN_NAME:TAG
#listar imagenes 
docker images 
#crear imagen
docker build -t NOMBRE_IMAGEN .
#crear imagen desde un dockerfile con otro nombre
docker build -t -f /file-dokerfile NOMBRE_IMAGEN .
# ver capas creadas de docker (capas = como se creo la imagen comandos)
docker history -H NOMBRE_IMAGEN:TAG
#eliminar imagen
docker rmi IMAGEN_NAME_OR_ID
# filtrar imagenes no referneciadas
docker images -f dangling=true
# eliminar imagenes no referenciadas
docker images -f dangling=true -q | xargs docker rmi

#crear contenedor
docker run -d -p HOST_PUERTO:CONTAINER_PUERTO --name NOMBRE_CONTENDOR NOMBRE_IMAGEN:TAG 
#crear contenedor con limite de memoria
docker run -d -m "10mb" NOMBRE_IMAGEN
#crear contenedor y que se destruya automaticamente al salir del contendor
docker run --rm -ti --name NOMBRE_CONTENDOR NOMBRE_IMAGEN:TAG 
#crear contenedor con volumenes compartidos entre maquina local y contenedor
docker run -d NOMBRE_CONTENDOR -p 3306:3306 -v RUTA_LOCAL:RUTA_CONTENEDOR

#eliminar contenedor
docker rm CONTAINER_NAME_OR_ID
#eliminar contenedores forzadaments
docker rm -f CONTAINER_NAME_OR_ID CONTAINER_NAME_OR_ID CONTAINER_NAME_OR_ID
#eliminar todos los contenedores
docker rm -fv $(docker ps -aq)

#ver logs de un contenedor
docker logs -f NOMBRE_CONTENDOR
#info a bajo nivel de un contenedor 
docker inspect NOMBRE_CONTENDOR

#ejecutar un comando dentro de un contenedor (imagen centos)
docker exec -ti NOMBRE_CONTENDOR COMANDO
#ingresar terminal con cierto usuario
docker exec -ti -u root NOMBRE_CONTENDOR bash

#copiar archvio desde docker hacia maquina local
docker cp NOMBRE_CONTENDOR:/opt/file /opt/my-machine/file

#copiar archvio desde maquina local hacia docker 
docker cp /opt/my-machine/file NOMBRE_CONTENDOR:/opt/file

#ver todos los contenedores corriendo
docker ps -a
#ver solo los id de los contenedores
docker ps -a -q
#ultimo contenedor creado
docker ps -l
#listar contenedores con estado creado
docker ps -f status=created
# ver procesos sin cortar los textos
docker ps --no-trunc
#ver recursos usados por un contenedor
docker stats

#guargdar contenedor a imagen
docker commit NOMBRE_CONTENDOR NOMBRE_IMAGEN

#sobrescibir el cmd de un container
docker run -d -p 8080:8080 centos python -m SimpleHTTPServer 8080 

#crear volumen nombrado
docker volume create NOMBRE_VOLUMEN
#eliminar container y usus volumenes anonimos asociados
docker rm -fv NOMBRE_CONTENDOR
#eliminar contenedores basados en un filtro status=created
docker rm $(docker ps -f status=created -q)
#buscar volumnes dangling
docker volume ls -f dangling=true
#eliminar volumenes dangling
docker volume ls -f dangling=true -q  | xargs docker volume rm

#ver redes docker
docker network ls  
#ping entre contenedores dentro desde una red definida por usuario
docker exec contenedor-centos bash -c "ping contenedor1"
#conectar un contenedor aun red
docker network connect RED_DOCKER NOMBRE_CONTENDOR
#desconectar un contenedor aun red
docker network disconnect RED_DOCKER NOMBRE_CONTENDOR

# 
docker save ID_CONTENEDOR
docker load ID_CONTENEDOR
docker top ID_CONTENEDOR
docker events ID_CONTENEDOR
docker diff ID_CONTENEDOR
docker history ID_CONTENEDOR
docker pause / unpause ID_CONTENEDOR
docker search -s 5 ID_CONTENEDOR
docker update ID_CONTENEDOR
docker wait ID_CONTENEDOR

#crear imagenes docker compose
docker-compose build
#crear contendores con docker compose
docker-compose up -d 
#detener y eliminar contenedores
docker-compose down
#crear conetendores con docker compose
docker-compose -f RUTA_ARCHIVO_COMPOSE up -d 
#crear contenedores con docker compose con nombre proyecto
docker-compose -p NOMBRE_PROYECTO -f RUTA_ARCHIVO_COMPOSE up -d 
# elimina contenedores y recusros asociados a contenedores detenidos
docker system prune -a