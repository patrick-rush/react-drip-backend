class Plant < ApplicationRecord
    belongs_to :user
    has_many :care_events, dependent: :delete_all

    validates :name, :watering_frequency, presence: true
end
