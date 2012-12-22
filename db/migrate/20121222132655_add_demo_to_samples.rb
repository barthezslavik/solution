class AddDemoToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :demo, :string
  end
end
