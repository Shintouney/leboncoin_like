class Account::OfferController < AccountController
  before_action :offer_form, only: [:new, :create]

  def new
  end

  def create
    raise
    if @offer_form.validate(offer_params)
      @offer_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def offer_form
    offer = Offer.new user_id: current_user&.id
    @offer_form ||= OfferForm.new(offer)
  end

  def offer_params
    params.require(:offer).permit(:title, :price, :description)
  end
end
