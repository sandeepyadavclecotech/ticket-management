Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root "tickets#index"

  get "/summary", to: "tickets#summary"
  get "/subscription", to: "tickets#subscription"

  resources :tickets do
    resources :comments, only: [:create]
  end

  post "payments/create", to: "payments#create", as: :payments_create
  get "payments/success", to: "payments#success", as: :payments_success
  get "payments/cancel", to: "payments#cancel", as: :payments_cancel

  devise_for :customers,
    controllers: {
      omniauth_callbacks: "customers/omniauth_callbacks"
    }

  get "up" => "rails/health#show", as: :rails_health_check
end
