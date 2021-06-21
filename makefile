
.PHONY: init
.PHONY: local
.PHONY: build
.PHONY: test
.PHONY: test_server
.PHONY: test_client

init:
	bundle install
	yarn --cwd client install

local:
	./bin/spring rails server

build:
	yarn --cwd client generate \
		--target static \
		--devtools

test: test_server test_client

test_server:
	bundle exec rspec
test_client:
	yarn --cwd client test
