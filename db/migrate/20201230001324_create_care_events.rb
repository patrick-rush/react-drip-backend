class CreateCareEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :care_events do |t|
      t.string :event_type
      t.date :due_date
      t.boolean :completed, default: false
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
