#
# This is a _good enough_ Dockerfile
#
# What we want ultimately is to use Distillery and make the final image as small as possible.
# This one leaves behind the source and node.  Also, it builds from exlixir:latest which uses
# Debian Jessie (not slim) and drags in a lot of build tools.
#

FROM elixir:1.4

RUN apt-get update \
    && apt-get install -y postgresql-client \
    && apt-get install -y netcat \
    && apt-get install -y dnsutils \
    && apt-get clean

# 1.3-rc2
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app
ADD . .

RUN MIX_ENV=prod mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get

WORKDIR /app/assets
RUN NODE_ENV=production npm install --prefix /app/assets \
    && node_modules/brunch/bin/brunch build --production

WORKDIR /app
RUN MIX_ENV=prod mix phx.digest \
    && mix compile

ENV PORT 5000
EXPOSE 5000

CMD MIX_ENV=prod mix phx.server  
