class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts, id: :uuid do |t|
      t.boolean :is_validate, :default => false
      
      t.timestamps
    end
  end
end
