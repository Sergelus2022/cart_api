class AddApikeyToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :api_key, :string
  end
end
