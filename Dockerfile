FROM ruby:latest

RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client && \
    apt-get clean

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app
EXPOSE 3000
CMD ["/app/entrypoint.sh"]
