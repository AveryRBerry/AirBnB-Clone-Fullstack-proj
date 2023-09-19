import React, { useState, useEffect } from "react";
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import LoginFormModal from '../LoginFormModal';
import { NavLink } from 'react-router-dom';
import SignUpFormModal from "../SignUpFormModal";
import './ProfileButton.css'

function ProfileButton({ user }) {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  
  const openMenu = () => {
    setShowMenu(!showMenu);
  };


// ********/
//   this needs to be fixed need to find a way to remove the mene without removing the form
  // useEffect(() => {
  //   if (!showMenu) return;

  //   const closeMenu = (e) => {
  //     setShowMenu(false);
  //   };

    
  //   document.addEventListener('click', closeMenu);
  
  //   return () => document.removeEventListener("click", closeMenu);
  // }, [showMenu]);

  const logout = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logout());
  };


  if (user){
    return (
      <>
        <button onClick={openMenu}>
          <i className="fa-solid fa-user-circle" />
        </button>
        {showMenu && (
          <ul className="profile-dropdown">
            <li>{user.email}</li>
            <li>
              <button onClick={logout}>Log Out</button>
            </li>
          </ul>
        )}
      </>
    );
  } else {
      return (
        <>
          <button id='profileButton' onClick={openMenu}>
            <i className="fa-solid fa-bars" />
            <i className="fa-solid fa-user-circle" />
          </button>
          {showMenu && (
            <ul className="profile-dropdown">
                <li><LoginFormModal /></li>
                {/* <NavLink to="/signup">Sign Up</NavLink> */}
                <li><SignUpFormModal /></li>
            </ul>
          )}
        </>
      )
    }
} 

export default ProfileButton;