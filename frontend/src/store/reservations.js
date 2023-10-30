export const RECEIVE_RESERVATIONS = 'reservations/RECEIVE_RESERVATIONS';
export const RECEIVE_RESERVATION = 'reservations/RECEIVE_RESERVATION';
export const REMOVE_RESERVATION = 'reservations/REMOVE_RESERVATION';

export const receiveReservations = reservations => {
    return {
        type: RECEIVE_RESERVATIONS,
        reservations
    }
};

export const receiveReservation = data => {
    return {
        type: RECEIVE_RESERVATION,
        data
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
    // console.log(state.reservations)
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
    const res = await fetch('api/reservations', {
        method: 'POST',
        body: JSON.stringify(reservation),
        headers: {
            'Content-Type': 'application/json'
        }
    });

    if (res.ok) {
        const reservation = await res.json();
        dispatch(receiveReservation(reservation));
    }
}

export const updateReservation = reservation => async dispatch => {
    const res = await fetch(`api/reservations/${reservation.id}`, {
        method: 'PATCH',
        body: JSON.stringify(reservation),
        headers: {
            'Content-Type': 'application/json'
        }
    });

    if (res.ok) {
        const reservation = await res.json();
        dispatch(receiveReservation(reservation));
    }
}

export const deleteReservation = reservationId => async dispatch => {
    const res = await fetch(`api/reservations/${reservationId}`, {
        method: 'DELETE'
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
    const nextState = {...state}

    switch (action.type) {
        case RECEIVE_RESERVATIONS:
        const currentDate = new Date();
        const currentReservations = [];
        const upcomingReservations = [];
        const pastReservations = [];

        // console.log("**********************", Object.values(action.reservations))

        Object.values(action.reservations).forEach((reservation) => {
            const startDate = new Date(reservation.startDate);
            const endDate = new Date(reservation.endDate);
            // debugger

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
            // debugger
            nextState[action.data.reservation.id] = action.data.reservation;
            return nextState;
        case REMOVE_RESERVATION:
            delete nextState[action.reservationId];
            return nextState;
        default:
            return state;
    }
};

export default reservationsReducer;