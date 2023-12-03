<?php

namespace App\Entity;

use App\Repository\RoleRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RoleRepository::class)]
class Role
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 30, nullable: true)]
    private ?string $nom = null;

    #[ORM\ManyToMany(targetEntity: Personne::class, inversedBy: 'roles')]
    private Collection $personne;

    #[ORM\ManyToMany(targetEntity: Produit::class, inversedBy: 'roles')]
    private Collection $produit;

    public function __construct()
    {
        $this->personne = new ArrayCollection();
        $this->produit = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(?string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * @return Collection<int, Personne>
     */
    public function getPersonne(): Collection
    {
        return $this->personne;
    }

    public function addPersonne(Personne $personne): static
    {
        if (!$this->personne->contains($personne)) {
            $this->personne->add($personne);
        }

        return $this;
    }

    public function removePersonne(Personne $personne): static
    {
        $this->personne->removeElement($personne);

        return $this;
    }

    /**
     * @return Collection<int, Produit>
     */
    public function getProduit(): Collection
    {
        return $this->produit;
    }

    public function addProduit(Produit $produit): static
    {
        if (!$this->produit->contains($produit)) {
            $this->produit->add($produit);
        }

        return $this;
    }

    public function removeProduit(Produit $produit): static
    {
        $this->produit->removeElement($produit);

        return $this;
    }
}
