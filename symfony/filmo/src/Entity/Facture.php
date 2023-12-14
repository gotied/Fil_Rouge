<?php

namespace App\Entity;

use App\Repository\FactureRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: FactureRepository::class)]
class Facture
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $mode_de_paiement = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $date_facture = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $date_paiement = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $date_limite = null;

    #[ORM\Column(nullable: true)]
    private ?bool $payer = null;

    #[ORM\OneToOne(inversedBy: 'facture')]
    private ?Commande $commande = null;

    public function getId(): ?int
    {
        return $this->id;
    }

     /**
     * Set the value of id
     *
     * @return  self
     */ 
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    public function getModeDePaiement(): ?string
    {
        return $this->mode_de_paiement;
    }

    public function setModeDePaiement(?string $mode_de_paiement): static
    {
        $this->mode_de_paiement = $mode_de_paiement;

        return $this;
    }

    public function getDateFacture(): ?\DateTimeInterface
    {
        return $this->date_facture;
    }

    public function setDateFacture(?string $date_facture): static
    {
        $this->date_facture = $date_facture ? new \DateTime($date_facture) : null;

        return $this;
    }

    public function getDatePaiement(): ?\DateTimeInterface
    {
        return $this->date_paiement;
    }

    public function setDatePaiement(?string $date_paiement): static
    {
        $this->date_paiement = $date_paiement ? new \DateTime($date_paiement) : null;

        return $this;
    }

    public function isPayer(): ?bool
    {
        return $this->payer;
    }

    public function setPayer(?bool $payer): static
    {
        $this->payer = $payer;

        return $this;
    }

    public function getDateLimite(): ?\DateTimeInterface
    {
        return $this->date_limite;
    }

    public function setDateLimite(?string $date_limite): static
    {
        $this->date_limite = $date_limite ? new \DateTime($date_limite) : null;

        return $this;
    }

    public function getCommande(): ?Commande
    {
        return $this->commande;
    }

    public function setCommande(?Commande $commande): static
    {
        // unset the owning side of the relation if necessary
        if ($commande === null && $this->commande !== null) {
            $this->commande->setFacture(null);
        }

        // set the owning side of the relation if necessary
        if ($commande !== null && $commande->getFacture() !== $this) {
            $commande->setFacture($this);
        }

        $this->commande = $commande;

        return $this;
    }
}
