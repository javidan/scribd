#!/bin/bash

echo "------- Migrating Database ----"
bundle exec rake db:migrate

echo "------- Starting Server -------"
bundle exec rackup -o 0.0.0.0