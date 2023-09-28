import { useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getListing, fetchListing} from '../../store/listings';
import './ListingShow.css'
import { getUser } from '../../store/users'




const ListingShow = () => {

    const {listingId} = useParams();
    const listing = useSelector(getListing(listingId));
    const user = useSelector(getUser(listing?.hostId));

    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchListing(listingId));
    }, [listingId, dispatch]);

    if (!listing || !user ) return null

    // console.log(listing)
    
    return (
        <>
            <div id='showContainer'>
                <div id='showPageTitle'>{listing.title}</div>
                <div id='miniNavBarShowPage'>Stars...   Reviews...   {listing.address}</div>
                <div id='showImgContainer' >
                    <img id='bigShowImg' src={listing.photos[0].photoUrl} alt='Listing img' />
                    <div id='smallShowImgContainer'>
                        <img id='smallShowImg' src={listing.photos[1].photoUrl} alt='Listing img' />
                        <img id='smallShowImg' src={listing.photos[2].photoUrl} alt='Listing img' />
                        <img id='smallShowImg' src={listing.photos[3].photoUrl} alt='Listing img' />
                        <img id='smallShowImg' src={listing.photos[4].photoUrl} alt='Listing img' />

                    </div>
                </div>

                <div id='firstHalfShowInformationBox'>
                    <div id='listingInformation'>
                        <div id='hostedByUsername'>Hosted by {user.firstName} {user.lastName}</div>
                        <div>{listing.numBedrooms} bedrooms : {listing.numBeds} beds : {listing.numberBathrooms} : baths</div>
                        <div id='showDescription'>{listing.description}</div>
                    </div>
                    <form id='tempBookingForm'>
                        <div id='topBookingFormInfo'>
                            <div>${listing.price} night</div>
                            <div>Reviews...</div>
                        </div>
                        <div id='bookingFormDropDownButtonsContainer'>
                            <button className='bookingFormDropDownButtons'>CHECK-IN</button>
                            <button className='bookingFormDropDownButtons' >CHECKOUT</button>
                        </div>
                        <button className='bigBookingFormDropDownButton' >GUESTS</button>
                        <button id='bigRedBookingReserveFormButton'>Reserve</button>
                    </form>
                </div>
                <div>
                    <div id='amenitiesTitle'>What this place offers</div>
                    <ul id='amenities'>
                        <li><i className="fa fa-snowflake-o"></i> {listing.hasAc ? 'AC : YES' : 'AC : NO'}</li>
                        <li><i className="fa fa-wifi"></i> {listing.hasWifi ? 'WiFi : YES' : 'WiFi : NO'}</li>
                        <li><i className="fa fa-paw"></i> {listing.hasPetsAllowed ? 'Pets allowed : YES' : 'Pets allowed : NO'}</li>
                        <li><i className="fas fa-tshirt"></i> {listing.hasWasherDryer ? 'Washer and Dryer : YES' : 'Washer and Dryer : NO'}</li>
                    </ul>
                </div>
                {/* <div id='showPlaceholder'>Calendar</div>
                <div id='showPlaceholder'>Reviews</div>
                <div id='showPlaceholder'>Map</div>
                <div is='showPlaceholder'>Host information</div> */}
            </div>
        </>
    );
}

export default ListingShow;