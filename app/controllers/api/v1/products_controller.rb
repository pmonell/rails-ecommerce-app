class Api::V1::ProductsController < ApplicationController
  respond_to :json
  
  ##
  #  Returns a single product's details
  #
  #  GET /api/v1/products/:id
  #
  #  params:
  #    id - product id
  
  def show
    product = Product.find(params[:id])
    render :json => product,
    serializer: Api::V1::ProductSerializer,
    root: false
  end
  
  def index
    products = Product.search(params)
    render :json => products,
    each_serializer: Api::V1::ProductSerializer,
    root: 'products'
  end

  def create
    product = Product.new(product_params)
    
    if product.save
      render :json => product,
      serializer: Api::V1::ProductSerializer,
      root: false
    else
      render :json => product.errors
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :unit_price, :stock)
    end
end
