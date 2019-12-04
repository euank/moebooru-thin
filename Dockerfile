FROM ruby:2.6-buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y gcc g++ jhead libxslt-dev libyaml-dev git libssl-dev \
    libpq-dev libreadline-dev libmagic-dev \
    postgresql-client \
    rsync \
    ffmpeg \
    libvips-dev

COPY . /moebooru
WORKDIR /moebooru
ENV RAILS_ENVIRONMENT=production
RUN bundle install
ENTRYPOINT ["/moebooru/docker-entrypoint"]
