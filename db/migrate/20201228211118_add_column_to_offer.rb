class AddColumnToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :type, :string
  end
end
