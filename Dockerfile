FROM ruby:2.7.5-alpine3.15 AS GEMS
RUN apk add build-base=~0.5 postgresql14-dev=~14.2
COPY . /app
WORKDIR /app
RUN bundler install

FROM ruby:2.7.5-alpine3.15
RUN apk add --update --no-cache libpq=~14.2
COPY --from=GEMS /usr/local/bundle /usr/local/bundle
COPY . /app
WORKDIR /app
