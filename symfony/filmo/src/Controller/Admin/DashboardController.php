<?php

namespace App\Controller\Admin;

use App\Entity\Adresse;
use App\Entity\Commande;
use App\Entity\DetailsCommande;
use App\Entity\Facture;
use App\Entity\Fournisseur;
use App\Entity\Genre;
use App\Entity\Livraison;
use App\Entity\Personne;
use App\Entity\Produit;
use App\Entity\Role;
use App\Entity\RolePersonneProduit;
use App\Entity\Utilisateur;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    // TODO: charts accueil dashboard 
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        return $this->render('@EasyAdmin/page/content.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Filmo');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToRoute('Accueil', 'fa fa-home', 'app_accueil');
        
        if ($this->isGranted('ROLE_GERANT')) {
            yield MenuItem::section('Film');
            yield MenuItem::linkToCrud('Film', 'fa-solid fa-film', Produit::class);
            yield MenuItem::linkToCrud('Genre', 'fa-solid fa-hashtag', Genre::class);
            yield MenuItem::linkToCrud('Casting', 'fa-solid fa-masks-theater', Personne::class);
            yield MenuItem::linkToCrud('Rôle', 'fa-solid fa-users', Role::class);
            yield MenuItem::subMenu('Association', 'fa-solid fa-link')
                ->setSubItems([
                    MenuItem::linkToCrud('Film/Casting/Role', 'fa-solid fa-table-list', RolePersonneProduit::class)
                ]);
            yield MenuItem::linkToCrud('Fournisseur', 'fa-solid fa-truck', Fournisseur::class);
        }

        yield MenuItem::section('Utilisateur');
        yield MenuItem::linkToCrud('Utilisateur', 'fa-solid fa-user', Utilisateur::class);
        yield MenuItem::linkToCrud('Adresse', 'fa-solid fa-address-card', Adresse::class);

        yield MenuItem::section('Commande');
        yield MenuItem::linkToCrud('Commande', 'fa-regular fa-credit-card', Commande::class);
        yield MenuItem::linkToCrud('Détails Commande', 'fas fa-money-check', DetailsCommande::class);
        yield MenuItem::linkToCrud('Facture', 'fa-solid fa-file-invoice-dollar', Facture::class);
        yield MenuItem::linkToCrud('Livraison', 'fa-solid fa-truck-fast', Livraison::class);
    }
}
