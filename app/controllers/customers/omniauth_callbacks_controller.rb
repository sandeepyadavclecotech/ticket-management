class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth = request.env["omniauth.auth"]

    customer = Customer.where(
      provider: auth.provider,
      uid: auth.uid
    ).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end

    sign_in_and_redirect customer, event: :authentication
  end

  def failure
    redirect_to root_path, alert: "Google authentication failed."
  end
end
