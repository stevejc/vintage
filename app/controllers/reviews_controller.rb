class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @order = params[:order_id]
  end
  
  def create
    @review = Review.new(params[:review])
    @review.user_id = current_user.id
    if @review.save
      redirect_to yourorder_path(@review.order_id), :notice => 'Your review was successfully added.'
    else
      render :new
    end   
  end
  
  def edit
    @review = Review.find(params[:id])
    @order = params[:order_id]
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      redirect_to yourorder_path(@review.order_id), :notice => 'Your review was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to yourorder_path(@review.order_id), :notice => 'You successfully deleted your review'
  end
  
end