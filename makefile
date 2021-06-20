
.PHONY: init
.PHONY: local
.PHONY: test

init:
	bundle install

local:
	./bin/sprint rails server

test:
	bundle exec rspec
