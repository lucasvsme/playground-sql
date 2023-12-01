#!/bin/sh

container_name="playground-sql"
container_image="postgres:alpine"

database_name="playground"
database_username="postgres"
database_password="postgres"

provision_database() {
  docker run --detach \
    --env POSTGRES_DB="$database_name" \
    --env POSTGRES_USER="$database_username" \
    --env POSTGRES_PASSWORD="$database_password" \
    --name="$container_name" \
    "$container_image"
}

destroy_database() {
  docker stop "$container_name"
  docker rm "$container_name"
}

enter_database() {
  docker exec --interactive --tty "$container_name" psql \
    --dbname="$database_name" \
    --username="$database_username"
}

run_single_sql_file() {
  sql_file="$1"

  docker exec --interactive "$container_name" psql \
    --variable ON_ERROR_STOP=1 \
    --dbname="$database_name" \
    --username="$database_username" <"$sql_file"
}

run_all_sql_files() {
  for sql_file in *.sql; do
    run_single_sql_file "$sql_file"
  done
}

case "$1" in
up) provision_database ;;
down) destroy_database ;;
enter) enter_database ;;
run)
  if [ "$2" = "" ]; then
    run_all_sql_files
  else
    run_single_sql_file "$2"
  fi
  ;;
esac
