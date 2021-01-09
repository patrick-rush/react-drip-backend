class AddFrequenciesToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :watering_frequency, :integer
    add_column :plants, :fertilizing_frequency, :integer
  end
end
