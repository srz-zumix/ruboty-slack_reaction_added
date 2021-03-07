FROM ruby:2.7.2-alpine

RUN apk update && apk upgrade \
  && apk add --no-cache -q -f git build-base openssl tzdata

WORKDIR /usr/src/ruboty

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["./run.sh"]
