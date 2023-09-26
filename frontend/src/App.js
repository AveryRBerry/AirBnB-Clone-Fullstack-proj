import React from "react";
import { Route, Switch } from 'react-router-dom';
import Navigation from "./components/Navigation";
import ListingIndex from './components/Listings/ListingIndex';
import ListingShow from './components/Listings/ListingShow'
import Footer from './components/Navigation/Footer'



function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path="/" component={ListingIndex} />
        <Route exact path="/listings/:listingId" component={ListingShow} />
      </Switch>
      <Footer/>
    </>
  );
}

export default App;