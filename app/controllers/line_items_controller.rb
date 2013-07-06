class LineItemsController < ApplicationController
  
  def create
    @cart = current_cart
    item = Item.find(params[:item])

    
    @line_item = @cart.add_item(item.id)
    @line_item.item = item
    @line_item.shop_id = @line_item.item.shop_id
    @line_item.quantity = params[:line_item][:quantity]
    if @cart.cart_orders.where('shop_id = ?', item.shop_id).any?
      @line_item.cart_order_id = @cart.cart_orders.where('shop_id = ?', item.shop_id).first.id 
    else
      @cart_order = CartOrder.create(cart_id: @cart.id, shop_id: @line_item.shop_id)
      @line_item.cart_order_id = @cart_order.id
    end
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart,
          notice: 'Line item was successfully created.' }
        format.json { render json: @line_item,
          status: :created, location: @line_item }
      else
        raise "did not save".inspect
        format.html { render action: "new" }
        format.json { render json: @line_item.errors,
          status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @line_item = LineItem.find(params[:id])
    @cart_order = CartOrder.find(@line_item.cart_order_id)
    @line_item.destroy
    @cart_order.destroy if @cart_order.line_items.size == 0

    respond_to do |format|
      format.html { redirect_to root_url, notice: "The #{@line_item.item.title} has been removed from your cart" }
      format.json { head :no_content }
    end
  end
    
    
end