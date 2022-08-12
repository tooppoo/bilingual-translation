FROM ruby:3.0.1 as server-builder

WORKDIR /web

COPY . .

RUN bundle install

CMD ["bin/rails", "server", "-p", "3001", "-b", "0.0.0.0"]
