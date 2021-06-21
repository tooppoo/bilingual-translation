
.PHONY: init
.PHONY: init_client
.PHONY: init_server
init: init_server init_client
init_server:
	bundle install
init_client:
	yarn --cwd client install

.PHONY: local
local:
	./bin/spring rails server

.PHONY: build
build:
	yarn --cwd client generate \
		--target static \
		--devtools

.PHONY: test
.PHONY: test_server
.PHONY: test_client
test: test_server test_client
test_server:
	bundle exec rspec
test_client:
	yarn --cwd client test
