class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false, length_min: 10
      t.text :body, default: ""
      t.decimal :price, precision: 8, scale: 2, null: false, default: 0
      t.integer :quantity, null: false, default: 1
      t.belongs_to :subcategory, null: false, foreign_key: true


      t.timestamps
    end
  end
end
