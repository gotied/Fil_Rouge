<?php

namespace App\Controller;

use App\Entity\Adresse;
use App\Entity\Commande;
use App\Entity\Utilisateur;
use App\Form\UserAdresseType;
use App\Form\UserEmailType;
use App\Form\UserNameType;
use App\Form\UserPasswordType;
use App\Form\UserTelType;
use App\Security\EmailVerifier;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Address;
use Symfony\Component\Mime\Email;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('ROLE_USER')]
class ProfilController extends AbstractController
{
    private EmailVerifier $emailVerifier;
    private $passwordHasher;
    private $mailer;

    public function __construct(EmailVerifier $emailVerifier, UserPasswordHasherInterface $passwordHasher, MailerInterface $mailer)
    {
        $this->emailVerifier = $emailVerifier;
        $this->passwordHasher = $passwordHasher;
        $this->mailer = $mailer;
    }

    #[Route('/profil', name: 'app_profil')]
    public function index(Security $security): Response
    {
        $user = $security->getUser();
        $isVerified = $user->getIsVerified();

        if (!$isVerified) {
            $this->addFlash('error', 'Veuillez vérifier votre adresse email pour continuer.');
            return $this->redirectToRoute('app_login');
        }

        if ($security->isGranted('ROLE_CLIENT')) {
           return $this->redirectToRoute('app_profil_client');
        }
        
        if ($security->isGranted('ROLE_CLIENT_PRO')) {
            return $this->redirectToRoute('app_profil_client_pro');
        }

        if ($security->isGranted('ROLE_COMMERCIAL') or $security->isGranted('ROLE_COMMERCIAL_PRO') or $security->isGranted('ROLE_GERANT') ) {
            return $this->redirectToRoute('admin');
        }
        
        return $this->render('profil/index.html.twig');
    }

    #[Route('/profil/client', name:'app_profil_client')]
    public function profil_customer(Request $request, Security $security, EntityManagerInterface $entityManager): Response 
    {
        $this->denyAccessUnlessGranted('ROLE_CLIENT');
        $user = $security->getUser();
        $nameForm = $this->createForm(UserNameType::class);
        $nameForm->handleRequest($request);
        if($nameForm->isSubmitted() && $nameForm->isValid()) {
            $data = $nameForm->getData();
            $user->setNom($data->getNom());
            $user->setPrenom($data->getPrenom());
            
            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash('success', 'Informations enregistrées avec succès.');
            return $this->redirectToRoute('app_profil_client');
        }

        $telForm = $this->createForm(UserTelType::class);
        $telForm->handleRequest($request);
        if ($telForm->isSubmitted() && $telForm->isValid()) {
            $data = $telForm->getData();
            $user->setTelephone($data->getTelephone());

            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash('success', 'Informations enregistrées avec succès.');
            return $this->redirectToRoute('app_profil_client');
        }

        $emailForm = $this->createForm(UserEmailType::class);
        $emailForm->handleRequest($request);
        if ($emailForm->isSubmitted() && $emailForm->isValid()) {
            $data = $emailForm->getData();
            $user->setEmail($data->getEmail());
            $user->setIsVerified(false);

            $entityManager->persist($user);
            $entityManager->flush();

            $this->emailVerifier->sendEmailConfirmation('app_verify_email', $user,
            (new TemplatedEmail())
                ->from(new Address('noreply@filmo.com'))
                ->to($user->getEmail())
                ->subject('Confirmation de votre nouvelle adresse email')
                ->htmlTemplate('registration/confirmation_email.html.twig')
            );
            $this->addFlash('success', 'Un courriel de confirmation pour votre adresse email vous a été envoyé.');
            return $this->redirectToRoute('app_profil_client');
        }

        $passwordForm = $this->createForm(UserPasswordType::class);
        $passwordForm->handleRequest($request);
        if ($passwordForm->isSubmitted() && $passwordForm->isValid()) {
            $user = $security->getUser();
            assert($user instanceof \Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface);
            $data = $this->passwordHasher->hashPassword($user, $passwordForm->get('plainPassword')->getData());
            $user->setPassword($data);

            $entityManager->persist($user);
            $entityManager->flush();

            // TODO: Templated email
            $email = (new Email())
                ->from('noreply@filmo.com')
                ->to($user->getEmail())
                ->subject('Mot de passe modifié')
                ->text('Nous vous informons que votre mot de passe à été modifier le '.date('d-m-Y H:i:s'));
            $this->mailer->send($email);

            $this->addFlash('success', 'Votre nouveau mot de passe est enregistré avec succès.');
            return $this->redirectToRoute('app_profil_client');
        }

        $adresseForm = $this->createForm(UserAdresseType::class);
        $adresseForm->handleRequest($request);
        if ($adresseForm->isSubmitted() && $adresseForm->isValid()) {
            $livraison = $adresseForm->get('livraison')->getData();
            $checkbox = $adresseForm->get('checkbox')->getData();
            $facturation = $adresseForm->get('facturation')->getData();

            $adresse = new Adresse();
            if ($request->query->get('action') === 'ajouter') {
                if ($checkbox) {
                    $adresse
                        ->setLivraison($livraison)
                        ->setFacturation($livraison)
                        ->setUtilisateur($user);
                }
                elseif(!$facturation) {
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
            }
            if ($request->query->get('action') === 'modifier') {
                $adresse = $entityManager->getRepository(Adresse::class)->find($request->query->get('adresse_id'));
                if ($adresse) {
                    if ($checkbox) {
                        $adresse
                            ->setLivraison($livraison)
                            ->setFacturation($livraison)
                            ->setUtilisateur($user);
                    }
                    elseif(!$facturation) {
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

                }
            }
            $entityManager->persist($adresse);
            $entityManager->flush();

            $this->addFlash('success', 'Informations enregistrées avec succès.');
            return $this->redirectToRoute('app_profil_client');
        }

        if ($request->query->get('action') === 'supprimer') {
            $adresse = $entityManager->getRepository(Adresse::class)->find($request->query->get('adresse_id'));
            if ($adresse) {
                $entityManager->remove($adresse);
                $entityManager->flush();

                $this->addFlash('success', 'Adresse supprimée avec succès.');
                return $this->redirectToRoute('app_profil_client');
            }
        }

        if ($request->query->get('action') === 'annuler') {
            $commande = $entityManager->getRepository(Commande::class)->find($request->query->get('commande_id'));
            if ($commande) {
                $commande->setEtat(4);
                $entityManager->persist($commande);
                $entityManager->flush();

                // TODO: Templated email
                $email = (new Email())
                    ->from('noreply@filmo.com')
                    ->to($user->getEmail())
                    ->subject('Annulation commande')
                    ->text('Nous vous informons que votre commande du '.$commande->getDateCommande()->format('d-m-Y').' a bien été annulée.');
                $this->mailer->send($email);

                $this->addFlash('success', 'Commande annulée avec succès.');
                return $this->redirectToRoute('app_profil_client');
            }
        }

        $commandeUser = $entityManager->getRepository(Utilisateur::class)->userCommande($user);
        $detailsCommande = $entityManager->getRepository(Utilisateur::class)->detailsCommande($user);
        $userAdresse = $entityManager->getRepository(Utilisateur::class)->userAdresse($user);
        usort($commandeUser, function($a, $b) {
            return $b['date_commande'] <=> $a['date_commande'];
        });

        return $this->render('profil/client.html.twig', [
            'nameForm' => $nameForm,
            'telForm' => $telForm,
            'emailForm' => $emailForm,
            'passwordForm' => $passwordForm,
            'adresseForm' => $adresseForm,
            'commandeUser' => $commandeUser,
            'detailsCommande' => $detailsCommande,
            'userAdresse' => $userAdresse
        ]);
    }

    #[Route('/profil/client_pro', name:'app_profil_client_pro')]
    public function profil_customer_pro(Security $security, EntityManagerInterface $entityManager): Response 
    {
        $this->denyAccessUnlessGranted('ROLE_CLIENT_PRO');

        $user = $security->getUser();
        $commandeUser = $entityManager->getRepository(Utilisateur::class)->CPcommande($user);
        $commandeDetails = $entityManager->getRepository(Utilisateur::class)->CPcommandeDetails($user);
        $commercial = $entityManager->getRepository(Utilisateur::class)->CPresponsable($user->getResponsable());
        
        return $this->render('profil/client_pro.html.twig', [
            'commandeUser' => $commandeUser,
            'commandeDetails' => $commandeDetails,
            'commercial' => $commercial
        ]);
    }
}
