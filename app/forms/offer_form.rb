class OfferForm < ReformForm

  property :title, validates: { presence: true, allow_blank: false }
  property :price, validates: { presence: true, allow_blank: false, numericality: { greater_than_or_equal_to: 0 }}
  property :description, validates: { presence: true, allow_blank: false }
  property :user_id, validates: { presence: true }
  property :category_id, validates: { presence: true, allow_blank: false }
  property :cover_picture, validates: { presence: true }

  def validate params
    super
    validate_cover_picture params
    validate_category_id
  end

  private

  def validate_category_id
    return false if self.errors.any?
    category = Category.find_by_name(self.category_id)
    if category.nil?
      category = Category.find_by_id(self.category_id)
    end
    if category
      self.category_id = category.id
      return true
    else
      errors.add(:category, "Catégorie invalide")
raise
      return false
    end
  end

  def validate_cover_picture params
    if params[:cover_picture].nil?
      self.cover_picture = nil
    end
  end

end
