class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.string :location
      t.interval :watering_frequency
      t.interval :fertilizing_frequency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
