FROM ruby:2.4

RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/backports.list

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y gcc g++ imagemagick jhead libxslt-dev libyaml-dev git libssl-dev \
    libpq-dev libreadline-dev libmagic-dev \
    gnash-tools \
    postgresql-client \
    rsync

COPY . /moebooru
WORKDIR /moebooru
ENV RAILS_ENVIRONMENT=production
RUN bundle install
ENTRYPOINT ["/moebooru/docker-entrypoint"]
