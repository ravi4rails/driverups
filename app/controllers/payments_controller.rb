class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
    if params[:payment][:plan_id].present?
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
      redirect_to root_path,  notice: "Payment done succesfully"
    elsif params[:payment][:booking_id]
      @user = current_user
      @booking = Booking.find(params[:payment][:booking_id])
      @stripe = StripeUsage.new
      card_token = params[:card_token]
      if @user.stripe_customer_token.present?
        @customer = @stripe.find_customer(@user.stripe_customer_token)
      else
        @customer = @stripe.create_customer(@user.email, card_token)
        @user.update(stripe_customer_token: @customer.id)
      end
      puts @customer
      total_amount = (params[:amount].to_i * 100)
      @charge = @stripe.create_charge(total_amount, 'usd', @booking.distance, @customer.id)
      puts @charge
      ContactMailer.booking_email(user: @user.email).deliver_now
      redirect_to root_path,  notice: "Booking done succesfully"
    end
  end
end