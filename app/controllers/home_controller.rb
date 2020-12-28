class HomeController < ApplicationController

  layout :determine_layout

  def index
  end

  def create
    raise
  end

  private

  def determine_layout
    current_user ? "home" : "home_unlogged"
  end
end
