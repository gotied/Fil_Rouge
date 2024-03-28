<?php

namespace App\Controller;

use \Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[IsGranted('ROLE_USER')]
class ReactController extends AbstractController
{
    // #[Route(
    //     '/{react_route}', 
    //     name: 'app_react', 
    //     requirements: ["react_route"=>"^.+"], 
    //     defaults: ["react_route"=> null]
    // )]
    #[Route('/react', name: 'app_react')]
    #[Route('/Genre', name: 'genre_react')]
    #[Route('/Produit/{id}', name: 'produit_react')]
    #[Route('/DetailsProduit/{id}', name: 'detailsProduit_react')]
    public function index(Security $security): Response
    {
        if ($security->isGranted('ROLE_GERANT')) {
            return $this->render('react/index.html.twig');
        }
        else {
            $this->addFlash('error', 'Vous n\'avez pas le droit d\'accéder à cette page.');
            return $this->redirectToRoute('app_accueil');
        }
        // return $this->render('react/index.html.twig');
    }
}
