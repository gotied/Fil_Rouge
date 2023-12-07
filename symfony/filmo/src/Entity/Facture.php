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

    #[ORM\Column(nullable: true)]
    private ?bool $payer = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $date_limite = null;

    #[ORM\OneToOne(mappedBy: 'facture', cascade: ['persist', 'remove'])]
    private ?Commande $commande = null;

    public function getId(): ?int
    {
        return $this->id;
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

    public function setDateFacture(?\DateTimeInterface $date_facture): static
    {
        $this->date_facture = $date_facture;

        return $this;
    }

    public function getDatePaiement(): ?\DateTimeInterface
    {
        return $this->date_paiement;
    }

    public function setDatePaiement(?\DateTimeInterface $date_paiement): static
    {
        $this->date_paiement = $date_paiement;

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

    public function setDateLimite(?\DateTimeInterface $date_limite): static
    {
        $this->date_limite = $date_limite;

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
