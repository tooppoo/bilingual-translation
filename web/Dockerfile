FROM ruby:3.2.0@sha256:98e340a1e5a9a61ee0c30e464a058da093ab8179460ed096a2a763a3abaa6c47 as server-builder

WORKDIR /web

COPY . .

RUN bundle install

CMD ["bin/rails", "server", "-p", "3001", "-b", "0.0.0.0"]
