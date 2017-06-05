FROM phoenix:1.3-rc2

RUN mix local.hex --force \
    && mix local.rebar --force

# install Node.js (>= 6.0.0) and NPM in order to satisfy brunch.io dependencies
# See http://www.phoenixframework.org/docs/installation#section-node-js-5-0-0-
# TODO:  We may want to move this outside this image someday
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && apt-get clean 

WORKDIR /app
