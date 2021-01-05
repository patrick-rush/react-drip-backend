class Plant < ApplicationRecord
    belongs_to :user
    has_many :care_events

    validates :name, presence: true
end
