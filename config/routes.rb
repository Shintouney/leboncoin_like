Rails.application.routes.draw do
  root "home#index"
  resources :home
  namespace :account do
    resources :profile, only: [:index]
  end
  devise_for :users,
    :controllers => {:registrations => "registrations"}
  match '/users', to: 'home#index', via: :all
end
