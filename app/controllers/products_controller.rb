class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)

    if params[:quantity] == 0
      
    end
  end

  def show
    @product = Product.find params[:id]
  end

end
