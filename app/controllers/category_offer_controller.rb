class CategoryOfferController < AccountController
  before_action :load_offers, only: [:show]

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
end
