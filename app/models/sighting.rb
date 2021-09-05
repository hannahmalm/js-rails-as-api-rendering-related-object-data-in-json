class Sighting < ApplicationRecord
  belongs_to :bird
  belongs_to :location
end


#rails g resource sighting bird:references location:references
#a Sighting will do the same by tying one Bird to one Location.
#Since we have two existing resources we're connecting, we can use the references keyword when listing them,
# and Rails will automatically connect them: