<?php

namespace App\Repository;

use App\Entity\Produit;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Query\Parameter;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Produit>
 *
 * @method Produit|null find($id, $lockMode = null, $lockVersion = null)
 * @method Produit|null findOneBy(array $criteria, array $orderBy = null)
 * @method Produit[]    findAll()
 * @method Produit[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProduitRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Produit::class);
    }

    // Page Produit
    public function allproduit() {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.titre, p.prix_ttc, p.image, p.date_sortie, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->groupBy('p.id')
            ->getQuery();
    }

    // Page Catégorie / genre / produit
    public function WGproduit($id) {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.titre, p.prix_ttc, p.image, p.date_sortie, g.nom AS genre, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->where('g.id = :id')
            ->setParameter('id', $id)
            ->groupBy('p.id')
            ->getQuery();
    }
    // Page Catégorie / cast|role / produit
    public function WCRproduit($id_role, $id_per): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.titre, p.prix_ttc, p.image, p.date_sortie, r.nom AS role, CONCAT(pe.prenom, \' \', pe.nom) AS cast')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('r.id = :role AND pe.id = :cast')
            ->setParameters(new ArrayCollection(array(
                new Parameter('role', $id_role),
                new Parameter('cast', $id_per)
            )))
            ->getQuery()
            ->getResult();
    }

    // Page Détails produit
    // WI = Where id
    public function WIproduit($id): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.titre, p.synopsis, p.date_sortie, p.duree, p.image, p.bande_annonce, p.prix_ttc, GROUP_CONCAT(DISTINCT g.nom SEPARATOR \', \') AS genre')
            ->leftJoin('p.genres', 'g')
            ->where('p.id = :id')
            ->setParameter('id', $id)
            ->groupBy('p.id')
            ->getQuery()
            ->getResult();
    }
    // Cast
    public function WICproduit($id): array {
        return $this->createQueryBuilder('p')
            ->select('p.id AS film_id, r.nom AS role, GROUP_CONCAT(DISTINCT CONCAT(pe.prenom, \' \', pe.nom) SEPARATOR \', \') AS cast')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('p.id = :id')
            ->setParameter('id', $id)
            ->groupBy('role')
            ->getQuery()
            ->getResult();
    }

    // Recherche
    // public function recherche($recherche): array {
    //     return $this->createQueryBuilder('p')
    //         ->select('p.titre, p.date_sortie, GROUP_CONCAT(DISTINCT g.nom SEPARATOR \', \') AS genre, GROUP_CONCAT(DISTINCT CONCAT(pe.prenom, \' \', pe.nom) SEPARATOR \', \') AS cast, GROUP_CONCAT(DISTINCT r.nom SEPARATOR \', \') AS role')
    //         ->leftJoin('p.genres', 'g')
    //         ->leftJoin('p.rolePersonneProduits', 'rpp')
    //         ->leftJoin('rpp.role', 'r')
    //         ->leftJoin('rpp.personne', 'pe')
    //         ->where('p.titre LIKE :recherche')
    //         ->orWhere('p.date_sortie LIKE :recherche')
    //         ->orWhere('g.nom LIKE :recherche')
    //         ->orWhere('CONCAT(pe.prenom, \' \', pe.nom) LIKE :recherche')
    //         ->orWhere('r.nom LIKE :recherche')
    //         ->groupBy('p.titre')
    //         ->setParameter('recherche', '%'.$recherche.'%')
    //         ->getQuery()
    //         ->getResult();
    // }

    public function recherche($recherche): array {
        $qb = $this->createQueryBuilder('p')
            ->leftJoin('p.genres', 'g')
            ->where('p.titre LIKE :recherche')
            ->orWhere('p.date_sortie LIKE :recherche')
            ->orWhere('g.nom LIKE :recherche')
            ->groupBy('p.titre')
            ->setParameter('recherche', '%'.$recherche.'%');
        $result = $qb->getQuery()->getResult();

        if ($result) {
            $qb = $this->createQueryBuilder('p')
            ->select('p.id, p.titre, p.date_sortie, g.id AS genre_id, GROUP_CONCAT(DISTINCT g.nom SEPARATOR \', \') AS genre, GROUP_CONCAT(DISTINCT CONCAT(pe.prenom, \' \', pe.nom) SEPARATOR \', \') AS cast')
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.personne', 'pe')
            ->where('p.titre LIKE :recherche')
            ->orWhere('p.date_sortie LIKE :recherche')
            ->orWhere('g.nom LIKE :recherche')
            ->groupBy('p.titre')
            ->setParameter('recherche', '%'.$recherche.'%');
            return $qb->getQuery()->getResult();
        }
        
        $qb = $this->createQueryBuilder('p')
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('CONCAT(pe.prenom, \' \', pe.nom) LIKE :recherche')
            ->setParameter('recherche', '%'.$recherche.'%');
        $result = $qb->getQuery()->getResult();

        if ($result) {
            $qb = $this->createQueryBuilder('p')
            ->select('p.id, p.titre, p.date_sortie, g.id AS genre_id, GROUP_CONCAT(DISTINCT g.nom SEPARATOR \', \') AS genre, CONCAT(pe.prenom, \' \', pe.nom) AS cast, GROUP_CONCAT(DISTINCT r.nom SEPARATOR \', \') AS role')
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('CONCAT(pe.prenom, \' \', pe.nom) LIKE :recherche')
            ->groupBy('p.titre')
            ->setParameter('recherche', '%'.$recherche.'%');
            return $qb->getQuery()->getResult();
        }

        $qb = $this->createQueryBuilder('p')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('r.nom LIKE :recherche')
            ->setParameter('recherche', '%'.$recherche.'%');
        $result = $qb->getQuery()->getResult();

        if ($result) {
            $qb = $this->createQueryBuilder('p')
            ->select('DISTINCT CONCAT(pe.prenom, \' \', pe.nom) AS cast, pe.id, r.nom AS role, r.id AS role_id')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('r.nom LIKE :recherche')
            ->setParameter('recherche', '%'.$recherche.'%');
            return $qb->getQuery()->getResult();
        }
    }
    
//    /**
//     * @return Produit[] Returns an array of Produit objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('p.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Produit
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
