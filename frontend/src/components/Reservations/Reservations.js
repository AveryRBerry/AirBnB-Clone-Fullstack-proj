import './Reservations.css'
import greatingimg from '../../Assets/greating-img-for-air-dnd.webp'
import { useDispatch, useSelector } from 'react-redux';
// import { getListings, fetchListings } from '../../store/listings';
import { fetchReservations, getReservations } from '../../store/reservations';
import { useEffect } from 'react';
import ReservationIndexItem from './ReservationIndexItem'
import { useHistory } from 'react-router-dom/cjs/react-router-dom.min';

const ReservationIndex = () => {
    const reservations = useSelector(getReservations);
    const history =useHistory()

    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchReservations());
    }, [dispatch]);

    const handleStartSearchingClick = () => {
        history.push("/")
    }


    
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
                <button onClick={handleStartSearchingClick} id='return-to-listings-index-button'>Start searching</button>
            </div>
            <img src={greatingimg} alt="Greeting img" id="reservation-greeting-img" />
        </div>

        <div id='separator-reservation-page'></div>
        <div id='current-trips-text'>Your current trips</div>

        <ul id='reservationsIndexPage'>
            {!reservations.currentReservations[0] && <div id='empty-check-text-reservations'><i className="far fa-frown"></i> It's empty here ... nothing to see</div>}
            {reservations.currentReservations.map(reservation => {
                return <ReservationIndexItem key={reservation.listing.id} listing={reservation.listing} reservation={reservation} />
            })}
        </ul>

        <div id='separator-reservation-page'></div>
        <div id='current-trips-text'>Where you're going next!</div>

        <ul id='reservationsIndexPage'>
            {!reservations.upcomingReservations[0] && <div id='empty-check-text-reservations'><i className="far fa-frown"></i> It's empty here ... nothing to see</div>}
            {reservations.upcomingReservations.map(reservation => {
                return <ReservationIndexItem key={reservation.listing.id} listing={reservation.listing} reservation={reservation} />
            })}
        </ul>

        <div id='separator-reservation-page'></div>
        <div id='current-trips-text'>Where you've been</div>

        <ul id='reservationsIndexPage'>
            {!reservations.pastReservations[0] && <div id='empty-check-text-reservations'><i className="far fa-frown"></i> It's empty here ... nothing to see</div>}
            {reservations.pastReservations.map(reservation => {
                return <ReservationIndexItem key={reservation.listing.id} listing={reservation.listing} reservation={reservation} />
            })}
        </ul>

        </div>
    )

}

export default ReservationIndex;