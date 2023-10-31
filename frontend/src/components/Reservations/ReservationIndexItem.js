import { Link } from 'react-router-dom';

function getReservationTime (reservation) {
    const currentDate= new Date()

    const startDate = new Date(reservation.startDate);
    const endDate = new Date(reservation.endDate);
    // debugger

    if (endDate < currentDate) {
        return 'past'
    } else if (startDate <= currentDate && endDate >= currentDate) {
        return 'current'
    } else {
        return 'upcoming'
    }
}

const ReservationIndexItem = ({listing, reservation}) => {
    let image
    if (listing.photos[0].photoUrl) image = listing.photos[0].photoUrl
    const typeOfReservation = getReservationTime(reservation)

    return (
        <Link className='reservationItem' to={`/listings/${listing.id}`} >
                <img
                    className='reservationItemImg'
                    src={image}
                    alt={listing.title}
                />
            <ul id='reservation-text-box'>
                <li>{listing.title}</li>
                <li>{listing.address}</li>
                <li>{reservation.startDate} to {reservation.endDate}</li>
                <li>Guests: {reservation.numGuests}</li>
                <li>${listing.price} night</li>
                {typeOfReservation === 'current' && (
                    <button className='reservations-listing-buttons'>To Listing</button>
                )}

                {typeOfReservation === 'upcoming' && (
                    <>
                        <button className='reservations-listing-buttons'>Update</button>
                        <button className='reservations-listing-buttons'>Cancel</button>
                    </>
                )}

                {typeOfReservation === 'past' && (
                    <>
                        {/* <button className='reservations-listing-buttons'>Update Review</button>
                        <button className='reservations-listing-buttons'>Remove Review</button> */}
                    </>
                )}
            </ul>
        </Link>
    )

    }
    export default ReservationIndexItem