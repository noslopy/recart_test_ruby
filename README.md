# README

Install docker & docker-compose,
then run in terminal:
(sudo not required on MAC)

```bash
$ sudo docker-compose build
$ sudo docker-compose run web rake db:create
$ sudo docker-compose run web rake db:migrate db:seed RAILS_ENV=test
$ sudo docker-compose run web rspec
```

## Docker

The project is built using one of the latest available ruby versions, the third version of docker-compose definitions (yml)
and minimal required settings.

Docker-compose proceeds to create the container and image. Afterwards pulling required predefined image of postgres.
Database data is stored in the image.
☝️ This is not a good use-case as data would be wiped each time the images are broken or down. Data should be stored in the container instead.

## Structure

As you can see Rails come with its easy-to-understand file structure. The required libraries are called gems and are defined in the "Gemfile" defining enviroments and "Gemfile.lock" defining dependencies and versions.

For a single purpose software rails is a bit bloated, but I went with it as it has a small config time.

The file structure supports MVC and many structural patterns.

## App
#### (Brief summary of development)

The database defined in "migrations" which is a description of wanted changes. I went with the less is more approach.
```
db/migrate/*.rb
```

I have defined an endpoint for the webhook calls.
```
config/routes.rb
```
This endpoint is not protected from forgery or by any means of attack.
A good solution would be to check the request header, source and frequency.
This endpoint starts a chain in:
```
app/controllers/shopify/carts_controller.rb
```
Based on the received hook the update method decides which code to run
and updates the required data in the database.
(This could also be dangerous if request parameters are not validated.)
The session model automaticly updates its USD value column before saving it to the database.
```
app/models/user_session.rb
```
I have moved the calculation into a library as if currency changes would have more then a single occurrence:
```
lib/currency_calculator.rb
```
The calculation is also just a mocked behaviour because we definitely don't want the currency related data hardcoded.
Optionally it could be stored in the database, updating it time-to-time with a scheduled job or ask for it from an foreign API.
