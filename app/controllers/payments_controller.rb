class PaymentsController < ApplicationController
  before_action :authenticate_customer!
def create
  customer = Stripe::Customer.create(

    email: current_customer.email,
    description: "Customer ID: #{current_customer.id}"
  )

  session = Stripe::Checkout::Session.create(
    customer: customer.id,
    payment_method_types: ['card'],
    line_items: [{
      price: 'price_1TgJZkQyKZpACpmaH6BrkcF7',
      quantity: 1
    }],
    mode: 'subscription',
    success_url: payments_success_url + '?session_id={CHECKOUT_SESSION_ID}',
    cancel_url: payments_cancel_url
  )

  redirect_to session.url, allow_other_host: true
end
  def success
  @session_id = params[:session_id]
  end

  def cancel
    redirect_to root_path, alert: "Purchase Cancelled"
  end
end
