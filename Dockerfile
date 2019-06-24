FROM ruby:2.6.0

RUN mkdir /vanellope-ms
WORKDIR /vanellope-ms

ADD Gemfile /vanellope-ms/Gemfile
RUN apt-get update && apt-get install -y nodejs
RUN bundle install

EXPOSE 3001
ADD . /vanellope-ms
