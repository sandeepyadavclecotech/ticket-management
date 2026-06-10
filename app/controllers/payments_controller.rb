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
        price: params[:price_id],
        quantity: 1
      }],
      mode: 'subscription',
      success_url: payments_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: payments_cancel_url
   )

    redirect_to session.url, allow_other_host: true
  end

  def success
    checkout_session = Stripe::Checkout::Session.retrieve(
      params[:session_id]
    )

    stripe_subscription = Stripe::Subscription.retrieve(
      checkout_session.subscription
    )


    price_id = stripe_subscription.items.data.first.price.id

    price = Stripe::Price.retrieve(price_id)


    product = Stripe::Product.retrieve(price.product)

    current_customer.update(
      subscription_id: stripe_subscription.id,
      subscription_status: stripe_subscription.status,
      plan_name: product.name
    )

    @session_id = params[:session_id]
  end

  def cancel
    redirect_to root_path, alert: "Purchase Cancelled"
  end
end
