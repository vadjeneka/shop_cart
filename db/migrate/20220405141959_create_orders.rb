class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :uuid do |t|
      # t.float :total_price
      t.references :cart, null: false, foreign_key: true, type: :uuid
      # t.text :name

      t.timestamps
    end
  end
end
