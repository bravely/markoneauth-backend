MarkOne Auth
============

This git repo is primarily the backend for the split application. You can find the frontend [here](https://github.com/bravely/markoneauth-frontend).

Everything required to test the requirements of the assignment can be found in this repo however, the other should only be used for code review.

## Requirements
* Ruby 2.2
* Rails 4.2
* PostgreSQL 9.x

### Installation

1. `git clone https://github.com/bravely/markoneauth-backend.git`

2. Change directory over to the repo.

3. `bundle install`

4. `rake db:create`

5. `rake db:migrate`

## Usage

In two different terminals, start your `mailcatcher` server, and in the other `rails s`.

Navigate to [http://localhost:3000]() and get started.

If you'd like to run tests, `rspec` as normal, or feel free to start up `guard`, which I use to make TDD run a little smoother, and keep me honest with constant linting of my code.

And, as always, feel free to call me for any questions or further inquiries!
