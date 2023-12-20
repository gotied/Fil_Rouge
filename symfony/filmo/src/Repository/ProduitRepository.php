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
    public function allproduit(): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image')
            ->getQuery()
            ->getResult();
    }

    // OBN = Order by name
    public function OBNproduitASC(): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image')
            ->orderBy('p.titre', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function OBNproduitDESC(): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image')
            ->orderBy('p.titre', 'DESC')
            ->getQuery()
            ->getResult();
    }

    // Page Catégorie / produit
    // WGN = Where genre, order by name
    public function WGNproduitASC($nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, g.nom AS genre')
            ->leftJoin('p.genres', 'g')
            ->where('g.nom = :nom')
            ->setParameter('nom', $nom)
            ->orderBy('p.titre', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function WGNproduitDESC($nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, g.nom AS genre')
            ->leftJoin('p.genres', 'g')
            ->where('g.nom = :nom')
            ->setParameter('nom', $nom)
            ->orderBy('p.titre', 'DESC')
            ->getQuery()
            ->getResult();
    }

    // WGP = Where genre, order by popularity
    public function WGPproduitDESC($nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, g.nom AS genre, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->where('g.nom = :nom')
            ->setParameter('nom', $nom)
            ->groupBy('p.id')
            ->orderBy('qte_vendu', 'DESC')
            ->getQuery()
            ->getResult();
    }

    public function WGPproduitASC($nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, g.nom AS genre, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->where('g.nom = :nom')
            ->setParameter('nom', $nom)
            ->groupBy('p.id')
            ->orderBy('qte_vendu', 'ASC')
            ->getQuery()
            ->getResult();
    }

    // WRCN = Where cast / role, order by name
    public function WRCNproduitASC($role, $prenom, $nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, r.nom AS role, CONCAT(pe.prenom, \' \', pe.nom) AS cast')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('r.nom = :role AND pe.prenom = :prenom AND pe.nom = :nom')
            ->setParameters(new ArrayCollection(array(
                new Parameter('role', $role),
                new Parameter('prenom', $prenom),
                new Parameter('nom', $nom)
            )))
            ->orderBy('p.titre', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function WRCNproduitDESC($role, $prenom, $nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, r.nom AS role, CONCAT(pe.prenom, \' \', pe.nom) AS cast')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('r.nom = :role AND pe.prenom = :prenom AND pe.nom = :nom')
            ->setParameters(new ArrayCollection(array(
                new Parameter('role', $role),
                new Parameter('prenom', $prenom),
                new Parameter('nom', $nom)
            )))
            ->orderBy('p.titre', 'DESC')
            ->getQuery()
            ->getResult();
    }

    //WRCP = Where cast / role, order by popularity 
    public function WRCPproduitDESC($role, $prenom, $nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, r.nom AS role, CONCAT(pe.prenom, \' \', pe.nom) AS cast, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->where('r.nom = :role AND pe.prenom = :prenom AND pe.nom = :nom')
            ->setParameters(new ArrayCollection(array(
                new Parameter('role', $role),
                new Parameter('prenom', $prenom),
                new Parameter('nom', $nom)
            )))
            ->groupBy('p.id')
            ->orderBy('qte_vendu', 'DESC')
            ->getQuery()
            ->getResult();
    }

    public function WRCPproduitASC($role, $prenom, $nom): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.prix_ttc, p.image, r.nom AS role, CONCAT(pe.prenom, \' \', pe.nom) AS cast, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->where('r.nom = :role AND pe.prenom = :prenom AND pe.nom = :nom')
            ->setParameters(new ArrayCollection(array(
                new Parameter('role', $role),
                new Parameter('prenom', $prenom),
                new Parameter('nom', $nom)
            )))
            ->groupBy('p.id')
            ->orderBy('qte_vendu', 'ASC')
            ->getQuery()
            ->getResult();
    }

    // Page Détails produit
    // WI = Where id
    public function WIproduit($id): array {
        return $this->createQueryBuilder('p')
            ->select('p.id, p.titre, p.synopsis, p.date_sortie, p.duree, p.image, p.prix_ttc')
            ->where('p.id = :id')
            ->setParameter('id', $id)
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
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('p.titre LIKE :recherche')
            ->orWhere('p.date_sortie LIKE :recherche')
            ->orWhere('g.nom LIKE :recherche')
            ->groupBy('p.titre')
            ->setParameter('recherche', '%'.$recherche.'%');
        $result = $qb->getQuery()->getResult();

        if ($result) {
            $qb = $this->createQueryBuilder('p')
            ->select('p.titre, p.date_sortie, GROUP_CONCAT(DISTINCT g.nom SEPARATOR \', \') AS genre, GROUP_CONCAT(DISTINCT CONCAT(pe.prenom, \' \', pe.nom) SEPARATOR \', \') AS cast')
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
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
            ->select('p.titre, p.date_sortie, GROUP_CONCAT(DISTINCT g.nom SEPARATOR \', \') AS genre, GROUP_CONCAT(DISTINCT CONCAT(pe.prenom, \' \', pe.nom) SEPARATOR \', \') AS cast, GROUP_CONCAT(DISTINCT r.nom SEPARATOR \', \') AS role')
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
            ->leftJoin('p.genres', 'g')
            ->leftJoin('p.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->leftJoin('rpp.personne', 'pe')
            ->where('r.nom LIKE :recherche')
            ->setParameter('recherche', '%'.$recherche.'%');
        $result = $qb->getQuery()->getResult();

        if ($result) {
            $qb = $this->createQueryBuilder('p')
            ->select('DISTINCT CONCAT(pe.prenom, \' \', pe.nom) AS cast, r.nom AS role')
            ->leftJoin('p.genres', 'g')
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
