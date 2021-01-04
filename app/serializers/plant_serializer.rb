class PlantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :species, :location, :watering_frequency
end
