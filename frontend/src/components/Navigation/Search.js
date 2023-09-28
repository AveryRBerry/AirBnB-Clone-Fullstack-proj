import { useSelector } from 'react-redux';
import { fetchSearchResults } from '../../store/search'
import { useDispatch } from 'react-redux';
import { useEffect } from 'react';
import { useLocation } from 'react-router-dom/cjs/react-router-dom.min';
import ListingIndex from '../Listings/ListingIndex';

const Search = () => {
    const dispatch = useDispatch();
    const location = useLocation();
    const searchResults = useSelector((state) => state.search);
    const searchParams = new URLSearchParams(location.search);
    const query = searchParams.get("query");
    const noResults = Object.keys(searchResults).length === 0;
    
    useEffect(() => {
        if (query) {
            dispatch(fetchSearchResults(query));
        }
    }, [query,dispatch]);

    return(
        <>
            {noResults && 
                <div id='results-for'>No results containing "{query}"</div>
            }

            <ListingIndex searchResults={Object.values({...searchResults, 999: {id: 'host'}})}/>
        </>
    );
}

export default Search