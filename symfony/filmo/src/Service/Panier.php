<?php 

namespace App\Service;

use App\Repository\ProduitRepository;
use Symfony\Component\HttpFoundation\RequestStack;

class Panier 
{
    private $requestStack;
    private $produitRepo;

    public function __construct(RequestStack $requestStack, ProduitRepository $produitRepo)
    {
        $this->requestStack = $requestStack->getSession();
        $this->produitRepo = $produitRepo;
    }

    public function add_product(int $id)
    {
        $panier = $this->requestStack->get('panier', []);
        $panier[$id] = ($panier[$id] ?? 0) + 1;
        $this->requestStack->set('panier', $panier);
    }

    public function remove_product(int $id)
    {
        $panier = $this->requestStack->get('panier', []);
        if (!empty($panier[$id])) {
            unset($panier[$id]);
            $this->requestStack->set('panier', $panier);
        }
    }

    public function getPanier() : array
    {
        $panier = $this->requestStack->get('panier', []);
        $detailsPanier = [];
        foreach ($panier as $id => $quantite) {
            $detailsPanier[] = [
                'product' => $this->produitRepo->find($id),
                'quantity' => $quantite
            ];
        }
        return $detailsPanier;
    }

    public function getTotal()
    {
        $total = 0;
        foreach ($this->getPanier() as $panier) {
            $total += $panier['product']->getPrixTtc() * $panier['quantity'];
        }
        return $total;
    }

    public function getQuantite()
    {
        $quantite = 0;
        foreach ($this->getPanier() as $panier) {
            $quantite += $panier['quantity'];
        }
        return $quantite;
    }

    public function dropPanier()
    {
        $this->requestStack->remove('panier');
        $this->requestStack->remove('detailsPanier');
        $this->requestStack->remove('total');
        $this->requestStack->remove('quantite');
    }
}