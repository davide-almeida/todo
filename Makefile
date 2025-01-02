CONTAINER_NAME ?= web

setup:
	docker compose build
	docker compose run --rm $(CONTAINER_NAME) rm -f tmp/pids/server.pid
	docker compose run --rm $(CONTAINER_NAME) bundle install
	docker compose run --rm $(CONTAINER_NAME) yarn install
	docker compose run --rm $(CONTAINER_NAME) bundle exec bin/setup

run:
	docker compose up

down:
	docker compose down

shell:
	@docker exec -it $(CONTAINER_NAME) \
	sh -c "/bin/bash || /bin/sh"

attach:
	@docker attach $(CONTAINER_NAME)

clean:
	@docker compose down
	@rm -rf tmp/* || sudo rm -rf tmp/*
	@mkdir -p tmp/pids && touch tmp/pids/.keep