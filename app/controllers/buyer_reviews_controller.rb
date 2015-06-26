class BuyerReviewsController < ApplicationController
  def create
  	@buyer_review = BuyerReview.create(buyer_review_params)
  end

  def update
  	@buyer_review = BuyerReview.find(params[:id])
  	@buyer_review = BuyerReview.update_attributes(buyer_review_params)
  end


private
	def buyer_review_params
    params.require(:buyer_review).permit(:order_id, :user_id, :text)
  end

end
