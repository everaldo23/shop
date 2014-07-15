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
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "The product has been created"
      redirect_to @product
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
      params.require(:product).permit(:category, :brand, :title, :description, :shopphoto, :price)
    end
end
