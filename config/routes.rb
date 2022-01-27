Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answers
  end
  root to: "home#index"
end
