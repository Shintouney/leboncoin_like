class OfferForm < Reform::Form

  property :title, validates: { presence: true, allow_blank: false }
  property :price, validates: { presence: true, allow_blank: false}
  property :description, validates: { presence: true, allow_blank: false }
  property :user_id, validates: { presence: true }
  property :category_id, validates: { presence: true }
  property :category

end
