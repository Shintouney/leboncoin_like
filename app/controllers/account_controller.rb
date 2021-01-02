class AccountController < ApplicationController
  layout :determine_layout
  before_action :check_authentication

  private

  def check_authentication
    redirect_to root_path unless current_user \
      || controller_name == "offer"
    if current_user.nil? && controller_name == "offer" && params[:action] == "edit"
      flash[:error] = "vous n'avez rien à faire ici"
      redirect_to root_path
    end
  end

  def determine_layout
    controller_name == "offer" && current_user.nil? ? "home_unlogged" : "home"
  end
end
