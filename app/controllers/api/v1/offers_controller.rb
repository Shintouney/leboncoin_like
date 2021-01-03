module Api
  module V1
    class OffersController < ApplicationController
      def index
        category = Category.find_by_name(params[:category])
        if category.nil?
          render json: { error: true, message: "Aucune categorie trouvé" }
          return false
        end
        offers_count = Offer.where(category_id: category.id).count
        render json: {error: false, offers: offers_count}
      end
    end
  end
end
