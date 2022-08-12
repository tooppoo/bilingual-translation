
.PHONY: init
.PHONY: init_client
.PHONY: init_server
init: init_server init_client
init_server:
	docker compose build web
	docker compose run --rm --no-deps web bundle install
init_client:
	docker compose build client
	docker compose run --rm client yarn install --frozen-lockfile

.PHONY: test
.PHONY: test_server
.PHONY: test_client
test: test_server test_client
test_server:
	docker compose run --rm --no-deps web bundle exec rspec
test_client:
	docker compose run --rm client yarn test
