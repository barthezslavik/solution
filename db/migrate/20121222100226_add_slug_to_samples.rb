class AddSlugToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :slug, :string
  end
end
