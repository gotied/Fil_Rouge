import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, Route, Routes } from "react-router-dom";
import Produit from "./Produit";

const Genre = () => {
    const [genre, setGenre] = useState([])
    const [loading, setLoading] = useState(false)

    useEffect( () => {
        axios
            .get("http://127.0.0.1:8000/api/genres")
            .then((response)=>{
                setGenre(response.data["hydra:member"]);
                setLoading(true);
            });
    }, []);

    return (
        <div className="my-5 d-flex justify-content-center">
            {loading ? (
                <div>
                    <ul>
                        {genre.map((g, index)=>(
                            <div key={index}>
                                <li className="my-3 li-cat"><Link to={`/Produit/${g.id}`} className="link-cat">{g.nom}</Link></li>
                            </div>
                        ))}
                    </ul>
                    <Routes>
                        <Route path="Produit" element={<Produit />} />
                    </Routes>
                </div>
            ) : (
                <div className="my-5 d-flex justify-content-center">
                    <div className="spinner-border text-light" role="status">
                        <span className="visually-hidden">Chargement...</span>
                    </div>
                </div>
            )}
        </div>
    );

}

export default Genre