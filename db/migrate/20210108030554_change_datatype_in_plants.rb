class ChangeDatatypeInPlants < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :watering_frequency, :integer
  end
end
