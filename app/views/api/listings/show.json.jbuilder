json.listing do
    json.extract! @listing, 
        :id,
        :host_id,
        :address, 
        :title,
        :description,
        :num_beds,
        :num_bedrooms,
        :number_bathrooms,
        :price,
        :has_ac,
        :has_wifi,
        :has_pets_allowed,
        :has_washer_dryer,
        :latitude,
        :longitude
end