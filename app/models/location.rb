class Location < ApplicationRecord
    has_many :sightings
    has_many :birds, through: :sightings
end


#rails g model location latitude:float longitude:float
#Type the code above into the terminal to make this - The model generator creates the migration and model for us here which is all we will need in this case.