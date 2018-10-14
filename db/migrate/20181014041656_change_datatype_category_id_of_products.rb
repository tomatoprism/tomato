class ChangeDatatypeCategoryIdOfProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :products, :category_id, :integer
  end
end
