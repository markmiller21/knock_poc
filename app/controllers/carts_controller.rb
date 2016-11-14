class CartsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def add_to_cart
    user = User.find(params[:user_id])
    all_items = session[:cart]
    new_item = Item.new(user.id, user.display_name, 1, Constants::ESSAY_DEFAULT_PRICE, user.avatar_path.url)
    if session[:cart].blank?
      session[:cart] = [new_item]
    else
      if all_items.any?{|i| i["user_id"] == user.id }
        all_items.collect { |item|
          if item["user_id"] == user.id
            item["quantity"] += 1
          end
        }
        session[:cart] = all_items
      else
        session[:cart] << new_item
      end
    end
    redirect_to :back
  end

  def checkout

  end

  def pay
    Stripe.api_key = Constants::STRIPE_API_SECRET_KEY

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # add transaction here

    binding.pry

    # Create a charge: this will charge the user's card
    begin
      charge = Stripe::Charge.create(
          :amount => 500, # Amount in cents
          :currency => "usd",
          :source => token,
          :description => "Example charge",
          :metadata => {"order_id" => "6735"}
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
    redirect_to :back
  end
end
