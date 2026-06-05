Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get "/summary", to: "tickets#summary"

  root "tickets#index"

  resources :tickets do
    resources :comments, only: [:create]
  end

  devise_for :customers,
    controllers: {
      omniauth_callbacks: "customers/omniauth_callbacks"
    }

  get "up" => "rails/health#show", as: :rails_health_check
end
