import { useEffect } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { getListing, fetchListing} from '../../store/listings';
import './ListingShow.css'

// temp img imports
import hobbitHouse1 from '../../Assets/hobbitHouse1.webp'
import hobbitHouse2 from '../../Assets/hobbitHouse2.png'
import hobbitHouse3 from '../../Assets/hobbitHouse3.jpeg'
import hobbitHouse4 from '../../Assets/hobbitHouse4.webp'
import hobbitHouse5 from '../../Assets/hobbitHouse5.jpeg'



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
            <div id='showContainer'>
                <div id='showPageTitle'>{listing.title}</div>
                <div id='miniNavBarShowPage'>Stars...   Reviews...   {listing.address}</div>
                <div id='showImgContainer' >
                    <img id='bigShowImg' src={hobbitHouse1} alt='Listing img' />
                    <div id='smallShowImgContainer'>
                        <img id='smallShowImg' src={hobbitHouse2} alt='Listing img' />
                        <img id='smallShowImg' src={hobbitHouse3} alt='Listing img' />
                        <img id='smallShowImg' src={hobbitHouse4} alt='Listing img' />
                        <img id='smallShowImg' src={hobbitHouse5} alt='Listing img' />

                    </div>
                    {/* <h1 id='test'>{listing.title}</h1> */}
                </div>
            </div>
        </>
    );
}

export default ListingShow;