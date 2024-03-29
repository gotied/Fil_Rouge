<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Metadata\ApiFilter;
use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use App\Repository\ProduitRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use ApiPlatform\Doctrine\Orm\Filter\SearchFilter;

#[ORM\Entity(repositoryClass: ProduitRepository::class)]
#[ApiResource]
#[ApiFilter(SearchFilter::class, 
  properties: [ "genres.id" => "exact"]  
)]
class Produit
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $titre = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $synopsis = null;

    #[ORM\Column(type: Types::DATE_IMMUTABLE, nullable: true)]
    private ?\DateTimeInterface $date_sortie = null;

    #[ORM\Column(length: 10, nullable: true)]
    private ?string $duree = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $image = null;
    
    #[ORM\Column(length: 255, nullable: true)]
    private ?string $bande_annonce = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 6, scale: 2, nullable: true)]
    private ?string $prix_ttc = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 6, scale: 2, nullable: true)]
    private ?string $prix_four = null;

    #[ORM\Column(nullable: true)]
    private ?int $stock = null;

    #[ORM\Column(nullable: true)]
    private ?bool $actif = null;

    #[ORM\ManyToMany(targetEntity: Personne::class, inversedBy: 'produits')]
    private Collection $personne;

    #[ORM\OneToMany(mappedBy: 'produit', targetEntity: RolePersonneProduit::class)]
    private Collection $rolePersonneProduits;

    #[ORM\ManyToMany(targetEntity: Genre::class, mappedBy: 'produit')]
    private Collection $genres;

    #[ORM\ManyToMany(targetEntity: Fournisseur::class, mappedBy: 'produit')]
    #[ApiProperty(readable: false)]
    private Collection $fournisseurs;

    #[ORM\OneToMany(mappedBy: 'produit', targetEntity: DetailsCommande::class)]
    #[ApiProperty(readable: false)]
    private Collection $detailsCommandes;


    public function __construct()
    {
        $this->personne = new ArrayCollection();
        $this->rolePersonneProduits = new ArrayCollection();
        $this->genres = new ArrayCollection();
        $this->fournisseurs = new ArrayCollection();
        $this->detailsCommandes = new ArrayCollection();
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

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(?string $titre): static
    {
        $this->titre = $titre;

        return $this;
    }

    public function getSynopsis(): ?string
    {
        return $this->synopsis;
    }

    public function setSynopsis(?string $synopsis): static
    {
        $this->synopsis = $synopsis;

        return $this;
    }

    public function getDateSortie(): ?\DateTimeInterface
    {
        return $this->date_sortie;
    }

    public function setDateSortie(?string $date_sortie): static
    {
        $this->date_sortie = $date_sortie ? new \DateTimeImmutable($date_sortie) : null;

        return $this;
    }

    public function getDuree(): ?string
    {
        return $this->duree;
    }

    public function setDuree(?string $duree): static
    {
        $this->duree = $duree;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): static
    {
        $this->image = $image;
        
        return $this;
    }
    
    public function getBandeAnnonce(): ?string
    {
        return $this->bande_annonce;
    }

    public function setBandeAnnonce(?string $bande_annonce): static
    {
        $this->bande_annonce = $bande_annonce;

        return $this;
    }
    
    public function getPrixTtc(): ?string
    {
        return $this->prix_ttc;
    }

    public function setPrixTtc(?string $prix_ttc): static
    {
        $this->prix_ttc = $prix_ttc;

        return $this;
    }

    public function getPrixFour(): ?string
    {
        return $this->prix_four;
    }

    public function setPrixFour(?string $prix_four): static
    {
        $this->prix_four = $prix_four;

        return $this;
    }

    public function getStock(): ?int
    {
        return $this->stock;
    }

    public function setStock(?int $stock): static
    {
        $this->stock = $stock;

        return $this;
    }

    public function isActif(): ?bool
    {
        return $this->actif;
    }

    public function setActif(?bool $actif): static
    {
        $this->actif = $actif;

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
            $rolePersonneProduit->setProduit($this);
        }

        return $this;
    }

    public function removeRolePersonneProduit(RolePersonneProduit $rolePersonneProduit): static
    {
        if ($this->rolePersonneProduits->removeElement($rolePersonneProduit)) {
            // set the owning side to null (unless already changed)
            if ($rolePersonneProduit->getProduit() === $this) {
                $rolePersonneProduit->setProduit(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Genre>
     */
    public function getGenres(): Collection
    {
        return $this->genres;
    }

    public function addGenre(Genre $genre): static
    {
        if (!$this->genres->contains($genre)) {
            $this->genres->add($genre);
            $genre->addProduit($this);
        }

        return $this;
    }

    public function removeGenre(Genre $genre): static
    {
        if ($this->genres->removeElement($genre)) {
            $genre->removeProduit($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, Fournisseur>
     */
    public function getFournisseurs(): Collection
    {
        return $this->fournisseurs;
    }

    public function addFournisseur(Fournisseur $fournisseur): static
    {
        if (!$this->fournisseurs->contains($fournisseur)) {
            $this->fournisseurs->add($fournisseur);
            $fournisseur->addProduit($this);
        }

        return $this;
    }

    public function removeFournisseur(Fournisseur $fournisseur): static
    {
        if ($this->fournisseurs->removeElement($fournisseur)) {
            $fournisseur->removeProduit($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, DetailsCommande>
     */
    public function getDetailsCommandes(): Collection
    {
        return $this->detailsCommandes;
    }

    public function addDetailsCommande(DetailsCommande $detailsCommande): static
    {
        if (!$this->detailsCommandes->contains($detailsCommande)) {
            $this->detailsCommandes->add($detailsCommande);
            $detailsCommande->setProduit($this);
        }

        return $this;
    }

    public function removeDetailsCommande(DetailsCommande $detailsCommande): static
    {
        if ($this->detailsCommandes->removeElement($detailsCommande)) {
            // set the owning side to null (unless already changed)
            if ($detailsCommande->getProduit() === $this) {
                $detailsCommande->setProduit(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        return $this->titre;
    }

}