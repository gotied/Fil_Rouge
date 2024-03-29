<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Repository\RoleRepository;
use ApiPlatform\Metadata\ApiResource;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;

#[ORM\Entity(repositoryClass: RoleRepository::class)]
#[ApiResource]
class Role
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 30, nullable: true)]
    private ?string $nom = null;

    #[ORM\OneToMany(mappedBy: 'role', targetEntity: RolePersonneProduit::class)]
    private Collection $rolePersonneProduits;

    public function __construct()
    {
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
            $rolePersonneProduit->setRole($this);
        }

        return $this;
    }

    public function removeRolePersonneProduit(RolePersonneProduit $rolePersonneProduit): static
    {
        if ($this->rolePersonneProduits->removeElement($rolePersonneProduit)) {
            // set the owning side to null (unless already changed)
            if ($rolePersonneProduit->getRole() === $this) {
                $rolePersonneProduit->setRole(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        return $this->nom;
    }
}
