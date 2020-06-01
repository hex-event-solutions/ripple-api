FROM ruby:2.7.1-alpine

RUN apk add --update \
  build-base \
  nodejs \
  tzdata \
  git \
  postgresql-dev \
  && rm -rf /var/cache/apk*

RUN gem update --system

RUN gem install bundler -v 2.1.4

WORKDIR /myapp

COPY Gemfile* /myapp/

RUN bundle install

COPY . /myapp/

CMD /bin/sh -c "rm -f /myapp/tmp/pids/server.pid && bundle install && ./bin/rails server"
