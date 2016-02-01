class Api::V1::OrdersController < ApplicationController
  respond_to :json

  def show
    order = Order.find(params[:id])

    render :json => order,
    serializer: Api::V1::OrderSerializer,
    root: false
  end

  def create
    customer = Customer.find(params[:user_id])
    order = customer.orders.build
    order.build_order_items_with_product_ids_and_quantities(params[:order][:product_ids_and_quantities])
    if order.save
      render :json => order,
      serializer: Api::V1::OrderSerializer,
      root: false
    else
      render :json => order.errors,
      status: 422
    end
  end

  private

    def order_params
      params.require(:order).permit(:id)
    end
end
