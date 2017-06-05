FROM elixir:latest

RUN apt-get update \
    && apt-get install -y postgresql-client \
    && apt-get clean

# ENV PHOENIX_VERSION 1.2.1

# install the Phoenix Mix archive
# 1.3-rc2
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
