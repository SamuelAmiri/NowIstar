class SellerReviewsController < ApplicationController
  def create
  	@seller_review = SellerReview.create(seller_review_params)
  end

  def update
  	@seller_review = SellerReview.find(params[:id])
  	@seller_review = SellerReview.update_attributes(seller_review_params)
  end

  def show
    @orders = Orders.where(user_id: == current_user.id)
    @seller_reviews = @orders.buyer_reviews
  end


private
	def seller_review_params
    params.require(:seller_review).permit(:order_id, :user_id, :text)
  end

end
