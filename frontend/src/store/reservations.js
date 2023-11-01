import csrfFetch from './csrf';

export const RECEIVE_RESERVATIONS = 'reservations/RECEIVE_RESERVATIONS';
export const RECEIVE_RESERVATION = 'reservations/RECEIVE_RESERVATION';
export const REMOVE_RESERVATION = 'reservations/REMOVE_RESERVATION';

export const receiveReservations = reservations => {
    return {
        type: RECEIVE_RESERVATIONS,
        reservations
    }
};

export const receiveReservation = reservation => {
    return {
        type: RECEIVE_RESERVATION,
        reservation
    }
};

export const removeReservation = reservationId => {
    return {
        type: REMOVE_RESERVATION,
        reservationId
    }
};

export const getReservation = reservationId => {
    return state => {
        if (state.reservations) return state.reservations[reservationId];
        return null;
    }
}

export const getReservations = state => {
    if (state.reservations) return state.reservations;
    return [];
}

export const fetchReservations = () => async dispatch => {
    const res = await fetch('/api/reservations');

    if (res.ok) {
        const reservations = await res.json();
        dispatch(receiveReservations(reservations));
    }
}

export const fetchReservation = reservationId => async dispatch => {
    const res = await fetch(`/api/reservations/${reservationId}`);

    if (res.ok) {
        const reservation = await res.json();
        dispatch(receiveReservation(reservation));
    }
}



export const createReservation = reservation => async dispatch => {
    // const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const res = await fetch('/api/reservations', {
        method: 'POST',
        body: JSON.stringify(reservation),
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': sessionStorage.getItem("X-CSRF-Token"),
        }
    });

    if (res.ok) {
        const reservation = await res.json();
        dispatch(receiveReservation(reservation));
    }
}




// export const createReservation = reservation => async dispatch => {
//   // Your request URL and request options
//   const url = '/api/reservations';
//   const options = {
//     method: 'POST',
//     body: JSON.stringify(reservation),
//   };

//   // Use the csrfFetch function to make the request
//   const res = await csrfFetch(url, options);

//   if (res.ok) {
//     const reservation = await res.json();
//     dispatch(receiveReservation(reservation));
//   }
// };







export const updateReservation = reservation => async dispatch => {
    const res = await fetch(`api/reservations/${reservation.id}`, {
        method: 'PATCH',
        body: JSON.stringify(reservation),
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': sessionStorage.getItem("X-CSRF-Token"),
        }
    });

    if (res.ok) {
        const reservation = await res.json();
        dispatch(receiveReservation(reservation));
    }
}

export const deleteReservation = reservationId => async dispatch => {
    const res = await fetch(`api/reservations/${reservationId}`, {
        method: 'DELETE',
        headers: {
            'X-CSRF-Token': sessionStorage.getItem("X-CSRF-Token"),
        }
    });

    if (res.ok) {

        dispatch(removeReservation(reservationId));
    }
}


const initialState = {
    currentReservations: [],
    upcomingReservations: [],
    pastReservations: [],
};

const reservationsReducer = (state = initialState, action) => {
    const currentDate = new Date();
    const currentReservations = [];
    const upcomingReservations = [];
    const pastReservations = [];

    switch (action.type) {

        case RECEIVE_RESERVATIONS:
            Object.values(action.reservations).forEach((reservation) => {
                const startDate = new Date(reservation.startDate);
                const endDate = new Date(reservation.endDate);

                if (endDate < currentDate) {
                    pastReservations.push(reservation);
                } else if (startDate <= currentDate && endDate >= currentDate) {
                    currentReservations.push(reservation);
                } else {
                    upcomingReservations.push(reservation);
                }
            })
            return {...state,
                    currentReservations,
                    upcomingReservations,
                    pastReservations
                    };

        case RECEIVE_RESERVATION:
            const updatedUpcomingReservations = state.upcomingReservations.map((reservation) => {
                if (reservation.id === action.reservation.id) {
                return action.reservation;
                } else
                return reservation;
            });

            return {
                currentReservations: state.currentReservations,
                upcomingReservations: updatedUpcomingReservations,
                pastReservations: state.pastReservations
            };

        case REMOVE_RESERVATION:
            const deleteUpcomingReservations = state.upcomingReservations.filter((reservation) => {
                return reservation.id !== action.reservationId;
            });
            console.log(deleteUpcomingReservations)
            return {
                currentReservations: state.currentReservations,
                upcomingReservations: deleteUpcomingReservations,
                pastReservations: state.pastReservations
            };

        default:
            return state;
    }
};

export default reservationsReducer;