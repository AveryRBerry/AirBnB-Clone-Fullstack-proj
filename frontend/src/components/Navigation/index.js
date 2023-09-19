import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
// import LoginFormModal from '../LoginFormModal';
import './Navigation.css';
import homeImage from '../../Assets/airdnd-try-again.png'

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
        <NavLink exact to="/">
          <img id='AirDnDHomeButton' src={homeImage} alt="Home" />
        </NavLink>
      </li>
      <li>
        <ProfileButton user={sessionUser} />
      </li>
    </ul>
  );
}

export default Navigation;