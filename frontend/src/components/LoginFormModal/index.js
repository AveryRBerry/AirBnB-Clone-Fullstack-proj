import React, { useState } from 'react';
import { Modal } from '../../context/Modal';
import LoginForm from './LoginForm';
import './LoginFormModal.css'

function LoginFormModal() {
  const [showModal, setShowModal] = useState(false);

  return (
    <>
      <button onClick={() =>  setShowModal(!showModal)}>Log In</button>
      {showModal && (
        <Modal id='logInModal' onClose={() => setShowModal(false)}>
          <LoginForm />
        </Modal> 
      )}
      {/* <LoginForm /> */}
    </>
  );
}

export default LoginFormModal;