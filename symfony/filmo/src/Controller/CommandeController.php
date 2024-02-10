<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_USER')]
class CommandeController extends AbstractController
{
    #[Route('/commande', name: 'app_commande')]
    public function index(Request $request): Response
    {
        $request->getSession()->remove('modal');
        if (empty($request->getSession()->get('detailsPanier'))) {
            $this->addFlash('info', 'Votre panier est vide.');
            return $this->redirectToRoute('app_produit');
        }
        return $this->render('commande/index.html.twig', [
        ]);
    }
}
