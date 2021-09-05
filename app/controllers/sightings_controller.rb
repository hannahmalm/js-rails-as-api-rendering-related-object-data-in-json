class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
      end

    #look up the sighting by id, if found, render the bird and locaton information   
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
          render json: sighting.to_json(include: [:bird, :location])
        else
          render json: { message: 'No sighting found with that id' }
        end
      end
end

#-------PRINTS THE FOLLOWING
# {
#     "id": 2,
#     "bird_id": 2,
#     "location_id": 2,
#     "created_at": "2019-05-14T11:20:37.228Z",
#     "updated_at": "2019-05-14T11:20:37.228Z",
#     "bird": {
#       "id": 2,
#       "name": "Grackle",
#       "species": "Quiscalus Quiscula",
#       "created_at": "2019-05-14T11:20:37.177Z",
#       "updated_at": "2019-05-14T11:20:37.177Z"
#     },
#     "location": {
#       "id": 2,
#       "latitude": 30.26715,
#       "longitude": -97.74306,
#       "created_at": "2019-05-14T11:20:37.196Z",
#       "updated_at": "2019-05-14T11:20:37.196Z"
#     }
#   }




# def show
#     sighting = Sighting.find_by(id: params[:id])
#     render json: sighting.to_json(:include => {
#       :bird => {:only => [:name, :species]},
#       :location => {:only => [:latitude, :longitude]}
#     }, :except => [:updated_at])
#   end

#----------PRODUCES THE FOLLOWING

# {
#     "id": 2,
#     "bird_id": 2,
#     "location_id": 2,
#     "created_at": "2019-05-14T11:20:37.228Z",
#     "bird": {
#       "name": "Grackle",
#       "species": "Quiscalus Quiscula"
#     },
#     "location": {
#       "latitude": 30.26715,
#       "longitude": -97.74306
#     }
#   }