class Plant < ApplicationRecord
    belongs_to :user
    has_many :care_events, dependent: :delete_all
    has_many :notes, dependent: :delete_all

    validates :name, :watering_frequency, presence: true

    def notes_by_date
        self.notes.order(created_at: :desc)
    end

    def this_plants_care_events
        self.care_events.order(created_at: :desc)
    end

    def completed_care_events
        self.care_events.where(completed: true).order(updated_at: :desc)
    end
end
