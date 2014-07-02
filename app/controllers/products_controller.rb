class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def create
    @user = User.find_by(params[:id])
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "The product has been created, #{@user.name}"
      redirect_to @product
    else
      render 'new'
    end
  end
  
  private
    def product_params
      params.require(:product).permit(:category, :brand, :title, :description, :shopphoto, :price)
    end
end
