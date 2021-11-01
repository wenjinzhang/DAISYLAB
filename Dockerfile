# syntax=docker/dockerfile:1
FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs 
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["start.sh"]
EXPOSE 4000

bundle exec jekyll serve