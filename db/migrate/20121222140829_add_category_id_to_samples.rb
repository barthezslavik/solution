class AddCategoryIdToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :category_id, :integer
  end
end
