class ChangeColumnOffer < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :type
  end
end
