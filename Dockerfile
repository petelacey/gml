FROM elixir:latest

RUN apt-get update \
    && apt-get install -y postgresql-client \
    && apt-get clean

# ENV PHOENIX_VERSION 1.2.1

# install the Phoenix Mix archive
# 1.3-rc2
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez \
    && mix local.hex --force \
    && mix local.rebar --force

# install Node.js (>= 6.0.0) and NPM in order to satisfy brunch.io dependencies
# See http://www.phoenixframework.org/docs/installation#section-node-js-5-0-0-
# TODO:  We may want to move this outside this image someday
RUN curl -v -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

WORKDIR /app
