import './Reservations.css'
import greatingimg from '../../Assets/greating-img-for-air-dnd.webp'
import { useDispatch, useSelector } from 'react-redux';
// import { getListings, fetchListings } from '../../store/listings';
import { fetchReservations, getReservations } from '../../store/reservations';
import { useEffect } from 'react';
import ReservationIndexItem from './ReservationIndexItem'
import ListingIndexItem from '../Listings/ListingIndexItem';


const ReservationIndex = () => {
    const reservations = useSelector(getReservations);

    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchReservations());
    }, [dispatch]);

// console.log(reservations)




    return (
        <div id='reservations-content-container'>


        <div>Trips</div>
        <div id='trips-taken-text'>You booked a total of ... trips so far!</div>

        <div id='reservations-greeting-container'>
            <div id='greeting-msg-container'> 
                <i id='icon-for-reservations-hello' className="fa-regular fa-hand-peace"></i>
                <div>Hi ..., welcome back!</div>
                <div id='trips-booked-text'>No trips booked...yet!</div>
                <div id='dust-off-msg-text'>Time to dust off your bags and start planning your next adventure</div>
                <button id='return-to-listings-index-button'>Start searching</button>
            </div>
            <img src={greatingimg} alt="Greeting img" id="reservation-greeting-img" />
        </div>

        <div id='separator-reservation-page'></div>
        <div id='current-trips-text'>Your current trips</div>

        <div id='separator-reservation-page'></div>
        <div id='current-trips-text'>Where you're going next!</div>

        <div id='separator-reservation-page'></div>
        <div id='current-trips-text'>Where you've been</div>

        <ul id='reservationsIndexPage'>
            {reservations.map(reservation => {
                // console.log(reservation.listing)
                // return <ReservationIndexItem key={reservation.id} reservation={reservation} />
                return <ListingIndexItem key={reservation.listing.id} listing={reservation.listing} />
            })}
        </ul>

        </div>
    )

}

export default ReservationIndex;