class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :product, foreign_key: true, null: false
      t.string :title
      t.string :rating, index: true

      t.timestamps
    end
  end
end
