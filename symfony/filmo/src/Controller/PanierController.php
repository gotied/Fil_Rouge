<?php

namespace App\Controller;

use App\Service\Panier;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PanierController extends AbstractController
{
    private $panier;

    public function __construct(Panier $panier)
    {
        $this->panier = $panier;
    }

    // #[Route('/panier', name: 'app_panier')]
    // public function index(Request $request): Response
    // {
    //     return $this->render('panier/index.html.twig');
    // }

    #[Route('/panier/add/{id}', name:'add_product')]
    public function add_product($id, Request $request)
    {
        $this->panier->add_product($id);
        $request->getSession()->set('detailsPanier', $this->panier->getPanier());
        $request->getSession()->set('total', $this->panier->getTotal());
        $request->getSession()->set('quantite', $this->panier->getQuantite());
        $this->addFlash('success', 'Film ajouté au panier.');
        return $this->redirect($request->headers->get('referer'));
    }

    #[Route('/panier/remove/{id}', name:'remove_product')]
    public function remove_product($id, Request $request)
    {
        $this->panier->remove_product($id);
        if (empty($this->panier->getPanier())) {
            $this->panier->dropPanier();
        }
        else {
            $request->getSession()->set('detailsPanier', $this->panier->getPanier());
            $request->getSession()->set('total', $this->panier->getTotal());
            $request->getSession()->set('quantite', $this->panier->getQuantite());
            $request->getSession()->set('modal', true);
        }
        $this->addFlash('success', 'Film supprimé du panier.');
        return $this->redirect($request->headers->get('referer'));
    }

    #[Route('/panier/drop', name:'drop_panier')]
    public function drop_panier(Request $request)
    {
        $this->panier->dropPanier();
        $this->addFlash('success', 'Le panier a été vidé.');
        return $this->redirect($request->headers->get('referer'));
    }
}
