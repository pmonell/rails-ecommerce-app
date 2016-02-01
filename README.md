# Little Ecommerce API

### Framework

Rails v4.2.2

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
rake db:seed
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

### API Routes
##### GET  /api/v1/customers/:customer_id/orders
Returns a collection of order history from a specific customer

__Parameters__

customer_id - required

##### GET  /api/v1/customers/:customer_id/orders/:id
Returns a single order made by a specific customer

__Parameters__

customer_id - required

id - required

##### POST /api/v1/customers/:customer_id/orders
Creates an order for a customer. Returns order details and items

__Parameters__

customer_id - required

order - required
  
**product_ids_and_quantities - required 
  
**#format [[product_1.id, quantity],[product_2.id, quantity]]

##### GET  /api/v1/customers
Returns a collection of all customers

__Parameters__

None

##### POST /api/v1/customers
Creates a customer. Returns customer or errors

__Parameters__

email - required

first_name - optional

last_name - optional

##### GET  /api/v1/customers/:id
Returns a single customer

__Parameters__

id - required

##### GET  /api/v1/products
Returns a collection of all products

__Parameters__

keywords - optional

below_price - optional

##### POST /api/v1/products
Creates a product. Returns created product or errors

__Parameters__

name - required

stock - required

unit_price - required

description - optional

##### GET  /api/v1/products/:id
Returns a single product

__Parameters__

id - required

##### GET  /api/v1/orders
Returns a collection of orders

__Parameters__

None

##### GET  /api/v1/orders/:id
Returns a single order

__Parameters__

id - required
