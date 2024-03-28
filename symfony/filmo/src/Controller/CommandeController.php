<?php

namespace App\Controller;

use DateTime;
use DateTimeZone;
use App\Entity\Adresse;
use App\Entity\Facture;
use App\Entity\Produit;
use App\Service\Panier;
use App\Entity\Commande;
use App\Entity\Livraison;
use App\Entity\Utilisateur;
use App\Form\UserAdresseType;
use App\Entity\DetailsCommande;
use Doctrine\ORM\EntityManagerInterface;
use \Symfony\Bundle\SecurityBundle\Security;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[IsGranted('ROLE_USER')]
class CommandeController extends AbstractController
{
    #[Route('/commande', name: 'app_commande')]
    public function index(Request $request, Security $security, EntityManagerInterface $entityManager): Response
    {
        $user = $security->getUser();
        if (empty($user->getNom()) and empty($user->getPrenom()) ) {
            $this->addFlash('warning', 'Veuillez renseigner votre nom, prénom et numéro de téléphone pour commander.');
            return $this->redirectToRoute('app_profil');
        }
        $userAdresse = $entityManager->getRepository(Utilisateur::class)->userAdresse($user);
        $request->getSession()->remove('modal');
        if (empty($request->getSession()->get('detailsPanier'))) {
            $this->addFlash('info', 'Votre panier est vide.');
            return $this->redirectToRoute('app_produit');
        }
        
        $adresseForm = $this->createForm(UserAdresseType::class);
        $adresseForm->handleRequest($request);
        if ($adresseForm->isSubmitted() && $adresseForm->isValid()) {
            $livraison = $adresseForm->get('livraison')->getData();
            $checkbox = $adresseForm->get('checkbox')->getData();
            $facturation = $adresseForm->get('facturation')->getData();

            $adresse = new Adresse();
            if ($checkbox) {
                $adresse
                    ->setLivraison($livraison)
                    ->setFacturation($livraison)
                    ->setUtilisateur($user);
            }
            elseif (!$facturation) {
                $adresse
                    ->setLivraison($livraison)
                    ->setUtilisateur($user);
            }
            else {
                $adresse
                    ->setLivraison($livraison)
                    ->setFacturation($facturation)
                    ->setUtilisateur($user);
            }
            $entityManager->persist($adresse);
            $entityManager->flush();

            $this->addFlash('success', 'Informations enregistrées avec succès.');
            return $this->redirectToRoute('app_commande');
        }
        
        return $this->render('commande/index.html.twig', [
            'userAdresse' => $userAdresse,
            'adresseForm' => $adresseForm
        ]);
    }

    #[Route('/apply/discount', name: 'apply_discount', methods: ['POST'])]
    public function applyDiscount(Request $request, Panier $panier)
    {
        // TODO: Amelioration du code, vérification du pattern, 
        // enregistrement (dans la base de donnée ?) de plusieurs codes et leurs pourcentages
        $discountCode = $request->request->get('discount_code');
        $valideDiscountCode = 'BESTDISCOUNTCODE';
        $discountPercentage = 1;
        $totalAfterDiscount = null;
        if ($request->getSession()->get('discount_applied') and $discountCode == $valideDiscountCode) {
            $this->addFlash('discount-warning', 'Ce code de réduction a déjà été appliqué.');
            return $this->redirectToRoute('app_commande');
        }
        if ($discountCode == $valideDiscountCode) {
            $total = $panier->getTotal();
            $totalAfterDiscount = $total - ($total * ($discountPercentage / 100));
            $request->getSession()->set('totalApresReduction', $totalAfterDiscount);
            $request->getSession()->set('discount_applied', true);
            $this->addFlash('discount-success', 'Le code de réduction a été appliqué avec succès !');
        } elseif (empty($discountCode)) {
            $this->addFlash('discount-warning', 'Aucun code de réduction renseigné.');
        } else {
            $this->addFlash('discount-warning', 'Le code de réduction est incorrect.');
        }
        return $this->redirectToRoute('app_commande');
    }

    // TODO: relation entre entité commande et adresse (pour récupération de données)
    #[Route('/address/validation', name: 'address_validation', methods: ['POST'])]
    public function addressValidation(Request $request, EntityManagerInterface $entityManager) 
    {
        // TODO: changement de méthode, récupération d'id via a href ?
        $adresse_id = $request->request->get('adresse');
        $adresse = $entityManager->getRepository(Adresse::class)->findBy(['id' => $adresse_id]);
        $request->getSession()->set('adresseCommande', $adresse);
        $request->getSession()->remove('collapse');
        return $this->redirectToRoute('app_commande');
    }

    #[Route('/address/remove', name:'address_remove')]
    public function addressRemove(Request $request) 
    {
        $request->getSession()->remove('adresseCommande');
        $request->getSession()->set('collapse', true);
        return $this->redirectToRoute('app_commande');
    }

    #[Route('/paiement/validation', name:'paiement_validation', methods:['POST'])]
    public function paiemantValidation(Request $request) 
    {
        $mode_de_paiement = $request->request->get('modeDePaiement');
        $request->getSession()->set('mode_de_paiement', $mode_de_paiement);
        return $this->redirectToRoute('app_commande');
    }
    
    #[Route('/paiement/remove', name:'paiement_remove')]
    public function paiementRemove(Request $request)
    {
        $request->getSession()->remove('mode_de_paiement');
        return $this->redirectToRoute('app_commande');
    }

    #[Route('/commande/validation', name:'commande_validation')]
    public function commandeValidation(Request $request, Security $security, EntityManagerInterface $entityManager, MailerInterface $mailer, Panier $panierService)
    {
        $panier = $request->getSession()->get('detailsPanier');
        if ($request->getSession()->get('totalApresReduction')) {
            $total = $request->getSession()->get('totalApresReduction');
        } else {
            $total = $request->getSession()->get('total');
        }
        $adresse = $request->getSession()->get('adresseCommande');
        $paiement = $request->getSession()->get('mode_de_paiement');
        
        /** @var \DateTime|null $date */
        $date = new DateTime();
        $date->setTimezone(new DateTimeZone('Europe/Paris'));
        $date_commande = $date->format('Y-m-d H:i:s');

        $commande = new Commande();
        $commande
            ->setDateCommande($date_commande)
            ->setTotal($total)
            ->setEtat(0)
            ->setUtilisateur($security->getUser());

        $entityManager->persist($commande);
        $entityManager->flush();

        foreach ($panier as $detailsPanier) {
            $details = new DetailsCommande();
            $product = $entityManager->getRepository(Produit::class)->find($detailsPanier['product']->getId());
            $details
                ->setQuantite($detailsPanier['quantity'])
                ->setCommande($commande)
                ->setProduit($product);

            $entityManager->persist($details);
        }
        $entityManager->flush();

        $date_facture = $date->format('Y-m-d');
        $facture = new Facture();
        $facture
            ->setModeDePaiement($paiement)
            ->setDateFacture($date_facture)
            ->setCommande($commande);
        
        $entityManager->persist($facture);
        $entityManager->flush();

        $livraison = new Livraison();
        $livraison->setCommande($commande);

        $entityManager->persist($livraison);
        $entityManager->flush();

        $email = (new TemplatedEmail())
            ->from('noreply@filmo.com')
            ->to($security->getUser()->getEmail())
            ->subject('Merci pour votre commande')
            ->htmlTemplate('commande/confirmation_order.html.twig')
            ->context([
                'date_commande' => $date_commande
            ]);
        $mailer->send($email);

        $user = $security->getUser();
        $userName = $user->getPrenom().' '.$user->getNom();
        $userEmail = $user->getEmail();
        $userTel = $user->getTelephone();
        
        $taxe = 20;
        $totalHT = 0;
        foreach ($panier as $details) { 
            $prixTTC = $details['product']->getPrixTtc();
            $prixHT[] = round($prixTTC / (1 + ($taxe / 100)), 2);
            $totalHT += end($prixHT) * $details['quantity'];
        }

        $email = (new TemplatedEmail())
            ->from('noreply@filmo.com')
            ->to($security->getUser()->getEmail())
            ->subject('Votre facture pour la commande du '.$date_facture)
            ->htmlTemplate('commande/bill_order.html.twig')
            ->context([
                'date_commande' => $date_commande,
                'user' => $userName,
                'userEmail' => $userEmail,
                'tel' => $userTel,
                'userAdresse' => $adresse,
                'product' => $panier,
                'prixHT' => $prixHT,
                'totalHT' => $totalHT,
                'total' => $total,
                'paiement' => $paiement
            ]);
            $mailer->send($email);
        
        $panierService->dropPanier();
        $request->getSession()->remove('totalApresReduction');
        $request->getSession()->remove('discount_applied');
        $request->getSession()->remove('adresseCommande');
        $request->getSession()->remove('mode_de_paiement');    
        $this->addFlash('success', 'Votre commande est bien enregistrée, veuillez vérifier vos emails.');
        return $this->redirectToRoute('app_profil');
    }

    // TODO: validation commande; enregistrement, envois du mail de confirmation (templated), 
    // génération pdf (envois par mail ?, génération lien pdf facture/livraison profil)
}
