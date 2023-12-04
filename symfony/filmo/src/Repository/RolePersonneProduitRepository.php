<?php

namespace App\Repository;

use App\Entity\RolePersonneProduit;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<RolePersonneProduit>
 *
 * @method RolePersonneProduit|null find($id, $lockMode = null, $lockVersion = null)
 * @method RolePersonneProduit|null findOneBy(array $criteria, array $orderBy = null)
 * @method RolePersonneProduit[]    findAll()
 * @method RolePersonneProduit[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RolePersonneProduitRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, RolePersonneProduit::class);
    }

//    /**
//     * @return RolePersonneProduit[] Returns an array of RolePersonneProduit objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('r.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?RolePersonneProduit
//    {
//        return $this->createQueryBuilder('r')
//            ->andWhere('r.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
