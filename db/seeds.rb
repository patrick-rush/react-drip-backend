require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

# Seed Users
1.times do
    user = User.new
    user.email = Faker::Internet.email
    user.password = ENV['PASSWORD']
    user.save
end

# Seed Plants
5.times do 
    plant = Plant.new
    species = ['ficus', 'spider plant', 'succulent', 'cactus', 'pathos']
    locations = ['living room', 'kitchen', 'bedroom', 'bathroom', 'dining room']
    random_species_index = Faker::Number.within(range: 0..4)
    random_location_index = Faker::Number.within(range: 0..4)
    random_watering_frequency = Faker::Number.within(range: 1..30)
    # random_fertilizing_frequency = Faker::Number.within(range: 1..12)
    plant.name = Faker::Name.first_name
    plant.species = species[random_species_index]
    plant.location = locations[random_location_index]
    plant.watering_frequency = "#{random_watering_frequency} days"
    # plant.fertilizing_frequency = "#{random_fertilizing_frequency} months"
    plant.user_id = 1
    plant.save
end

10.times do
    care_event = CareEvent.new
    event_types = ["water", "fertilize", "repot", "prune"]
    random_event_type_index = Faker::Number.within(range: 0..3)
    care_event.event_type = event_types[random_event_type_index]
    care_event.due_date = Faker::Date.between(from: '2021-01-01', to: '2021-12-31')
    care_event.plant_id = Faker::Number.within(range: 1..5)
    care_event.save
end