class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]
  before_action :set_order_item, only: [:show, :edit, :destroy]


  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = @order.order_items.find_or_initialize_by_product_id(params[:product_id])
    @order_item.quantity += 1
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to products_path }
        format.json { render action: 'show', status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      if params[:order_item][:quantity].to_i == 0
        @order_item.destroy
        format.html { redirect_to @order_item.order, notice: 'Item was removed' }
      elsif @order_item.update(order_item_params)
        format.html { redirect_to @order_item.order, notice: 'Order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :quantity)
    end
    
    
end
