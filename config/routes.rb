Rails.application.routes.draw do
  root "home#index"
  resource :home, only: [:index]
  devise_for :users,
    :controllers => {:registrations => "registrations"}
  match '/users', to: 'home#index', via: :all
end
