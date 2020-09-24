FROM ruby:2.7.1

RUN apt update && apt install -y nodejs postgresql-client

RUN gem update --system

RUN gem install bundler -v 2.1.4

WORKDIR /myapp

COPY Gemfile* /myapp/

RUN bundle install

COPY . /myapp/

RUN chmod 700 /tmp

CMD /bin/sh -c "rm -f /myapp/tmp/pids/server.pid && bundle install && ./bin/rails server -p 3000 -b '0.0.0.0'"
