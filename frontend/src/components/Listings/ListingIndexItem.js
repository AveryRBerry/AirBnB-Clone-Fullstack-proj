import React from 'react';
import { Link } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { deleteListing } from '../../store/listings';




const ListingIndexItem = ({listing}) => {
    const dispatch = useDispatch();

    const handleDelete = e => {
        dispatch(deleteListing(listing.id))
    }

    return (
        <div className='listingItem'>
            <div className='listingItemImg'></div>
            <Link to={`/listings/${listing.id}`}>{listing.title}</Link>
            {/* <button onClick={handleDelete}> Delete</button> */}
        </div>
    )
}
    export default ListingIndexItem
