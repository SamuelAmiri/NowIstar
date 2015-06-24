class ChargesController < ApplicationController

	def sales
	    @orders = Order.all.where(seller: current_user).order("created_at DESC")
	end

	def purchases
	    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
	end
	
	def new
		@order = Order.new
		@skill = Skill.find(params[:id])
	end

	def create
	  	@order = Order.new
	  	@skill = Skill.find(params[:id])
	  	@seller = @skill.user
	  
	  	@order.skills_id = @skill.id
		@order.buyer_id = current_user.id
	  	@order.seller_id = @seller.id

      	token = params[:stripeToken]

	    begin
	      	charge = Stripe::Charge.create(
		        :amount => (@skill.price * 100).floor,
		        :currency => "usd",
		        :card => token
		        )
	    rescue Stripe::CardError => e
	      	flash[:danger] = e.message
	    end

		rescue Stripe::CardError => e
		  	flash[:error] = e.message
		  	redirect_to charges_path
		end

	    transfer = Stripe::Transfer.create(
	      	:amount => (@skill.price * 95).floor,
		    :currency => "usd",
		  	:recipient => @seller.servicer
	      	)

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

end
