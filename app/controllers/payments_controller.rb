class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @user = current_user
    @plan = Plan.find(params[:payment][:plan_id])
    @stripe = StripeUsage.new
    card_token = params[:card_token]
    if @user.stripe_customer_token.present?
      @customer = @stripe.find_customer(@user.stripe_customer_token)
    else
      @customer = @stripe.create_customer(@user.email, card_token)
      @user.update(stripe_customer_token: @customer.id)
    end
    puts @customer
    total_amount = ((0.1 * @plan.price).to_i + @plan.price) * 100
    @charge = @stripe.create_charge(total_amount, 'usd', @plan.name, @customer.id)
    puts @charge

    redirect_to root_path, flash: { success: "Order placed successfully" }
  end

end