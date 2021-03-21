class PlantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :species, :location, :watering_frequency, :fertilizing_frequency, :repotting_frequency, :pruning_frequency, :photo_url
end
