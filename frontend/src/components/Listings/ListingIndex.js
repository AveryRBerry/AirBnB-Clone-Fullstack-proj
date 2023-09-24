import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getListings, fetchListings } from '../../store/listings';
import ListingIndexItem from './ListingIndexItem';
import './ListingIndex.css'


const ListingIndex = () => {
    const listings = useSelector(getListings);
    const dispatch = useDispatch();

    useEffect(() => {
        dispatch(fetchListings());
    }, [dispatch]);

    return (
        <>
            <ul id='listingsIndexPage'>
                {listings.map(listing => {
                    return <ListingIndexItem key={listing.id} listing={listing} />
                })}
            </ul>
        </>
    );
};

export default ListingIndex;