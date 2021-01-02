class HomeController < ApplicationController

  layout :determine_layout

  def index
    @categories = Category.where(parent_id: nil)
  end

  private

  def determine_layout
    current_user ? "home" : "home_unlogged"
  end
end
