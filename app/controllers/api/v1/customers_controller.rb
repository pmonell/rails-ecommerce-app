class Api::V1::CustomersController < ApplicationController
  respond_to :json
  
  def show
    customer = Customer.find(params[:id])
    
    render :json => customer,
    serializer: Api::V1::CustomerSerializer,
    root: 'customer'
  end

  def index
    customers = Customer.all
    render :json => customers,
    each_serializer: Api::V1::Customers::IndexSerializer,
    root: 'customers'
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render :json => customer,
      serializer: Api::V1::Customers::IndexSerializer,
      root: 'customer'
    else
      render :json => { errors: customer.errors },
      status: 422
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    HEAD 201
  end

private
    
  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name)
  end
end
