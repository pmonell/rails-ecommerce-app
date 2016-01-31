class Api::V1::ProductsController < ApplicationController
  respond_to :json

  def show
    product = Product.find(params[:id])
    render :json => product,
    serializer: Api::V1::ProductSerializer,
    root: false
  end
  
  def index
    products = Product.all
    render :json => products,
    each_serializer: Api::V1::ProductSerializer,
    root: 'products'
  end
end
