class CareEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :event_type, :due_date, :completed, :plant_id
end
