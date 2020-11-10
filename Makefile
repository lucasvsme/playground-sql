CONTAINER_NAME = "playground-sql"

POSTGRES_DATABASE = "playground"
POSTGRES_USERNAME = "postgres"
POSTGRES_PASSWORD = "postgres"

up:
	@docker run --detach \
			--env POSTGRES_DB=$(POSTGRES_DATABASE) \
			--env POSTGRES_USER=$(POSTGRES_USERNAME) \
			--env POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
			--name=$(CONTAINER_NAME) \
			postgres:alpine

down:
	@docker stop $(CONTAINER_NAME)
	@docker rm $(CONTAINER_NAME)

enter:
	@docker exec --interactive $(CONTAINER_NAME) psql \
			--dbname=$(POSTGRES_DATABASE) \
			--username=$(POSTGRES_USERNAME)

run:
	@cat $(script) | docker exec --interactive $(CONTAINER_NAME) psql \
			--variable ON_ERROR_STOP=1 \
			--dbname=$(POSTGRES_DATABASE) \
			--username=$(POSTGRES_USERNAME)

TESTS = simple-crud json-column-type index-unique-btree
TEST_FILES = $(addsuffix .sql, $(TESTS))

run-all:
	@set -e ; for test_file in $(TEST_FILES); do \
			cat $$test_file | docker exec --interactive $(CONTAINER_NAME) psql \
			--variable ON_ERROR_STOP=1 \
			--dbname=$(POSTGRES_DATABASE) \
			--username=$(POSTGRES_USERNAME) ; \
	done
