class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :subcategories do |t|
      t.string :title, null: false, default: ""
      t.text :body, length_min: 10, length_max: 100
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
