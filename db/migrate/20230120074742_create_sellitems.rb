class CreateSellitems < ActiveRecord::Migration[7.0]
  def change
    create_table :sellitems do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :product
      t.integer :quantity

      t.timestamps
    end
  end
end
