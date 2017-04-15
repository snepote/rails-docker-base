FROM ruby:2.4.1-slim

# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client
# nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev
# capybara-webkit
RUN apt-get install -y libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x xvfb libqt4-webkit libqt4-dev
# JS runtime
RUN apt-get install -y nodejs

# Define where our application will live inside the image
ENV RAILS_ROOT /myapp
RUN mkdir $RAILS_ROOT
# Set our working directory inside the image
WORKDIR $RAILS_ROOT
# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler
# Finish establishing our Ruby enviornment
RUN bundle install

# Copy the Rails application into place
COPY . .

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
# CMD [ "config/containers/app_cmd.sh" ]
