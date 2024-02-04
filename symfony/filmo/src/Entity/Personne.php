<?php

namespace App\Entity;

use App\Repository\PersonneRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PersonneRepository::class)]
class Personne
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $prenom = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $nom = null;

    #[ORM\ManyToMany(targetEntity: Produit::class, mappedBy: 'personne')]
    private Collection $produits;

    #[ORM\OneToMany(mappedBy: 'personne', targetEntity: RolePersonneProduit::class)]
    private Collection $rolePersonneProduits;

    public function __construct()
    {
        $this->produits = new ArrayCollection();
        $this->rolePersonneProduits = new ArrayCollection();
    }

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
    
    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(?string $prenom): static
    {
        $this->prenom = $prenom;

        return $this;
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
     * @return Collection<int, Produit>
     */
    public function getProduits(): Collection
    {
        return $this->produits;
    }

    public function addProduit(Produit $produit): static
    {
        if (!$this->produits->contains($produit)) {
            $this->produits->add($produit);
            $produit->addPersonne($this);
        }

        return $this;
    }

    public function removeProduit(Produit $produit): static
    {
        if ($this->produits->removeElement($produit)) {
            $produit->removePersonne($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, RolePersonneProduit>
     */
    public function getRolePersonneProduits(): Collection
    {
        return $this->rolePersonneProduits;
    }

    public function addRolePersonneProduit(RolePersonneProduit $rolePersonneProduit): static
    {
        if (!$this->rolePersonneProduits->contains($rolePersonneProduit)) {
            $this->rolePersonneProduits->add($rolePersonneProduit);
            $rolePersonneProduit->setPersonne($this);
        }

        return $this;
    }

    public function removeRolePersonneProduit(RolePersonneProduit $rolePersonneProduit): static
    {
        if ($this->rolePersonneProduits->removeElement($rolePersonneProduit)) {
            // set the owning side to null (unless already changed)
            if ($rolePersonneProduit->getPersonne() === $this) {
                $rolePersonneProduit->setPersonne(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        return $this->prenom.' '.$this->nom;
    }
}
