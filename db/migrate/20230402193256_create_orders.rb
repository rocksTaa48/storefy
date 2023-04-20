class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :product, null: false, foreign_key: true, index: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :quantity
      t.string :status, index: true, null: false

      t.timestamps
    end
  end
end
