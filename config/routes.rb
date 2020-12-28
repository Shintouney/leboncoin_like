Rails.application.routes.draw do
  root "home#index"
  resource :home, only: [:index]
  devise_for :users,
    :controllers => {:registrations => "registrations"}
end
