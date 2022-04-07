class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :code
      t.string :name
      t.float  :price


      t.timestamps
    end
  end
end
