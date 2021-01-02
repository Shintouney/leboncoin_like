class Account::OfferController < AccountController
  before_action :offer_form, only: [:new, :create]
  before_action :load_offer, only: [:edit, :show, :update]

  def index
    @offers = policy_scope(Offer)
  end

  def show
  end

  def new
  end

  def edit
    @offer_form    = Offer.find_by_id(params[:id])
    authorize @offer_form
    @category_name = Category.find_by_id(@offer_form.category_id).name
  end

  def update
    authorize @offer
    @offer_form ||= @offer_form = OfferForm.new(@offer)
    if form_validate
      @offer.update(offer_params_update)
      flash[:success] = 'Votre annonce a bien été mis à jour'
      redirect_to account_offer_path(@offer_form.id)
    else
      flash[:error] = 'Erreur de validation'
      render :edit
    end
  end

  def destroy
    offer = Offer.find_by_id(params[:id])
    offer.destroy if offer.user_id == current_user.id
    flash[:success] = 'Votre annonce a été supprimé'
    redirect_to root_path
  end

  def create
    if form_validate
      @offer_form.save
      flash[:success] = 'Votre annonce a été créé'
      redirect_to account_offer_path(@offer_form.id)
    else
      flash[:error] = 'Erreur de validation'
      render :new
    end
  end

  private

  def offer_form
    offer = Offer.new \
      user_id:  current_user&.id
    @offer_form ||= OfferForm.new(offer)
  end

  def offer_params_update
    param = params.require(:offer).permit(:title, :price, :description, :category_id, :cover_picture)
    param[:category_id] = @offer_form.category_id
    param
  end

  def offer_params
    params.require(:offer).permit(:title, :price, :description, :category_id, :cover_picture)
  end

  def form_validate
    @offer_form.validate offer_params
  end

  def load_offer
    @offer = Offer.find_by_id(params[:id])
  end

end
