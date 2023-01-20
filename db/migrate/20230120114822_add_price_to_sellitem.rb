class AddPriceToSellitem < ActiveRecord::Migration[7.0]
  def change
    add_column :sellitems, :price, :integer
  end
end
