class CategoryOfferController < AccountController
  before_action :load_offers, only: [:show]

  def index
    @offers = OrderedOffersSearchQuery.new(search_params).call
    raise
  end

  def show
  end

  private

  def load_offers
    @category = Category.find_by_id(params[:id])
    if @category.nil?
      @offers = []
    else
      @offers = Offer.where(category_id: @category.id).page(params[:page])
    end
  end

  def search_params
    params.permit(:category, :location_search, :text_search)
  end
end
