class ItemsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :youritems, :youritem, :edit, :update, :list_for_sale ]
  before_filter :correct_user, only: [:youritem, :edit, :update, :list_for_sale]
  
  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.shop.items.new(params[:item])
    if @item.save
      redirect_to youritem_path(@item), notice: "You have successfully added your item!"
    else
      render :new
    end
  end
  
  def index
    @items = Item.text_search(params[:query]).where('status = ?', "Available")
    @keywords = params[:query]
    @favorites = current_user.favorite_items if current_user
  end
  
  def youritems
    @items = current_user.shop.items
  end
  
  def show
    @item = Item.find(params[:id])
    @items = @item.shop.items.where('id != ? AND status = ?', @item.id, "Available").limit(3)
    @reviews = @item.shop.reviews
    @items_count = @item.shop.items.size
    @lineitem = LineItem.new
  end
  
  def youritem
    redirect_to items_path if @item.shop.user_id != current_user.id
  end
  
  def edit
  end
  
  def update
    if @item.update_attributes(params[:item]) 
      redirect_to youritem_path(@item), notice: 'Your item was successfully updated.'
    else
      render :edit 
    end
  end
  
  def list_for_sale
    @item.update_status_to_available
    redirect_to youritem_path(@item), notice: 'Your item is now listed for sale.'
  end
  
  private
  
    def correct_user
      @item = current_user.shop.items.find_by_id(params[:id])
      redirect_to root_url, alert: "Please try again, you don't have the requested item" if @item.nil?
    end
   
end