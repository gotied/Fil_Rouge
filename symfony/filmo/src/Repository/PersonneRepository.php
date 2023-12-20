<?php

namespace App\Repository;

use App\Entity\Personne;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Personne>
 *
 * @method Personne|null find($id, $lockMode = null, $lockVersion = null)
 * @method Personne|null findOneBy(array $criteria, array $orderBy = null)
 * @method Personne[]    findAll()
 * @method Personne[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PersonneRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Personne::class);
    }

    // Page Catégorie
    // Order by name, where role
    public function OBNpersASC($role): array {
        return $this->createQueryBuilder('pe')
            ->select('pe.id, CONCAT(pe.prenom, \' \', pe.nom) AS cast, r.id AS role_id, r.nom AS role')
            ->leftJoin('pe.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->where('r.nom = :nom')
            ->setParameter('nom', $role)
            ->groupBy('cast')
            ->orderBy('cast', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function OBNpersDESC($role): array {
        return $this->createQueryBuilder('pe')
            ->select('pe.id, CONCAT(pe.prenom, \' \', pe.nom) AS cast, r.id AS role_id, r.nom AS role')
            ->leftJoin('pe.rolePersonneProduits', 'rpp')
            ->leftJoin('rpp.role', 'r')
            ->where('r.nom = :nom')
            ->setParameter('nom', $role)
            ->groupBy('cast')
            ->orderBy('cast', 'DESC')
            ->getQuery()
            ->getResult();
    }

//    /**
//     * @return Personne[] Returns an array of Personne objects
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

//    public function findOneBySomeField($value): ?Personne
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
