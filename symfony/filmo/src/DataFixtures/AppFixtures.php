<?php

namespace App\DataFixtures;

use App\Entity\Adresse;
use App\Entity\Commande;
use App\Entity\DetailsCommande;
use App\Entity\Facture;
use App\Entity\Fournisseur;
use App\Entity\Genre;
use App\Entity\Livraison;
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
       $co_repo = $manager->getRepository(Commande::class);

       foreach ($produit as $pro){
        $new_pro = new Produit();
        $new_pro
        ->setId($pro['id'])
        ->setTitre($pro['titre'])
        ->setSynopsis($pro['synopsis'])
        ->setDateSortie($pro['date_sortie'])
        ->setDuree($pro['duree'])
        ->setImage($pro['image'])
        ->setPrixTtc($pro['prix_ttc'])
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
        // TODO: hash password
        ->setNom($uti['nom'])
        ->setPrenom($uti['prenom'])
        ->setTelephone($uti['telephone'])
        ->setRoles(['ROLE_USER'])
        ->setCoefficient($uti['coefficient']);

        $manager->persist($new_uti);
        $data = $manager->getClassMetadata(Utilisateur::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       $manager->flush();

       foreach ($adresse as $ad){
        $new_ad = new Adresse();
        $new_ad
        ->setId($ad['id'])
        ->setLivraison($ad['livraison'])
        ->setFacturation($ad['facturation']);

        $user = $uti_repo->find((int)$ad['id_uti']);
        $new_ad->setUtilisateur($user);

        $manager->persist($new_ad);
        $data = $manager->getClassMetadata(Adresse::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       foreach ($commande as $co){
        $new_co = new Commande();
        $new_co
        ->setId($co['id'])
        ->setDateCommande($co['date_commande'])
        ->setTotal($co['total'])
        ->setEtat($co['etat']);

        $user = $uti_repo->find((int)$co['id_uti']);
        $new_co->setUtilisateur($user);

        $manager->persist($new_co);
        $data = $manager->getClassMetadata(Commande::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       $manager->flush();

       foreach ($details_commande as $dc){
        $pro = $pro_repo->find((int)$dc['id_pro']);
        $co = $co_repo->find((int)$dc['id_co']);

        $new_dc = new DetailsCommande();
        $new_dc
        ->setQuantite($dc['quantite'])
        ->setProduit($pro)
        ->setCommande($co);

        $manager->persist($new_dc);
       }

       foreach ($facture as $fac){
        $co = $co_repo->find((int)$fac['id_co']);

        $new_fac = new Facture();
        $new_fac
        ->setId($fac['id'])
        ->setModeDePaiement($fac['mode_de_paiement'])
        ->setDateFacture($fac['date_facture'])
        ->setDatePaiement($fac['date_paiement'])
        ->setDateLimite($fac['date_limite'])
        ->setPayer($fac['payer'])
        ->setCommande($co);

        $manager->persist($new_fac);
        $data = $manager->getClassMetadata(Facture::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

       foreach ($livraison as $li){
        $co = $co_repo->find((int)$li['id_co']);

        $new_li = new Livraison();
        $new_li
        ->setId($li['id'])
        ->setDateLivraison($li['date_livraison'])
        ->setCommande($co);

        $manager->persist($new_li);
        $data = $manager->getClassMetadata(Livraison::class);
        $data->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
       }

        $user = $uti_repo->findAll();
        $com_par = $uti_repo->findOneBy(['id' => 13]);
        $com_pro = $uti_repo->findOneBy(['id' => 14]);
        foreach ($user as $u){
            $user_id = $u->getId();
            if ($user_id >= 1 && $user_id <= 9){
                $u->setResponsable($com_par);
                $u->setRoles(['ROLE_CLIENT']);
            }
            if ($user_id >= 10 && $user_id <= 12){
                $u->setResponsable($com_pro);
                $u->setRoles(['ROLE_CLIENT_PRO']);
            }
            if ($user_id === 13){
               $u->setRoles(['ROLE_COMMERCIAL']);
            }
            if ($user_id === 14){
                $u->setRoles(['ROLE_COMMERCIAL_PRO']);
            }
            if ($user_id === 15){
                $u->setRoles(['ROLE_GERANT']);
            }
        }
        
       foreach ($r_film_perso as $asso_pp){
        $pro = $pro_repo->find((int)$asso_pp['id_pro']);
        $per = $per_repo->find((int)$asso_pp['id_per']);

        $pro->addPersonne($per);
        $manager->flush();
       }

       foreach ($r_genre_film as $asso_pg){
        $pro = $pro_repo->find((int)$asso_pg['id_pro']);
        $gen = $gen_repo->find((int)$asso_pg['id_gen']);

        $pro->addGenre($gen);
        $manager->flush();
       }

       foreach ($r_role_perso as $asso_ppr){
        $pro = $pro_repo->find((int)$asso_ppr['id_pro']);
        $per = $per_repo->find((int)$asso_ppr['id_per']);
        $ro = $ro_repo->find((int)$asso_ppr['id_ro']);

        $asso = new RolePersonneProduit();
        $asso
        ->setProduit($pro)
        ->setPersonne($per)
        ->setRole($ro);
        
        $manager->persist($asso);
        $manager->flush();
       }

       foreach ($r_fourni_film as $asso_pf){
        $pro = $pro_repo->find((int)$asso_pf['id_pro']);
        $four = $four_repo->find((int)$asso_pf['id_four']);

        $pro->addFournisseur($four);
        $manager->flush();        
       }
    }
}
