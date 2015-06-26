class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @order = Order.find(params[:id])

    if current_user.id = @order.buyer_id
      @review = Review.create(order_id: @order.id , user_id: current_user.id, text: params[:review])
      redirect_to purchases_path
    elsif current_user.id = @order.seller_id
      @review = Review.create(order_id: @order.id , user_id: current_user.id , text: params[:review])
      redirect_to sales_path
    else
      redirect_to root_path
    end
  end


  def edit
  end

  def update
    @order = Order.find(params[:id])
    if current_user = @order.buyer_id
      @review.update_attributes(user_id: current_user.id, text: params[:review])
      redirect_to purchases_path
    elsif current_user = @order.seller_id
      @review.update_attributes(user_id: current_user.id , text: params[:review])
      redirect_to sales_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

private
  def review_params
    params.require(:review).permit(:order_id, :user_id, :text)
  end

end
