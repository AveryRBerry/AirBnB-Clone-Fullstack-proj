import React from 'react';
// import { useState } from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
// import LoginFormModal from '../LoginFormModal';
import './Navigation.css';
import homeImage from '../../Assets/airdnd-try-again.png'
import { useParams } from 'react-router-dom';

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
  const {listingId} = useParams();


  let catagories;
  let navBar;
  if (listingId) {
    catagories = undefined
    navBar = 'homeTopDisplayBar'
  } else {
    catagories = 'catagories'
    navBar = 'showTopDisplayBar'
  }

  return (
    <div id='stickyContainer'>
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
      {/* {catagories ? <ul  id='catagories'></ul> : null} */}
    </div>
  );
}

export default Navigation;