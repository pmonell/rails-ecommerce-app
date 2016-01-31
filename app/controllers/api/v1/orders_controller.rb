class Api::V1::OrdersController < ApplicationController
  respond_to :json

  def show
    order = Order.find(params[:id])
    order_items = order.order_items.all

    render :json => order_items,
    each_serializer: Api::V1::OrderItemSerializer,
    root: 'order'
  end

private

  def order_params
    params.require(:order).permit(:id)
  end

end
