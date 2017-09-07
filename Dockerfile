FROM elixir:1.4.5 as mix-getter

ENV HOME=/app
ENV MIX_ENV=prod

RUN mix do local.hex --force, local.rebar --force

# Cache elixir deps
COPY config/ $HOME/config/
COPY mix.exs mix.lock $HOME/

WORKDIR $HOME
RUN mix deps.get

########################################################################
FROM node:6 as asset-builder

ENV HOME=/app
WORKDIR $HOME

COPY --from=mix-getter $HOME/deps $HOME/deps

WORKDIR $HOME/assets
COPY assets/ ./
RUN yarn install
RUN ./node_modules/brunch/bin/brunch build --production

########################################################################
FROM bitwalker/alpine-elixir:1.4.5 as releaser

ENV HOME=/app
ENV MIX_ENV=prod

ARG ERLANG_COOKIE
ENV ERLANG_COOKIE $ERLANG_COOKIE

# dependencies for comeonin
RUN apk add --no-cache build-base cmake

# Install Hex + Rebar
RUN mix do local.hex --force, local.rebar --force

# Cache elixir deps
WORKDIR $HOME
COPY config/ $HOME/config/
COPY mix.exs mix.lock $HOME/
RUN mix do deps.get --only $MIX_ENV, deps.compile

COPY . $HOME/

# Digest precompiled assets
COPY --from=asset-builder $HOME/apps/myproject_web/priv/static/ $HOME/apps/myproject_web/priv/static/

WORKDIR $HOME/apps/myproject_web
RUN mix phx.digest

# Uses Distillery to generate an object binary (in a tar.gz) containing erlang and our elixir app
WORKDIR $HOME
RUN mix release --env=$MIX_ENV --verbose

########################################################################
FROM alpine:3.6

ENV LANG=en_US.UTF-8 \
    HOME=/app/ \
    TERM=xterm

ENV GML_VERSION=0.1.0

RUN apk add --no-cache ncurses-libs openssl

EXPOSE 5000
ENV PORT=5000 \
    MIX_ENV=prod \
    REPLACE_OS_VARS=true \
    SHELL=/bin/sh

COPY --from=releaser $HOME/_build/prod/rel/gml/releases/$GML_VERSION/gml.tar.gz $HOME
WORKDIR $HOME
RUN tar -xzf gml.tar.gz

ENTRYPOINT ["/app/bin/gml"]
CMD ["foreground"]
