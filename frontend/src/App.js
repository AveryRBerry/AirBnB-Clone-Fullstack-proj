import React from "react";
import { Route, Switch } from 'react-router-dom';
import Navigation from "./components/Navigation";
import ListingIndex from './components/Listings/ListingIndex';


function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path="/" component={ListingIndex} />
      </Switch>
    </>
  );
}

export default App;