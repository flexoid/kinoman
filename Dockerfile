FROM ubuntu:14.04
MAINTAINER Egor Lynko <flexoid@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  apt-add-repository ppa:brightbox/ruby-ng && \
  apt-get update && \
  apt-get install -y \
    build-essential \
    git \
    imagemagick \
    libpq-dev \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    ruby2.0 \
    ruby2.0-dev \
    wget \
    zlib1g-dev

RUN wget https://github.com/jwilder/dockerize/releases/download/v0.2.0/dockerize-linux-amd64-v0.2.0.tar.gz
RUN tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.2.0.tar.gz

ENV APP_HOME /kinoman
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler

COPY Gemfile* $APP_HOME/
RUN bundle install

VOLUME $APP_HOME/public/system

EXPOSE 3000

CMD ["rails", "s"]
