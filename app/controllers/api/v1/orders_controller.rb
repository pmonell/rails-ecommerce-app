class Api::V1::OrdersController < ApplicationController
  respond_to :json
  
  def index
    if params[:customer_id]
      customer = Customer.find(params[:customer_id])
      orders = customer.orders
    else
      orders = Order.all
    end
    render :json => orders,
    each_serializer: Api::V1::OrderSerializer,
    root: 'orders'
  end

  def show
    order = Order.find(params[:id])
    
    if order
      render :json => order,
      serializer: Api::V1::OrderSerializer,
      root: 'order'
    else
      render :json => { errors: "No order found" },
      status: 422
    end
  end

  def create
    customer = Customer.find(params[:customer_id])
    order = customer.orders.build
    order.build_order_items_with_product_ids_and_quantities(params[:order][:product_ids_and_quantities])
    if order.save
      render :json => order,
      serializer: Api::V1::OrderSerializer,
      root: false
    else
      render :json => { errors: order.errors },
      status: 422
    end
  end

  private

    def order_params
      params.require(:order).permit(:id)
    end
end
