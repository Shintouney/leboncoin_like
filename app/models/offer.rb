class Offer < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :cover_picture

end
