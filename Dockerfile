FROM ruby:2.6

COPY Gemfile* ./
RUN gem install bundler
RUN bundle install
WORKDIR /mnt/workspace
