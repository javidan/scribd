## Cart Microservice

This is extracted microservice for a Scribd assignment

## Installation

## Local

For installing locally you will need `ruby 2.7`, `bundler`, `sqlite3` installed on your local machine. Go to the project folder and follow the instructions:

```bash
bundle install
bundle exec rake db:migrate # will create db and tables
bundle exec rackup # app will start on you localhost:9292
```

## Docker Compose

The alternative way is using docker-compose. You will need `docker` and `docker-compose` installed on your machine. go to the project file and follow instructions

```bash
docker-compose build
docker-compose up ## app will start on your localhost:9292
```

With docker-compose installation you will also get Swagger ui, where you can try API request with Html interface. Swagger UI can be accessed via `http://localhost:8080`

# Running tests

Go to the project folder and follow the instructions

```bash
bundle install
RACK_ENV=test bundle exec rake db:migrate
bundle exec rspec
```

You can see the test results. You can also get test coverage on `./coverage` folder

# API endpoints

> POST /carts/:user_id

Will create a cart for given user-id

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

Will get info about the cart of user

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

Will add the product to cart

*Example Request Json Body:*
```json 
{
  "product": {
    "quantity": 2,
    "product_id": 12355
  }
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

Will delete given product from the cart

> POST /carts/:user_id/clean

Will remove all items from cart