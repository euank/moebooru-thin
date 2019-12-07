FROM ruby:2.6-buster

# For build-dep vips
RUN echo 'deb-src http://deb.debian.org/debian buster main' >> /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y build-essential jhead libxslt-dev libyaml-dev git libssl-dev \
    libpq-dev libreadline-dev libmagic-dev \
    postgresql-client \
    rsync \
    ffmpeg

# Build libvips from source
RUN apt-get -y build-dep vips
RUN mkdir /build-vips
RUN vips_ver="8.8.4" && \
    cd /build-vips && \
    wget https://github.com/libvips/libvips/releases/download/v${vips_ver}/vips-${vips_ver}.tar.gz && \
    tar xf vips-${vips_ver}.tar.gz && \
    cd vips-${vips_ver} && \
    ./configure && make && make install && \
    cd / && rm -r /build-vips

COPY . /moebooru
WORKDIR /moebooru
ENV RAILS_ENVIRONMENT=production
RUN bundle install
ENTRYPOINT ["/moebooru/docker-entrypoint"]
