
.PHONY: init
.PHONY: local
.PHONY: test

init:
	bundle install

local:
	./bin/spring rails server

test:
	bundle exec rspec
