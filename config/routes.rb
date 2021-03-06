Rails.application.routes.draw do
  root "home#index"
  namespace :api do
    namespace :v1 do
      resources :offers
    end
  end
  resources :home, only: [:index, :create]
  resources :category_offer, only: [:index, :show]
  namespace :account do
    resources :profile, only: [:index]
    resources :offer
  end
  devise_for :users,
    :controllers => {:registrations => "registrations"}
  match '/users', to: 'home#index', via: :all
end
