class OrderedOffersSearchQuery
  def initialize(params = {}, relation = Offer.all)
    @params   = params
    @relation = relation
  end

  def call
    if @params[:category].blank? && @params[:text_search].blank? && @params[:location_search].blank?
      @relation.all.order(created_at: :desc)
    elsif @params[:category].blank?
      without_category_relation
    elsif @params[:text_search].blank? && @params[:location_search].blank?
      category_relation
    else
      default_relation
    end
  end

  private

  def category_relation
    category_id = Category.find_by_name(@params[:category])
    @relation.where(category_id: category_id)
  end

  def default_relation
    category_id = Category.find_by_name(@params[:category])
    @relation.where(
      category_id: category_id
    ).where(
      'title LIKE :search OR description LIKE :search',
      search: "%#{@params[:text_search]}%"
    ).where(
      location: @params[:location_search]
    )
  end

  def without_category_relation
    @relation.where(
      'title LIKE :search OR description LIKE :search',
      search: "%#{@params[:text_search]}%"
    ).where(
      location: @params[:location_search]
    )
  end
end
