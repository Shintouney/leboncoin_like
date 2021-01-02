class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :store_location

  def store_location
    unless params[:controller] == "devise/sessions"
      session[:user_return_to]        = params[:controller]
      session[:user_return_to_action] = params[:action]
    end
  end

  before_action do
    I18n.locale = :fr
  end

  rescue_from Pundit::NotAuthorizedError do
    flash[:error] = "Vous n'avez pas accès à cette page."
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    if session[:user_return_to] == "account/offer"
      new_account_offer_path
    else
      root_path
    end
  end
end
