class OrderedOffersSearchQuery
  def initialize(params = {}, relation = Offer.all)
    @params   = params
    @relation = relation
  end

  def call
    ap @params
  end
end
