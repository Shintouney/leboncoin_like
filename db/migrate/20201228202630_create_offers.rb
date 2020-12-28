class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.float :price
      t.text :description
      t.timestamps
    end
  end
end
