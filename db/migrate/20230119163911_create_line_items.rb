class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items, id: false do |t|
      t.primary_key :id, :auto_increment => true
      t.integer :product_id
      t.integer :cart_id
      t.integer :order_id
      t.integer :quantity, default: 1
      t.decimal :price
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.foreign_key :cart_id, references: :carts, name: 'fk_af645e8e5f'
    end
  end
end
