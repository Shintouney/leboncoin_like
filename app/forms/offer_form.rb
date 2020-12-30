class OfferForm < Reform::Form

  property :title, validates: { presence: true, allow_blank: false }
  property :price, validates: { presence: true, allow_blank: false, numericality: { greater_than_or_equal_to: 0 }}
  property :description, validates: { presence: true, allow_blank: false }
  property :user_id, validates: { presence: true }
  property :category_id, validates: { presence: true, allow_blank: false }

  def validate params
    super
    return false if self.errors.any?
    category = Category.find_by_name(self.category_id)
    if category
      self.category_id = category.id
    else
      errors.add(:category, "Catégorie invalide")
      false
    end
  end

end
