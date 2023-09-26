import { RECEIVE_LISTING } from './listings'


export const getUser = userId => {

    return state => {
        // console.log(state.users)
        if (state.users) return state.users[userId];
        // console.log(state.users)
        return null;
    }
}


const usersReducer = (state = {}, action) => {
    const nextState = {...state}
    switch (action.type) {

        case RECEIVE_LISTING:
            nextState[action.data.host.id] = action.data.host;
            // console.log(nextState)
            // console.log(action)
            // console.log('hi!!!!!!!!!!!!!!!!!!!')
            return nextState;
        default:
            return state;
    }
};

export default usersReducer;