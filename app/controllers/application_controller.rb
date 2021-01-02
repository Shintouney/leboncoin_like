class ApplicationController < ActionController::Base
  include Pundit

  before_action do
    I18n.locale = :fr
  end

  rescue_from Pundit::NotAuthorizedError do
    flash[:error] = "Vous n'avez pas accès à cette page."
    redirect_to root_path
  end
end
