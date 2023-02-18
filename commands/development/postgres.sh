#!/bin/bash


# create postgres db with docker
cat <<EOF > $POSTGRES_DOCKERFILE
FROM library/postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password
COPY $INIT_SCRIPTFILE /docker-entrypoint-initdb.d/
EOF
docker build -t $CONTAINER_NAME -f $POSTGRES_DOCKERFILE .
docker run -d --name $CONTAINER_NAME -p 5432:5432 $CONTAINER_NAME


# restore db in docker container
cat $DUMP_FILE | docker exec -i $CONTAINER_NAME psql -U postgres $DB_NAME