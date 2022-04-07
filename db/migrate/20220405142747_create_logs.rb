class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs, id: :uuid do |t|
      t.string :description
      # t.references :product, null: false, foreign_key: true, type: :uuid
      # t.references :cart, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
