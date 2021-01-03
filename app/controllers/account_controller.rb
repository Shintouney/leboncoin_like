class AccountController < ApplicationController
  layout :determine_layout
  before_action :check_authentication

  private

  def check_authentication
    redirect_to root_path unless current_user \
      || controller_name == "offer" \
      || controller_name == "category_offer" && params[:action] == "index"
    if current_user.nil? && controller_name == "offer" && ["edit", "index"].include?(params[:action])
      flash[:error] = "vous n'avez rien à faire ici"
      redirect_to root_path
    end
  end

  def determine_layout
    controller_name == "offer" && current_user.nil? ? "home_unlogged" : "home"
  end
end
