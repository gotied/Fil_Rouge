<?php

namespace App\Repository;

use App\Entity\Utilisateur;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Security\Core\Exception\UnsupportedUserException;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\PasswordUpgraderInterface;

/**
 * @extends ServiceEntityRepository<Utilisateur>
* @implements PasswordUpgraderInterface<Utilisateur>
 *
 * @method Utilisateur|null find($id, $lockMode = null, $lockVersion = null)
 * @method Utilisateur|null findOneBy(array $criteria, array $orderBy = null)
 * @method Utilisateur[]    findAll()
 * @method Utilisateur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class UtilisateurRepository extends ServiceEntityRepository implements PasswordUpgraderInterface
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Utilisateur::class);
    }

    /**
     * Used to upgrade (rehash) the user's password automatically over time.
     */
    public function upgradePassword(PasswordAuthenticatedUserInterface $user, string $newHashedPassword): void
    {
        if (!$user instanceof Utilisateur) {
            throw new UnsupportedUserException(sprintf('Instances of "%s" are not supported.', $user::class));
        }

        $user->setPassword($newHashedPassword);
        $this->getEntityManager()->persist($user);
        $this->getEntityManager()->flush();
    }

    public function userCommande($id): array {
        return $this->createQueryBuilder('u')
            ->select('c.id AS commande_id, c.date_commande, c.total, c.etat')
            ->leftJoin('u.commandes', 'c')
            ->where('u.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }
    public function detailsCommande($id): array {
        return $this->createQueryBuilder('u')
            ->select('c.id AS commande_id, dc.quantite, p.titre')
            ->leftJoin('u.commandes', 'c')
            ->leftJoin('c.detailsCommandes', 'dc')
            ->leftJoin('dc.produit', 'p')
            ->where('u.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }

    public function userAdresse($id): array {
        return $this->createQueryBuilder('u')
            ->select('a.id AS adresse_id, a.livraison, a.facturation')
            ->leftJoin('u.adresses', 'a')
            ->where('u.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }

    // Client pro
    public function CPcommande($id): array {
        return $this->createQueryBuilder('u')
            ->select('u.id AS user_id, c.id AS commande_id, c.date_commande, c.total, c.etat, f.mode_de_paiement, f.date_limite, f.payer, l.date_livraison')
            ->leftJoin('u.commandes', 'c')
            ->leftJoin('c.facture', 'f')
            ->leftJoin('c.livraison', 'l')
            ->where('u.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }

    public function CPcommandeDetails($id): array {
        return $this->createQueryBuilder('u')
            ->select('c.id AS commande_id, dc.quantite, p.titre')
            ->leftJoin('u.commandes', 'c')
            ->leftJoin('c.detailsCommandes', 'dc')
            ->leftJoin('dc.produit', 'p')
            ->where('u.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }

    public function CPresponsable($id): array {
        return $this->createQueryBuilder('u')
            ->select('u.email, u.telephone, CONCAT(u.nom, \' \', u.prenom) AS commercial')
            ->where('u.id = :id')
            ->setParameter('id', $id)
            ->getQuery()
            ->getResult();
    }

//    /**
//     * @return Utilisateur[] Returns an array of Utilisateur objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('u')
//            ->andWhere('u.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('u.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Utilisateur
//    {
//        return $this->createQueryBuilder('u')
//            ->andWhere('u.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
