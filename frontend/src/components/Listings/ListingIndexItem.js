import React from 'react';
import { Link } from 'react-router-dom';



const ListingIndexItem = ({listing}) => {

    return (
        <Link className='listingItem' to={`/listings/${listing.id}`} >
            <li className='listingItemImg'></li>
            <li style={{ fontWeight: 'bold' }}>{listing.title}</li>
            <li>{listing.address}</li>
            <li style={{ fontWeight: 'bold' }}>${listing.price} night</li>
        </Link>
    )
}
    export default ListingIndexItem
