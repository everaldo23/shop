class ProductsController < ApplicationController
  def new
    @product = Product.new
  end
  
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
        format.html
        format.js
        format.json { render json: @product}
    end
  end
  
  def profile
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Profile updated"
      redirect_to profile_path(@product)
    else
      render 'edit'
    end
  end
     
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "The product has been created"
      redirect_to profile_path(@product)
    else
      render 'new'
    end
  end
  
  def index
    @glaxo = Product.order(:brand).where({ brand: "GlaxoSmithKline"})
    @johnson = Product.order(:brand).where({ brand: "Johnson & Johnson"})
    @pg = Product.order(:brand).where({ brand: "Procter & Gamble"})
    @astra = Product.order(:brand).where({ brand: "AstraZeneca" })
    @pfizer = Product.order(:brand).where({ brand: "Pfizer" })
    @merck = Product.order(:brand).where({ brand: "Merck & Co." })
  end
  
  private
    def product_params
      params.require(:product).permit(:category, :brand, :title, :description, :shopphoto, :price, :stock)
    end
end
