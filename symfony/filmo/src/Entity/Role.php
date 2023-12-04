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
}
