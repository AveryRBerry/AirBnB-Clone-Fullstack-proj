import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchSearchResults, clearSearchResults } from '../../store/search';
import { useHistory } from 'react-router-dom';



function NavSearch() {

    const [searchText, setSearchText] = useState("");
    const dispatch = useDispatch();
    const searchResults = useSelector(state => Object.values(state.search))
    const history = useHistory();

    function handleChange(e) {
        const query = e.target.value;
        setSearchText(query);
        if (query.trim() !== "" ) {
            dispatch(fetchSearchResults(query))//have to fix this so that, no auto change on query text bar change
        } else {
            dispatch(clearSearchResults())
        }
    }

    function handleClickLink(id) {
        return(e) => {
            e.preventDefault();
            history.push(`/listings/${id}`);
            dispatch(clearSearchResults());
            setSearchText("");
        }
    }

    function handleSubmit (e) {
        e.preventDefault();
        if(searchText.trim !== "") {
            setSearchText("")
            history.push(`/search?query=${searchText}`)
        }
    };

    return (
        <div className='search-bar'>
            <input
                type="text"
                className="search-input"
                placeholder="Find your adventure"
                value={searchText}
                onChange={handleChange}
            ></input>
            <button className="search-button" onClick={handleSubmit} >
                <i className="fa-solid fa-magnifying-glass"></i>
            </button> 
            {searchText && 
                <ul id='search-dropdown'>
                    {searchResults.map(result => {
                        return (
                            <li key={result.id} onClick={handleClickLink(result.id)} className='search-dropdown-item'>
                                {result.title}
                            </li>
                        )
                    })}
                </ul>
            }
        </div>
    )
}

export default NavSearch