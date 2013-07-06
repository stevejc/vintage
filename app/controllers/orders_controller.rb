class OrdersController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_shop, only: [:yourshoporder, :updateshipping, :bill_customer, :shipment_details]
  
  
  def new
    @cart_order = CartOrder.find(params[:cart_order_id])
    if @cart_order.line_items.empty?
      redirect_to root_url, notice: "Your order is empty"
      return
    end
    @order = Order.new
    @shippingaddresses = current_user.shipping_addresses
    @shippingaddress = ShippingAddress.new
  end
  
  def pay
    @cart_order = CartOrder.find(params[:cart_order_id])
    if @cart_order.line_items.empty?
      redirect_to root_url, notice: "Your order is empty"
      return
    end
    @order = Order.new
    @shippingaddress = ShippingAddress.find(params[:address_id])
    @order.shipping_address_id = @shippingaddress.id
  end
  
  def create
    @cart_order = CartOrder.find(params[:cart_order_id])
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart_order)
    @order.user_id = current_user.id
    @order.shop_id = @cart_order.shop_id
    @shippingaddress = ShippingAddress.find(@order.shipping_address_id)
    
    if @order.save_with_credit_card
      CartOrder.destroy(params[:cart_order_id])
      redirect_to root_url, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      render action: "pay"
    end
  end
  
  def yourshoporders
    @orders = current_user.shop.orders
  end
  
  def yourshoporder
    @shippingaddress = ShippingAddress.find(@order.shipping_address_id)
    redirect_to orders_path if @order.shop_id != current_user.shop.id
  end
  
  def yourorders
    @orders = current_user.orders 
  end
  
  def yourorder
    @order = current_user.orders.find(params[:id])
    @shippingaddress = ShippingAddress.find(@order.shipping_address_id)
  end
  
  def shipment_details
  end
  
  def updateshipping
    if @order.update_attributes(params[:order])
      @order.status = "Order Shipped"
      @order.save
      redirect_to yourshoporder_path(@order), notice: 'Your shipping information was successfully updated.'
    else
      render :shipment_details
    end
  end
  
  def bill_customer
    @order.save_and_bill_customer
    redirect_to yourshoporder_path(@order), notice: "Your client's credit card was successfully charged, please ship the order immediately."
  end
  
  private
  
    def correct_shop
      @order = current_user.shop.orders.find_by_id(params[:id])
      redirect_to root_url, alert: "Please try again, you don't have the requested order" if @order.nil?
    end
  
end