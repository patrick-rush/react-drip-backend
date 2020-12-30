class CareEvent < ApplicationRecord
  belongs_to :plant

  validates :due_date, presence: true
  validates :event_type, inclusion: ["water", "fertilize", "repot", "prune"]
end
