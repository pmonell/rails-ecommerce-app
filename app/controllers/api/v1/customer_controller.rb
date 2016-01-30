class Api::V1::CustomerController < ApplicationController
  respond_to :json
  
  def index
    @customers = Customer.all
    render :json => @customers,
    each_serializer: Api::V1::Customers::IndexSerializer,
    root: 'customers'
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      render :json => @customer,
      serializer: CustomerSerializer
    else
      render :json => @customer.errors,
      status: 401
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    HEAD 201
  end
end
