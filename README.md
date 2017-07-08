# rails-docker-base
A template to develop Rails applications and deploy using Docker

[![Build Status](https://travis-ci.org/snepote/rails-docker-base.svg?branch=master)](https://travis-ci.org/snepote/rails-docker-base)

## Versions
* Ruby version: 2.4.1
* Rails version: 5.0.2
* Chromer 59+ (with headless mode)

## Usage
### Build Docker image from docker-compose
`docker-compose build`
### Start
`docker-compose up`
### Database setup
```
docker-compose run web rake db:create db:setup
docker-compose run web rake db:schema:load db:seed
docker-compose run web rake db:migrate
```
### Command line
`docker exec -it railsdockerbase_web_1 /bin/bash`

### Testing
#### Setup
`docker-compose run web rake db:test:prepare`
#### unit and integration tests
`bundle exec rspec --exclude-pattern "features/**/*_spec.rb"`
#### non-javascript features
`bundle exec rspec --pattern "features/**/*_spec.rb" --tag ~js`
#### features specs that requires javascript
`xvfb-run -a bundle exec rspec --pattern "features/**/*_spec.rb" --tag js`
