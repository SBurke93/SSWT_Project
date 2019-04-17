class ChangeCatTypeIntToString < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :category_id, :string
  end
end
