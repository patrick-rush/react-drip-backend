class AddColumnsToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :repotting_frequency, :integer
    add_column :plants, :pruning_frequency, :integer
  end
end
