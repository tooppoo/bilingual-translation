
.PHONY: init
.PHONY: local
.PHONY: build
.PHONY: test

init:
	bundle install
	yarn --cwd client install

local:
	./bin/spring rails server

build:
	yarn --cwd client generate \
		--target static \
		--devtools

test:
	bundle exec rspec
	yarn --cwd client test
