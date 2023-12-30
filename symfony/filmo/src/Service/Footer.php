<?php

namespace App\Service;

use Symfony\Component\HttpFoundation\Request;

class Footer 
{
    public function showFooter(Request $request)
    {
        if($request->query->has('pdc')) {
            $pdc = "<div><h3>Politique de confidentialité</h3><br><p>Chez Filmo, nous comprenons l'importance de protéger vos données personnelles et nous nous engageons à respecter votre vie privée.<br> Cette politique de confidentialité explique comment nous collectons, utilisons et protégeons vos données personnelles lorsque vous utilisez notre site web.</p><br><br><h3>Collecte de données personnelles</h3><br><p>Nous collectons les données personnelles suivantes lorsque vous vous inscrivez sur notre site web :</p><br><p>Adresse e-mail<br>Nom et prénom<br>Adresse de livraison et de facturation<br>Numéro de téléphone</p><br><p>Nous collectons ces informations afin de traiter vos commandes et de vous contacter si nécessaire.</p><br><h3>Utilisation des données personnelles</h3><br><p>Nous utilisons vos données personnelles pour :</p><br><p>Traiter et livrer vos commandes.<br>Vous contacter en cas de problème avec vos commandes.<br></p><p>Nous ne partageons pas vos données personnelles avec des tiers.</p><br><h3>Protection des données personnelles</h3><br><p>Nous prenons des mesures de sécurité appropriées pour protéger vos données personnelles contre tout accès, modification, divulgation ou destruction non autorisée.</p><br><p>Droit d'accès et de suppression des données personnelles :<br><br>Vous avez le droit de demander l'accès à vos données personnelles que nous avons collectées, ainsi que de demander leur suppression. <br> Pour exercer ces droits, veuillez envoyer un e-mail à l'adresse suivante : admin@filmo.fr ou vous pouvez vous rendre sur votre profil pour en faire la demande.</p><br><p>Modifications de la politique de confidentialité :<br><br>Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment. Toutes les modifications seront publiées sur notre site web.</p><br></div>";
            return new \Twig\Markup($pdc, 'UTF-8');
        }
        if($request->query->has('ml')) {
            $ml = "<div><p>Le site Internet Filmo est la propriété exclusive de .</p><p>Identifiant siret : 00000000000</p><p>Propriétaire : </p><p>E-mail : admin@filmo.fr</p><p>Téléphone : 0606060606</p><p>Conception du site internet : </p><p>Le site est hébergé par la société afpa, 33 rue de poulainville, 80000 Amiens, Capital de ~1 euro, Siret : 00000000000.</p></div>";
            return new \Twig\Markup($ml, 'UTF-8');
        }
    }
}