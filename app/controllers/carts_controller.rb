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
    if current_user.stripe_customer_id.present?
      redirect_to carts_pay_path
    end
  end

  def pay
    Stripe.api_key = Constants::STRIPE_API_SECRET_KEY

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a charge: this will charge the user's card
    begin
      #Keep this as a sample of basic Stripe payment
      # charge = Stripe::Charge.create(
      #     :amount => 500, # Amount in cents
      #     :currency => "usd",
      #     :source => token,
      #     :description => "Example charge",
      #     :metadata => {"order_id" => "6735"}
      # )

      #If the current_user has no stripe_customer_id in the DB, that means this is the first time he provide
      #their bank account info, so let's create a Stripe Customer on the cloud to store their bank info for
      #use it later.
      if current_user.stripe_customer_id.blank?
        customer = Stripe::Customer.create(
            card: token,
            description: "#{current_user.email}-#{current_user.display_name}",
            email: current_user.email
        )
        customer_id = customer.id
      else
        customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
        customer_id = current_user.stripe_customer_id
      end
      Stripe::Charge.create(
          amount: 500, # $15.00 this time
          currency: 'usd',
          customer: customer_id
      )

      #TODO I know this is ugly but it can define less functions, we can optimize this later
      @card = {card_number: ("*****#{params[:card_number][-5...-1]}" rescue nil) || "*****#{customer[:sources][:data].first[:last4]}",
               cvv: params[:cvv] || "",
               exp_date: "#{params[:exp_year] || customer[:sources][:data].first[:exp_year]}-
               #{params[:exp_month] || customer[:sources][:data].first[:exp_month]}",
               card_holder_name: params[:card_holder_name] || ""}
      PaymentMailer.payment_success(current_user, @card).deliver_now
      # save the customer ID in your database so you can use it later
      current_user.update_column("stripe_customer_id", customer_id)

    rescue Stripe::CardError => e
      @transaction_falied = true
      # The card has been declined
      PaymentMailer.payment_failed(current_user, @card).deliver_now
    end
    render 'payment_confirmation'
  end

  def payment_confirmation

  end
end
