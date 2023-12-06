<?php

namespace App\DataFixtures;

use App\Entity\Genre;
use App\Entity\Personne;
use App\Entity\Produit;
use App\Entity\Role;
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
       }

       foreach ($personne as $per){
        $new_per = new Personne();
        $new_per
        ->setId($per['id'])
        ->setPrenom($per['prenom'])
        ->setNom($per['nom']);
        $manager->persist($new_per);
       }

       foreach ($genre as $gen){
        $new_gen = new Genre();
        $new_gen
        ->setId($gen['id'])
        ->setNom($gen['nom']);
        $manager->persist($new_gen);
       }

       foreach ($role as $ro){
        $new_ro = new Role();
        $new_ro
        ->setId($ro['id'])
        ->setNom($ro['nom']);
        $manager->persist($new_ro);
       }
       
        $manager->flush();
    }
}
