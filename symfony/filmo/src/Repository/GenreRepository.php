<?php

namespace App\Repository;

use App\Entity\Genre;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Genre>
 *
 * @method Genre|null find($id, $lockMode = null, $lockVersion = null)
 * @method Genre|null findOneBy(array $criteria, array $orderBy = null)
 * @method Genre[]    findAll()
 * @method Genre[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GenreRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Genre::class);
    }

    // Page Catégorie 
    // OBN = Order by name
    public function OBNgenreASC(): array {
        return $this->createQueryBuilder('g')
            ->select('g.id, g.nom')
            ->orderBy('g.nom', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function OBNgenreDESC(): array {
        return $this->createQueryBuilder('g')
            ->select('g.id, g.nom')
            ->orderBy('g.nom', 'DESC')
            ->getQuery()
            ->getResult();
    }

    // OBP = Order by popularity
    public function OBPgenreDESC(): array {
        return $this->createQueryBuilder('g')
            ->select('g.id, g.nom, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('g.produit', 'p')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->groupBy('g.id')
            ->orderBy('qte_vendu', 'DESC')
            ->getQuery()
            ->getResult();
    }

    public function OBPgenreASC(): array {
        return $this->createQueryBuilder('g')
            ->select('g.id, g.nom, SUM(dc.quantite) AS qte_vendu')
            ->leftJoin('g.produit', 'p')
            ->leftJoin('p.detailsCommandes', 'dc')
            ->groupBy('g.id')
            ->orderBy('qte_vendu', 'ASC')
            ->getQuery()
            ->getResult();
    }
//    /**
//     * @return Genre[] Returns an array of Genre objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('g')
//            ->andWhere('g.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('g.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Genre
//    {
//        return $this->createQueryBuilder('g')
//            ->andWhere('g.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
