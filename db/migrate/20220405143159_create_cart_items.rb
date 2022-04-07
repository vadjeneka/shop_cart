class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :cart, null: false, foreign_key: true, type: :uuid
      t.integer :quantity, :default => 1
      t.decimal :total_price, :default => 0.0
      t.references :log, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
