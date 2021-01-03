class HomeController < ApplicationController
  before_action :search_params, only: [:create]

  layout :determine_layout

  def index
    @categories = Category.where(parent_id: nil)
  end

  def create
    redirect_to category_offer_index_path(
      category:     @params[:category_id],
      text_search:  @params[:text_search],
      location_search: @params[:location_search])
  end

  private

  def determine_layout
    current_user ? "home" : "home_unlogged"
  end

  def search_params
    @params = params.require(:search).permit(:text_search, :location_search, :category_id)
  end
end
