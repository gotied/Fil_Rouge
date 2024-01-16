<?php

namespace App\Controller;

use App\Repository\ProduitRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProduitController extends AbstractController
{
    #[Route('/produit', name: 'app_produit')]
    public function index(ProduitRepository $proRepo, PaginatorInterface $paginator, Request $request): Response
    {
        $produit = $paginator->paginate($proRepo->allproduit(), $request->query->getInt('page', 1), 8);
        $detailsPro = $proRepo->WIproduit($request->query->get('film', ));
        $detailsCast = $proRepo->WICproduit($request->query->get('film', ));
        
        usort($detailsCast, function($a, $b) {
            $order = ['Réalisateur', 'Producteur', 'Scénariste', 'Voix originales', 'Acteur'];
            return array_search($a['role'], $order) - array_search($b['role'], $order);
        });

        $produitG = $paginator->paginate($proRepo->WGproduit($request->query->get('genre', )), $request->query->getInt('page', 1), 8, [PaginatorInterface::SORT_FIELD_PARAMETER_NAME => 'page-genre']);
        $produitC = $proRepo->WCRproduit($request->query->get('role', ), $request->query->get('cast', ));

        return $this->render('produit/index.html.twig', [
            'produit' => $produit,
            'detailsPro' => $detailsPro,
            'detailsCast' => $detailsCast,
            'produitG' => $produitG,
            'produitC' => $produitC
        ]);
    }
}
