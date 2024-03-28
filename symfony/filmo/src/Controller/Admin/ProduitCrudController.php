<?php

namespace App\Controller\Admin;

use App\Entity\Produit;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProduitCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Produit::class;
    }
    
    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setPaginatorPageSize(8);
    }

    public function configureFields(string $pageName): iterable
    {
        yield IdField::new('id')->onlyOnIndex();
        yield TextField::new('titre');
        yield TextareaField::new('synopsis');
        yield DateField::new('date_sortie');
        yield TextField::new('duree');
        yield ImageField::new('image')
            ->setBasePath('img/affiche/')
            ->setUploadDir('public/img/affiche/');
        yield TextField::new('bande_annonce');
        yield NumberField::new('prix_ttc')
            ->setNumDecimals(2)
            ->setFormTypeOption('grouping', true);
        yield NumberField::new('prix_four')
            ->setNumDecimals(2)
            ->setFormTypeOption('grouping', true);
        yield IntegerField::new('stock');
        yield BooleanField::new('actif');
        yield AssociationField::new('genres')
            ->onlyOnForms()
            ->setFormTypeOption('by_reference', false);
    }
}
