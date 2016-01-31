class Api::V1::OrdersController < ApplicationController
  respond_to :json

  def show
    order = Order.find(params[:id])

    render :json => order,
    serializer: Api::V1::OrderSerializer,
    root: false
  end

private

  def order_params
    params.require(:order).permit(:id)
  end

end
