FROM ruby:2.4
MAINTAINER Andrew Porter <andrew.porter@wavetronix.com>
RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
    build-essential \
    git \
    imagemagick \
    libpq-dev \
    nodejs
ENV APP_DIR /var/glados
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
COPY Gemfile* ./
RUN gem update bundler
RUN bundle config --global jobs 8
RUN bundle install --system
COPY . .
RUN bundle exec rails assets:precompile RAILS_ENV=production
VOLUME ["$APP_DIR/public"]
CMD puma -C config/puma.rb
