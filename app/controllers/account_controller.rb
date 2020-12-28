class AccountController < ApplicationController
  layout "home"
  before_action :check_authentication

  private

  def check_authentication
    redirect_to root_path unless current_user
  end
end
