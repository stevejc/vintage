class CartsController < ApplicationController
  
  def show
    begin
      @cart = current_cart
      @cart_orders = @cart.cart_orders
            
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html #show.html.erb
        format.json { render json: @cart}
      end
    end
  end
  
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to root_url,
        notice: 'Your cart is currently empty' }
      format.json { head :no_content }
    end
  end
  
end