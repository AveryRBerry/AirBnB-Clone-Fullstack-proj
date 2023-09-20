import React, { useState } from "react";
import { useDispatch } from 'react-redux';
import * as sessionActions from '../../store/session';
import LoginFormModal from '../LoginFormModal';
import SignUpFormModal from "../SignUpFormModal";
import SignUpForm from '../SignUpFormModal/SignUpForm'
import './ProfileButton.css'

import { Modal } from '../../context/Modal';
import LoginForm from "../LoginFormModal/LoginForm"

function ProfileButton({ user }) {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);
  const [LoginshowModal, setLoginShowModal] = useState(false);
  const [SignUpshowModal, setSignUpShowModal] = useState(false);
  
  const openMenu = () => {
    setShowMenu(!showMenu);
  };

  const openLoginModal = () => {
    setShowMenu(!showMenu)
    setLoginShowModal(!LoginshowModal)
  }

  const openSignUpModal = () => {
    setShowMenu(!showMenu)
    setSignUpShowModal(!SignUpshowModal)
  }

  const logout = (e) => {
    e.preventDefault();
    dispatch(sessionActions.logout());
    openMenu();
  };


  if (user){
    return (
      <>
          <button id='profileButton' onClick={openMenu}>
            <i className="fa-solid fa-bars" />
            <i className="fa-solid fa-user-circle" />
          </button>
        {showMenu && (
          <ul className="profile-dropdown">
            <li>
              <button onClick={logout} >
                Log Out
              </button>
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
                <li><LoginFormModal openLoginModal={openLoginModal} /></li>
                <li><SignUpFormModal openSignUpModal={openSignUpModal} /></li>
            </ul>
          )}
          {LoginshowModal && (
            <Modal id='logInModal' onClose={() => setLoginShowModal(false)}>
              <button className='xFormButton' onClick={() => setLoginShowModal(false)} >
                <i className="fa-solid fa-times"></i>
              </button>
              <LoginForm />
            </Modal> 
          )}
          {SignUpshowModal && (
            <Modal id='signUpModal' onClose={() => setSignUpShowModal(false)}>
              <button className='xFormButton' onClick={() => setSignUpShowModal(false)} >
                <i className="fa-solid fa-times"></i>
              </button>
              <SignUpForm />
            </Modal> 
          )}
        </>
      )
    }
} 

export default ProfileButton;