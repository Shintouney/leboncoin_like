class AddPhotoToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :cover_picture, :string
  end
end
