class ShippingAddressesController < ApplicationController
  
  def create
    @shippingaddress = ShippingAddress.new(params[:shipping_address])
    @shippingaddress.user_id = current_user.id
    if @shippingaddress.save
      redirect_to pay_path(:address_id => @shippingaddress.id, :cart_order_id => params[:cart_order_id]), notice: "You have successfully added your shipping address!"
    else
      render 'orders/new'
    end
  end
  
  def edit
    @shippingaddress = current_user.shipping_addresses.find(params[:id])
    @cart_order = CartOrder.find(params[:cart_order_id])
  end
  
  def update
    @shippingaddress = current_user.shipping_addresses.find(params[:id])
    if @shippingaddress.update_attributes(params[:shipping_address])
      redirect_to new_order_path(:cart_order_id => params[:cart_order_id]), notice: 'Your address was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @shippingaddress = current_user.shipping_addresses.find(params[:id])
    @shippingaddress.destroy
    redirect_to new_order_path(:cart_order_id => params[:cart_order_id]), notice: 'Your address was successfully deleted.'
  end
  
end