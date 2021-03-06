class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity
      t.datetime :purchasedate
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
