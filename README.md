# Exchange Rate

A simple exchange rate application for exchanging USD to Euro for any date back to year 2000.
Exchange rate date is sourced from http://sdw.ecb.europa.eu/

Production app can be viewed at https://exchange-rate.herokuapp.com

## Testing

Tested using [RSpec](http://rspec.info/). In every application directory 
run `bundle exec rspec` to test that single application.

## Setup

Run `rake db:create`, `rake db:migrate`, `rake db:seed` to create and seed the database.
To launch locally on port:3000: `rails s`
