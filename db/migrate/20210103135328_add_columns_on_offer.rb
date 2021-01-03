class AddColumnsOnOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :location, :string
  end
end
