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

    // WRCN = where cast / role, order by name
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
