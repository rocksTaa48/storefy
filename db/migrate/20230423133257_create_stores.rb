class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :title, null: false
      t.string :body, null: false, default: ""
      t.belongs_to :user, foreign_key: true, null: false
      t.string :email, index: true
      t.string :phone, index: true


      t.timestamps
    end
  end
end
