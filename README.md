# Little Ecommerce App

### Versions
Ruby version = 2.2.x

Rails version = 4.2.2

### Installation
To install this app:

1. Clone this repository
```
git clone https://github.com/pmonell/rails-ecommerce-app.git
```
2. Navigate to project root
```
cd rails-ecommerce-app
```
3. Install dependencies using bundler
```
bundle install
```
4. This app uses pg gem and postgres database. If you have both of these installed, please update the database.yml file with your database credentials. Then initialize the database.
```
rake db:create
rake db:migrate
```
5. Time to see if rails is working
```
rails server
```

### Tests
Run the test suite by executing rspec with bundler exec in the project root
```
bundle exec rspec
```
