
.PHONY: init
.PHONY: local
.PHONY: build
.PHONY: test

init:
	bundle install

local:
	./bin/spring rails server

build:
	yarn --cwd client generate --target static

test:
	bundle exec rspec
