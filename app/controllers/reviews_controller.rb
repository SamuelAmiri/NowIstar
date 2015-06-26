class ReviewsController < ApplicationController
	def create
		@order = Order.find(params[:id])

		if current_user.id == @order.buyer_id
			@review = BuyerReview.create(order_id: params[:order_id], user_id: current_user.id, text: params[:review])
			redirect_to purchases_path
		elsif current_user.id == @order.seller_id
			@review = SellerReview.create(order_id: params[:order_id] , user_id: current_user.id , text: params[:review])
			redirect_to sales_path
		else
			redirect_to root_path
		end
	end

	def update
		@order = Order.find(params[:order_id])
		@seller_review = SellerReview.find(order_id: params[:order_id], user_id: current_user.id)
		@buyer_review = BuyerReview.find(order_id: params[:order_id], user_id: current_user.id)
		
		if current_user.id == @order.buyer_id
			@buyer_review.update_attributes(text: params[:review])
			redirect_to purchases_path
		elsif current_user.id == @order.seller_id
			@seller_review.update_attributes(text: params[:review])
			redirect_to sales_path
		else
			redirect_to root_path
		end
	end
end
