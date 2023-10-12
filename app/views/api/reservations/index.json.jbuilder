@reservations.each do  |reservation| 
    json.set! reservation.id do
        json.extract! reservation, 
            :id,
            :listing_id,
            :guest_id,
            :num_guests,
            :total_price,
            :start_date,
            :end_date
    end

    json.guests do
        json.extract! reservation.guests, 
        :id,
        :email,
        :first_name,
        :last_name
    end
end