## Cart Microservice

This is exptracted microservice for a Skribd assignment

## Installation

## Local

For installing locally you will need `ruby 2.7`, `bundler`, `sqlite3` installed on your local machine. Go to project folder and follow the instructions:

```bash
bundle install
bundle exec rake db:migrate # will create db and tables
bundle exec rackup # app will start on you localhost:9292
```

## Docker Compose

Alternative way is using docker compose. You will need `docker` and `docker-compose` installed on your machine. go to project file and follow instructions

```bash
docker-compose build
docker-compose up ## app will start on your localhost:9292
```

With docker compose installation you will also get Swagger ui, where you can try api request with html interface. Swagger ui can be accessed via `http://localhost:8080`

# Running tests

Go to project folder and follow instructions

```bash
bundle install
RACK_ENV=test bundle exec rake db:migrate
bundle exec rspec
```

You can see test results. You can also get test coverage on `./coverage` folder

# API endpoints

> POST /carts/:user_id

Will create cart for given user id

*Example Response*
```json
{
  "id": "5d132eca-0daf-412c-be01-44092958aeab",
  "user_id": 1234,
  "items": [],
  "created_at": "2020-10-23 08:01:14 +0000",
  "updated_at": "2020-10-23 08:01:14 +0000"
}

```


> GET /carts/:user_id

Will get info about cart of user

*Example Response*

```json
{
    "id": "9f5225c0-8fad-419b-bc14-84fac67b0f99",
    "user_id": 123,
    "items": [
        {
            "product_id": 1213433,
            "quantity": 1
        }
    ],
    "created_at": "2020-10-23 07:26:50 +0000",
    "updated_at": "2020-10-23 07:26:50 +0000"
}
```

> POST /carts/:user_id/items

Will add product to cart

*Example Request Json Body:*
```json 
{
  "product_id": 123,
  "quantity": 2
}
```

*Example Response*

```json
{
    "id": "9f5225c0-8fad-419b-bc14-84fac67b0f99",
    "user_id": 123,
    "items": [
        {
            "product_id": 1213433,
            "quantity": 1
        }
    ],
    "created_at": "2020-10-23 07:26:50 +0000",
    "updated_at": "2020-10-23 07:26:50 +0000"
}
```

> DELETE /carts/:user_id/items/:product_id

Will delete given product from cart

> POST /carts/:user_id/clean

Will remove all items from cart