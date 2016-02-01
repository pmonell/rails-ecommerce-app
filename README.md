# Little Ecommerce App

### Version

Rails = 4.2.2

### Installation
To install this app:

* Clone this repository
```
git clone https://github.com/pmonell/rails-ecommerce-app.git
```
* Navigate to project root
```
cd rails-ecommerce-app
```
* Install dependencies using bundler
```
bundle install
```
* This app uses pg gem and postgres database. If you have both of these installed, please update the database.yml file with your database credentials. Then initialize the database.
```
rake db:create
rake db:migrate
```
* Time to see if rails is working
```
rails server
```

### Tests
Run the test suite by executing rspec with bundler exec in the project root
```
bundle exec rspec
```
