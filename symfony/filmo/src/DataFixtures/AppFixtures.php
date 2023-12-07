<?php

namespace App\DataFixtures;

use App\Entity\Fournisseur;
use App\Entity\Genre;
use App\Entity\Personne;
use App\Entity\Produit;
use App\Entity\Role;
use App\Entity\RolePersonneProduit;
use App\Entity\Utilisateur;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
       include 'public/sql/insert_fixtures.php';

       $pro_repo = $manager->getRepository(Produit::class);
       $per_repo = $manager->getRepository(Personne::class);
       $gen_repo = $manager->getRepository(Genre::class);
       $ro_repo = $manager->getRepository(Role::class);
       $four_repo = $manager->getRepository(Fournisseur::class);
       $uti_repo = $manager->getRepository(Utilisateur::class);

       foreach ($produit as $pro){
        $new_pro = new Produit();
        $new_pro
        ->setId($pro['id'])
        ->setTitre($pro['titre'])
        ->setSynopsis($pro['synopsis'])
        ->setDateSortie($pro['date_sortie'])
        ->setDuree($pro['duree'])
        ->setImage($pro['image'])
        ->setPrixHt($pro['prix_ht'])
        ->setPrixFour($pro['prix_four'])
        ->setStock($pro['stock'])
        ->setActif($pro['actif']);
        
        $manager->persist($new_pro);
        $data = $manager->getClassMetadata(Produit::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       foreach ($personne as $per){
        $new_per = new Personne();
        $new_per
        ->setId($per['id'])
        ->setPrenom($per['prenom'])
        ->setNom($per['nom']);

        $manager->persist($new_per);
        $data = $manager->getClassMetadata(Personne::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       foreach ($genre as $gen){
        $new_gen = new Genre();
        $new_gen
        ->setId($gen['id'])
        ->setNom($gen['nom']);

        $manager->persist($new_gen);
        $data = $manager->getClassMetadata(Genre::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       foreach ($role as $ro){
        $new_ro = new Role();
        $new_ro
        ->setId($ro['id'])
        ->setNom($ro['nom']);

        $manager->persist($new_ro);
        $data = $manager->getClassMetadata(Role::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       foreach ($fournisseur as $four){
        $new_four = new Fournisseur();
        $new_four
        ->setId($four['id'])
        ->setNom($four['nom'])
        ->setAdresse($four['adresse'])
        ->setTelephone($four['telephone'])
        ->setEmail($four['email']);

        $manager->persist($new_four);
        $data = $manager->getClassMetadata(Fournisseur::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       foreach ($utilisateur as $uti){
        $new_uti = new Utilisateur();
        $new_uti
        ->setId($uti['id'])
        ->setEmail($uti['email'])
        ->setPassword($uti['password'])
        ->setNom($uti['nom'])
        ->setPrenom($uti['prenom'])
        ->setTelephone($uti['telephone'])
        ->setRoles()
        ->setCoefficient($uti['coefficient'])
        ->setResponsable($uti['responsable_id']);
       }

       $manager->flush();

       foreach ($r_film_perso as $asso_pp){
        $id_pro = (int)$asso_pp['id_pro'];
        $id_per = (int)$asso_pp['id_per'];

        $pro = $pro_repo->find($id_pro);
        $per = $per_repo->find($id_per);

        $pro->addPersonne($per);
        $manager->flush();
       }

       foreach ($r_genre_film as $asso_pg){
        $id_pro = (int)$asso_pg['id_pro'];
        $id_gen = (int)$asso_pg['id_gen'];

        $pro = $pro_repo->find($id_pro);
        $gen = $gen_repo->find($id_gen);

        $pro->addGenre($gen);
        $manager->flush();
       }

       foreach ($r_role_perso as $asso_ppr){
        $id_pro = (int)$asso_ppr['id_pro'];
        $id_per = (int)$asso_ppr['id_per'];
        $id_ro = (int)$asso_ppr['id_ro'];

        $pro = $pro_repo->find($id_pro);
        $per = $per_repo->find($id_per);
        $ro = $ro_repo->find($id_ro);

        $asso = new RolePersonneProduit();
        $asso
        ->setProduit($pro)
        ->setPersonne($per)
        ->setRole($ro);
        
        $manager->persist($asso);
        $manager->flush();
       }

       foreach ($r_fourni_film as $asso_pf){
        $id_pro = (int)$asso_pf['id_pro'];
        $id_four = (int)$asso_pf['id_four'];

        $pro = $pro_repo->find($id_pro);
        $four = $four_repo->find($id_four);

        $pro->addFournisseur($four);
        $manager->flush();        
       }
    }
}
