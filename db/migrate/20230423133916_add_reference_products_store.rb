class AddReferenceProductsStore < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :store, foreign_key: true
  end
end
