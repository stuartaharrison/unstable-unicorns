import React from 'react';
import { NavLink } from 'react-router-dom';

const UnstableCard = ({ data }) => {
    let cardImageUrl = `${process.env.REACT_APP_WEB_API}${data.image}`;
    return (
        <div className="column is-one-quarter" key={data.id}>
            <div className="box">
                <NavLink to={`/database/${data.id}`}>
                    <img src={cardImageUrl} alt={data.name} width={318} height={448} />
                </NavLink>
            </div>
        </div>
    )
};

export default UnstableCard;