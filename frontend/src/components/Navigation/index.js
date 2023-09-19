import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
// import LoginFormModal from '../LoginFormModal';
import './Navigation.css';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);


    // sessionLinks = (
    //   <>
    //     <LoginFormModal />
    //     <NavLink to="/signup">Sign Up</NavLink>
    //   </>
    // );

  return (
    <ul id='homeTopDisplayBar'>
      <li>
        <NavLink exact to="/">Home</NavLink>
      </li>
      <li>
        <ProfileButton user={sessionUser} />
      </li>
    </ul>
  );
}

export default Navigation;