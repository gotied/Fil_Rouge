import axios from "axios";
import moment from "moment";
import React, { useEffect, useState } from "react";
import { Link, Route, Routes, useParams } from "react-router-dom";
import DetailsProduit from "./DetailsProduit";

const Produit = () => {
    const {id} = useParams();
    const [loading, setLoading] = useState(false)
    const [produit, setProduit] = useState([])

    useEffect(() => {
        axios
            .get("http://127.0.0.1:8000/api/produits?genres.id=" + id)
            .then((response) => {
            // console.log(response.data["hydra:member"]);
            setProduit(response.data["hydra:member"]);
            setLoading(true);
        })
    }, []);

    return (
        <div className="my-5 d-flex flex-wrap justify-content-center">
            {loading ? (
                <>
                {produit.map((p, index)=>(
                    <div key={index} className="card my-3 mx-3" id="card-pro" style={{ maxWidth: '430px' }}>
                        <div className="row g-0">
                            <div className="col-md-4">
                                <Link to={`/DetailsProduit/${p.id}`}><img src={`/img/affiche/${p.image}`} className="img-fluid rounded-start" alt={`affiche ${p.titre}`}/></Link>
                            </div>
                            <div className="col-md-8">
                                <div className="card-body">
                                    <h5 className="card-title" id="card-pro-title"><Link to={`/DetailsProduit/${p.id}`} className="a-link-pro">{p.titre}</Link></h5>
                                    <p className="card-text" id="card-pro-text">{moment(p.date_sortie).format('DD/MM/YYYY')}</p>
                                    <p className="card-text">{p.prix_ttc}€</p>
                                    <p className="card-text">
                                        <img src="/img/icon/logo-dvd.png" alt="logo dvd" title="comme on est encore en 2005" style={{ width: '25px', height: '25px' }}/>
                                        <a href="" style={{ marginLeft: '8rem' }}><img src="/img/icon/cart-shopping-solid-black.svg" alt="panier"/></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <Routes>
                            <Route path="DetailsProduit" element={<DetailsProduit />} />
                        </Routes>
                    </div>
                ))}
                </>
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

export default Produit