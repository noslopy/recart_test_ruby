# Ruby version we would like to use
FROM ruby:2.6.1

# Setting vars
ENV HOME /recart_test_ruby

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log


RUN mkdir $HOME
WORKDIR $HOME

ADD Gemfile* $HOME/
RUN bundle install

ADD . $HOME

CMD bundle exec rails s -p 3000 -b '0.0.0.0'
