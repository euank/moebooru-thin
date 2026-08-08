FROM node:22-bookworm-slim AS node

FROM ruby:3.4-bookworm

COPY --from=node /usr/local/ /usr/local/

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
      build-essential \
      ffmpeg \
      git \
      imagemagick \
      jhead \
      libmagic-dev \
      libpq-dev \
      libvips-dev \
      postgresql-client \
      rsync && \
    rm -rf /var/lib/apt/lists/*

COPY . /moebooru
WORKDIR /moebooru
ENV RAILS_ENV=production \
    BUNDLE_WITHOUT=development:test

RUN bundle install
RUN npm ci && npm run build
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

ENTRYPOINT ["/moebooru/docker-entrypoint"]
