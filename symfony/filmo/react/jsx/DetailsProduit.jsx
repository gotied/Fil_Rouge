import axios from "axios";
import moment from "moment";
import React, { useEffect, useState } from "react";
import { Link, Route, Routes, useParams } from "react-router-dom";

const DetailsProduit = () => {
    const {id} = useParams();
    const [loading, setLoading] = useState(false)
    const [produit, setProduit] = useState()
    const [tabCast, setTabCast] = useState({
        data: [] 
    });
    const [castNames, setCastNames] = useState([]);
    const [castRoles, setCastRoles] = useState([]);
    const [castDetails, setCastDetails] = useState([]);

    useEffect(() => {
        axios
            .get("http://127.0.0.1:8000/api/produits/" + id)
            .then((response) => {
                // console.log(response.data);
                setProduit(response.data);
                setLoading(true);
            })
    }, []);

    useEffect(() => {
        axios
            .get("http://127.0.0.1:8000/api/role_personne_produits?produit.id=" + id)
            .then((response) => {
                const data_cast = response.data["hydra:member"].map((d) => ({
                    role_id: parseInt(d.role.match(/\d+$/)[0]),
                    cast_id: parseInt(d.personne.match(/\d+$/)[0])
                }));
                setTabCast((prevState) => ({
                    ...prevState,
                    data: data_cast
                }));
                // console.log(id_cast, id_role);
            })
    }, []);
    
    useEffect(() => {
        const personPromises = tabCast.data.map((d) =>
            axios.get(`http://127.0.0.1:8000/api/personnes/${d.cast_id}`)
                .then((response) => response.data)
                .then((data) => `${data.prenom} ${data.nom}`)
                .catch((error) => {
                    console.error(error);
                    return 'Error';
                })
        );
    
        const rolePromises = tabCast.data.map((d) =>
            axios.get(`http://127.0.0.1:8000/api/roles/${d.role_id}`)
                .then((response) => response.data)
                .then((data) => data.nom)
                .catch((error) => {
                    console.error(error);
                    return 'Error';
                })
        );
    
        Promise.all(personPromises)
            .then((personNames) => {
                // console.log(personNames); 
                setCastNames(personNames);
            })
            .catch((error) => {
                console.error('Error fetching person names:', error);
            });
    
        Promise.all(rolePromises)
            .then((roleNames) => {
                // console.log(roleNames);
                setCastRoles(roleNames);
            })
            .catch((error) => {
                console.error('Error fetching role names:', error);
            });
    }, [tabCast.data]);

    // castNames.map((d) => {
    //     console.log(d);
    // })

    // castRoles.map((d) => {
    //     console.log(d);
    // })

    useEffect(() => {
        const castDetails = tabCast.data.map((d, index) => ({
            name: castNames[index],
            role: castRoles[index]
        }));
        setCastDetails(castDetails);
    }, [castNames, castRoles]);

    // castDetails.map((d) => {
    //     console.log(d);
    // })

    const sortedCastDetails = castDetails.sort((a, b) => {
        const rolesOrder = {
            "Réalisateur": 1,
            "Scénariste": 2,
            "Producteur": 3,
            "Acteur": 4,
            "Voix originales": 5 
        };
    
        return rolesOrder[a.role] - rolesOrder[b.role];
    });

    // console.log(sortedCastDetails);

    let loadingCast = false;

    const validData = sortedCastDetails.length > 0 && sortedCastDetails.every((d) => {
        if (d.name !== undefined && d.role !== undefined) {
            loadingCast = true;
            return true;
        } else {
            return false;
        }
    });

    // if (validData) {
    //     console.log("Tous les noms et rôles sont définis.");
    // } else {
    //     console.log("Certains noms ou rôles sont indéfinis.");
    // }

    // if (loadingCast) {
    //     console.log("Le chargement des données est terminé.");
    // }

    // sortedCastDetails.map((castMember) => {
    //     console.log(castMember);
    // })

    return (
        <>
            {loading ? (
                <div key={produit.id} className="my-5 d-flex row justify-content-center">
                    <div className="container" style={{maxWidth: '18rem', marginRight: '1rem', marginLeft: '1.5rem', marginTop: '3rem', marginBottom: '3rem'}}>
                        <div className="card" id="card-pro" style={{width: '18rem'}}>
                            <img src={`/img/affiche/${produit.image}`} className="card-img-top img-fluid" alt={`affiche ${produit.titre}`}/>
                            <div className="card-body">
                                <h5 className="card-title">{produit.titre}</h5>
                            </div>
                            <ul className="list-group list-group-flush">
                                <li className="list-group-item">{produit.duree}</li>
                                <li className="list-group-item">{moment(produit.date_sortie).format('DD/MM/YYYY')}</li>
                                <li className="list-group-item">{produit.prix_ttc}€</li>
                            </ul>
                            <div className="card-body">
                                <img src="/img/icon/logo-dvd.png" alt="logo dvd" title="comme on est encore en 2005" style={{width: '25px', height: '25px'}}/>
                                <a href="" style={{marginLeft: '8rem'}} className="card-link"><img src="/img/icon/cart-shopping-solid-black.svg" alt="panier"/></a>
                            </div>
                        </div>
                    </div>
                    <div className="col-3" style={{width: '30rem', marginRight: '2rem', marginLeft: '2rem', marginTop: '3rem', marginBottom: '3rem'}}>
                        <div className="card" id="card-syno" style={{width: '30rem', minHeight: '11rem', maxHeight: '16rem', marginBottom: '1.5rem'}}>
                            <div className="card-body" style={{paddingBottom: '0rem'}}>
                                <h6 className="card-subtitle mb-2 text-body-secondary">Synopsis</h6>
                                <hr style={{marginBottom: '0rem'}}></hr>
                            </div>
                            <div className="card-body" style={{overflowY: 'auto', paddingTop: '0rem'}}>
                                <p className="card-text">{produit.synopsis}</p>
                            </div>
                        </div>
                        <div className="card" id="card-syno" style={{width: '30rem', height: '21rem', marginTop: '1.5rem'}}>
                            <div className="card-body">
                                <iframe width="449" height="305" src={produit.bande_annonce} title="YouTube video player" frameborder="0"  referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                    {loadingCast ? (
                        <div className="container" style={{maxWidth: '18rem', marginRight: '1.5rem', marginLeft: '1rem', marginTop: '3rem', marginBottom: '3rem'}}>
                            <div className="card" style={{width: '18rem'}}>
                                <div className="card-body">
                                    {/* <h6 className="card-subtitle mb-2 text-body-secondary">Genre</h6>
                                    <p className="card-text"></p>
                                    <hr></hr> */}
                                    <h6 className="card-subtitle mb-2 text-body-secondary">Casting</h6>
                                    <hr></hr>
                                    {sortedCastDetails.map((castMember, index) => (
                                        <div key={index}>
                                            <h6 className="card-subtitle text-body-secondary">{castMember.role}</h6>
                                            <p className="card-text mb-2">{castMember.name}</p>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </div>
                    ) : (
                        <div className="spinner-border text-light" role="status" style={{marginTop: '3.5rem', marginLeft: '6.5rem'}}>
                            <span className="visually-hidden">Chargement...</span>
                        </div>
                    )}
                </div>
            ) : (
                <div className="my-5 d-flex justify-content-center">
                    <div className="spinner-border text-light" role="status">
                        <span className="visually-hidden">Chargement...</span>
                    </div>
                </div>
            )}
        </>
    )
}

export default DetailsProduit