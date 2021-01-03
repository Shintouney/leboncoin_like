class OrderedOffersSearchQuery
  def initialize(params = {}, relation = Offer.all)
    @params   = params
    @relation = relation
  end

  def call
    if @params[:category].blank? && @params[:text_search].blank? && @params[:location_search].blank?
      @relation.all.order(created_at: :desc)
    elsif @params[:text_search].blank? && @params[:location_search].blank?
      category_relation
    elsif @params[:location_search].blank? && !@params[:category].blank?
      without_location_relation
    elsif @params[:category].blank? && @params[:location_search].blank?
      only_text
    elsif @params[:category].blank? && @params[:search_text].blank?
      only_location
    else
      default_relation
    end
  end

  def category_relation
    category_id = Category.find_by_name(@params[:category])
    @relation.where(category_id: category_id)
  end

  def only_location
    @relation.where(
      location: @params[:location_search]
    )
  end

  def only_text
    @relation.where(
      'title LIKE :search OR description LIKE :search',
      search: "%#{@params[:text_search]}%"
    )
  end

  def without_location_relation
    category_id = Category.find_by_name(@params[:category])
    @relation.where(
      category_id: category_id
    ).where(
      'title LIKE :search OR description LIKE :search',
      search: "%#{@params[:text_search]}%"
    )
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

end
