class Account::OfferController < AccountController

  def new
    @offer = Offer.new
  end

  def create
    raise
  end
end
