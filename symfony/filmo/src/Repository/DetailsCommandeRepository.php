<?php

namespace App\Repository;

use App\Entity\DetailsCommande;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<DetailsCommande>
 *
 * @method DetailsCommande|null find($id, $lockMode = null, $lockVersion = null)
 * @method DetailsCommande|null findOneBy(array $criteria, array $orderBy = null)
 * @method DetailsCommande[]    findAll()
 * @method DetailsCommande[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DetailsCommandeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DetailsCommande::class);
    }

    // Page Accueil
    // OBP = Order by popularity, max results 8
    public function OBP8produit(): array {
        return $this->createQueryBuilder('dc')
            ->select('SUM(dc.quantite) AS qte_vendu, p.id, p.prix_ttc, p.image')
            ->leftJoin('dc.produit', 'p')
            ->groupBy('p.id')
            ->orderBy('qte_vendu', 'DESC')
            ->setMaxResults(8)
            ->getQuery()
            ->getResult();
    }

    // Page Produit
    // OBP = Order by popularity 
    public function OBPproduitDESC(): array {
        return $this->createQueryBuilder('dc')
            ->select('SUM(dc.quantite) AS qte_vendu, p.id, p.prix_ttc, p.image')
            ->leftJoin('dc.produit', 'p')
            ->groupBy('p.id')
            ->orderBy('qte_vendu', 'DESC')
            ->getQuery()
            ->getResult();
    }

    public function OBPproduitASC(): array {
        return $this->createQueryBuilder('dc')
            ->select('SUM(dc.quantite) AS qte_vendu, p.id, p.prix_ttc, p.image')
            ->leftJoin('dc.produit', 'p')
            ->groupBy('p.id')
            ->orderBy('qte_vendu', 'ASC')
            ->getQuery()
            ->getResult();
    }

//    /**
//     * @return DetailsCommande[] Returns an array of DetailsCommande objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('d.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?DetailsCommande
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
