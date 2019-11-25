FROM ruby:2.4.2

RUN apt-get update && \
    apt-get install -y vim

ENV LANG=en_US.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH
ENV BUNDLER_EDITOR=vim

WORKDIR /gem

COPY lib/rom/json_api/version.rb ./lib/rom/json_api/version.rb
COPY Gemfile* ./
COPY rom-json_api.gemspec ./rom-json_api.gemspec

RUN bundle install --jobs 8 --retry 5

COPY . /gem

CMD rspec