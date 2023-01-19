class AddNumberOfLoginsToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :login_count, :integer
    change_column :carts, :api_key, :string, 
      unique: true, null: false    
      add_index :carts, :api_key, unique: true
  end  
end
