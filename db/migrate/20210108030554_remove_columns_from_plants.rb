class RemoveColumnsFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :watering_frequency
    remove_column :plants, :fertilizing_frequency
  end
end
