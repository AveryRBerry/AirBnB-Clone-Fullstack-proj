import { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getListing, fetchListing} from '../../store/listings';
import './ListingShow.css'



const ListingShow = () => {

    const {listingId} = useParams();
    const listing = useSelector(getListing(listingId));

    // localStorage.setItem('listing', JSON.stringify(listing));
    // if (listing === undefined)  listing = JSON.parse(localStorage.getItem('listing'));

    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchListing(listingId));
    }, [listingId, dispatch]);

    if (!listing) return null
    
    return (
        <>
            <h1 id='test'>{listing.title}</h1>
        </>
    );
}

export default ListingShow;