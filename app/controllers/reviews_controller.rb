class ReviewsController < ApplicationController

	def create
		@order = Order.find(params[:order_id])

		if current_user.id == @order.buyer_id
			@review = SellerReview.create(order_id: params[:order_id], user_id: current_user.id, text: params[:review])
			redirect_to purchases_path
		elsif current_user.id == @order.seller_id
			@review = BuyerReview.create(order_id: params[:order_id] , user_id: current_user.id , text: params[:review])
			redirect_to sales_path
		else
			redirect_to root_path
		end
	end

	def update

		@order = Order.find(params[:order_id])
		@seller_review = SellerReview.where(order_id: params[:order_id], user_id: current_user.id).take
		@buyer_review = BuyerReview.where(order_id: params[:order_id], user_id: current_user.id).take
		
		if current_user.id == @order.buyer_id
			@seller_review.update_attributes(text: params[:review])
			redirect_to purchases_path
		elsif current_user.id == @order.seller_id
			@buyer_review.update_attributes(text: params[:review])
			redirect_to sales_path
		else
			redirect_to root_path
		end
	end
end
