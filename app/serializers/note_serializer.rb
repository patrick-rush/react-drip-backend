class NoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :plant_id
end
