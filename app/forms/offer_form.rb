class OfferForm < Reform::Form

  property :title, validate: { presence: true, allow_blank: false }
  property :price, validate: { presence: true, allow_blank: false}
  property :description, validate: { presence: true, allow_blank: false }

end
