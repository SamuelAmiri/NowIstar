class ChargesController < ApplicationController

	def sales
	    @orders = Order.where(seller_id: params[:id]).order("created_at DESC")
	end

	def purchases
	    @orders = Order.where(buyer: params[:id]).order("created_at DESC")
	end

	def review
		@order = Order.find(params[:id])
		if current_user = @order.buyer_id
			@order.update_attributes(review_seller: params[:review])
			redirect_to purchases_path
		elsif current_user = @order.seller_id
			@order.update_attributes(review_buyer: params[:review])
			redirect_to sales_path
		end
	end
	
	# GET /orders/new
	def new
		@order = Order.new
		@user = User.find(params[:user_id])
		@skill = @user.skills.find(params[:skill_id])
	end

	# POST /orders
  	# POST /orders.json
	def create
	  	@order = Order.new
		@user = User.find(params[:user_id])
		@skill = @user.skills.find(params[:skill_id])
	  	@seller = @skill.user
	  
	  	@order.skill_id = @skill.id
		@order.buyer_id = current_user.id
	  	@order.seller_id = @seller.id

	  	Stripe.api_key = "sk_test_BQokikJOvBiI2HlWgH4olfQ2"
   		token = params[:stripeToken]

	      	charge = Stripe::Charge.create(
		        :amount => (@skill.price * 105).floor,
		        :currency => "usd",
		        :card => token
		        )


	    # transfer = Stripe::Transfer.create(
	    #   	:amount => (@skill.price * 95).floor,
		   #  :currency => "usd",
		  	# :recipient => @seller.servicer
	    #   	)

	    respond_to do |format|
	      if @order.save
	        format.html { redirect_to root_url, notice: "Thanks for ordering!" }
	        format.json { render action: 'show', status: :created, location: @order }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  private

    def order_params
      params.require(:order).permit(:address, :city, :state, :zip_code)
    end

end
