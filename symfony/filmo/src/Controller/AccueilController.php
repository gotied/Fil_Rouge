<?php

namespace App\Controller;

use App\Repository\ProduitRepository;
use App\Service\Footer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccueilController extends AbstractController
{
    #[Route('/', name: 'app_accueil')]
    public function index(Request $request, Footer $footer): Response
    {
        $sf = $footer->showFooter($request);

        return $this->render('accueil/index.html.twig', [
            'sf' => $sf,
        ]);
    }
}
