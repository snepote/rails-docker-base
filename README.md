# rails-docker-base
A template to develop Rails applications and deploy using Docker

* Ruby version: 2.4.1
* Rails version: 5.0.2

```
docker-compose build
docker-compose up
docker-compose run web rake db:create db:setup
docker-compose run web rake db:schema:load db:seed
docker-compose run web rake db:migrate
docker-compose run web rake db:test:prepare

docker exec -it railsdockerbase_web_1 /bin/bash

# unit and integration
bundle exec rspec --exclude-pattern "features/**/*_spec.rb"

# Features specs
xvfb-run -a bundle exec rspec --pattern "features/**/*_spec.rb"
```
