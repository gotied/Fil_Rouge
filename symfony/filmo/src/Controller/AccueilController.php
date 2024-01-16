<?php

namespace App\Controller;

use App\Repository\DetailsCommandeRepository;
use App\Repository\ProduitRepository;
use App\Service\Footer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccueilController extends AbstractController
{
    #[Route('/', name: 'app_accueil')]
    public function index(ProduitRepository $proRepo, DetailsCommandeRepository $dcRepo, Request $request, Footer $footer): Response
    {
        $terms = $request->query->get('search-bar', '');
        $search = [];
        if ($terms) {
            $search = $proRepo->recherche($terms);
        }
        $sf = $footer->showFooter($request);
        $top6 =  $dcRepo->OBP6produit();

        return $this->render('accueil/index.html.twig', [
            'sf' => $sf,
            'top6' => $top6,
            'search' => $search
        ]);
    }
}
