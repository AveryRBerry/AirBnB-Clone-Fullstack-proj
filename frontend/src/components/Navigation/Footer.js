import { useLocation } from 'react-router-dom';

const Footer = () => {


    const location = useLocation();

    const currentPathway = location.pathname;

    let footer;

    const segments = currentPathway.split('/');
    const id = segments[segments.length - 1];


    if (id) {
        footer = 'showFooter'
    } else {
        footer = 'indexFooter'
    }

    return (
        <div id={footer}>
        <div>© 2023 Airdnd, Inc.TermsSitemapPrivacyYour Privacy Choices </div>
        <div>Socials......English (US) Choose a currency $USD</div>
        </div>
    )
}

export default Footer;