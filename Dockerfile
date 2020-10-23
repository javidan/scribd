FROM ruby

RUN apt-get update && apt-get install sqlite3

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

EXPOSE 9292

CMD ["bundle", "exec", "rackup"]