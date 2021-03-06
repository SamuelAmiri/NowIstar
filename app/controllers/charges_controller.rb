class ChargesController < ApplicationController

	def sales
	    @orders = Order.all.where(seller: current_user).order("created_at DESC")
	end

	def purchases
	    @orders = Order.where(buyer: params[:id]).order("created_at DESC")
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

	    begin
	      	charge = Stripe::Charge.create(
		        :amount => (@skill.price * 105).floor,
		        :currency => "usd",
		        :card => token
		        )
	    rescue Stripe::CardError => e
	      	flash[:danger] = e.message
	    end

	    begin
	    transfer = Stripe::Transfer.create(
	      	:amount => (@skill.price * 95).floor,
		    :currency => "usd",
		  	:recipient => @seller.servicer
	      	)
	    rescue Stripe::CardError => e
	      	flash[:danger] = e.message
		end
	    respond_to do |format|
	      if @order.save
	        format.html { redirect_to user_path(current_user), notice: "Thanks for ordering!" }
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
