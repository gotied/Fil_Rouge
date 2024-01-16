<?php

namespace App\EventSubscriber;

use App\Entity\Contact;
use Doctrine\Common\EventSubscriber;
use Doctrine\ORM\Events;
use Doctrine\Persistence\Event\LifecycleEventArgs;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;

class ContactSubscriber implements EventSubscriber
{
    private $mailer;

    public function __construct(MailerInterface $mailer)
    {
        $this->mailer = $mailer;
    }

    public function getSubscribedEvents()
    {
        return [
            Events::postPersist,
        ];
    }

    public function postPersist(LifecycleEventArgs $args)
    {
        $entity = $args->getObject();
        
        if ($entity instanceof \App\Entity\Contact) {
            
            $expediteur = $entity->getEmail();
            $objet = $entity->getObjet();
            $message = $entity->getMessage();

            $email = (new Email())
                    ->from($expediteur)
                    ->to('admin@filmo.com')
                    ->subject('Contact')
                    ->text("Expéditeur : " .$expediteur. " \n Objet du message : " .$objet. " \n Texte du message : " .$message);

                $this->mailer->send($email);
        }
    }
}