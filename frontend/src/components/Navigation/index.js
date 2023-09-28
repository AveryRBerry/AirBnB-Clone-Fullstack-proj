import React from 'react';
import { NavLink } from 'react-router-dom';
import { useSelector } from 'react-redux';
import ProfileButton from './ProfileButton';
import './Navigation.css';
import homeImage from '../../Assets/airdnd-try-again.png'
import { useLocation } from 'react-router-dom';
import NavSearch from './NavSearch'

function Navigation() {
  const sessionUser = useSelector(state => state.session.user);
    const location = useLocation();

  const currentPathway = location.pathname;

  let catagories;
  let navBar;

  const segments = currentPathway.split('/');
  const id = segments[segments.length - 1];

  // console.log(id)

  if (id) {
    catagories = undefined
    navBar = 'showTopDisplayBar'
  } else {
    catagories = 'catagories'
    navBar = 'homeTopDisplayBar'
  }



  return (
    <div id='stickyContainer'>
      <ul id={navBar}>
        <li>
          <NavLink exact to="/">
            <img id='AirDnDHomeButton' src={homeImage} alt="Home" />
          </NavLink>
        </li>
        <NavSearch/>
        <li>
          <ProfileButton user={sessionUser} />
        </li>
      </ul>
      {catagories ? <ul  id='catagories'></ul> : null}
    </div>
  );
}

export default Navigation;