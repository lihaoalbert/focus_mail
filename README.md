# Focus_mail

By IntFocus

## Dependency

* Ruby 1.9.2+
* Rails ~> 3.2.0
* Mysql
* Bootstrap 2.0.1
* Resque

## Setup Guide

First you need to install redis and start redis server and then clone the repo start Rails server and start resque workers

    git clone git@github.com:lihaoalbert/focus_mail.git
    cd focus_mail
    cp config/database.yml.sample config/database.yml
    bundle install
    rake db:create
    rake db:migrate
    rake db:seed
    rails s
    COUNT=4 QUEUE=* VERBOSE=1 rake resque:workers

Done, fire up your browser and browse to `http://localhost:3000/` :)

Go to `http://localhost:3000/resque/` to see Resque status.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
