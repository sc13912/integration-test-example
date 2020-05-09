FROM ruby:alpine
MAINTAINER Sheng Chen

RUN apk add build-base ruby-nokogiri
RUN gem install rspec capybara selenium-webdriver

ENTRYPOINT [ "rspec" ]

