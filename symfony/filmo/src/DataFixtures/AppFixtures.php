<?php

namespace App\DataFixtures;

use App\Entity\Genre;
use App\Entity\Personne;
use App\Entity\Produit;
use App\Entity\Role;
use app\Repository\PersonneRepository;
use app\Repository\ProduitRepository;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
       include 'public/sql/insert_fixtures.php';
       $pro_repo = $manager->getRepository(Produit::class);
       $per_repo = $manager->getRepository(Personne::class);

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

    //    foreach ($genre as $gen){
    //     $new_gen = new Genre();
    //     $new_gen
    //     ->setId($gen['id'])
    //     ->setNom($gen['nom']);
    //     $manager->persist($new_gen);
    //    }

    //    foreach ($role as $ro){
    //     $new_ro = new Role();
    //     $new_ro
    //     ->setId($ro['id'])
    //     ->setNom($ro['nom']);
    //     $manager->persist($new_ro);
    //    }

       $manager->flush();

       foreach ($r_film_perso as $asso_pp){
        $id_pro = (int)$asso_pp['id_pro'];
        $id_per = (int)$asso_pp['id_per'];
        $pro = $pro_repo->find($id_pro);
        $per = $per_repo->find($id_per);

        // $id_produit = $pro->getId();
        // $id_personne = $per->getId();

        // var_dump($id_produit, $id_personne);
        // var_dump($id_pro, $id_per);
        // var_dump($pro, $per);
        // dd($pro, $per);
        if ($pro && $per){
          $new_pro->addPersonne($per);
         // $new_per->addProduit($pro);

         $manager->flush();
        }
       }
    }
}
