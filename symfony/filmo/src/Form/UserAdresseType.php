<?php

namespace App\Form;

use App\Entity\Adresse;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserAdresseType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('livraison', TextType::class, [
                'label' => 'Adresse de livraison'
            ])
            ->add('checkbox', CheckboxType::class, [
                'label' => 'Utiliser l\'adresse de livraison pour celle de facturation',
                'required' => false,
                'mapped' => false
            ])
            ->add('facturation', TextType::class, [
                'label' => 'Adresse de facturation',
                'required' => false
            ])
            ->add('Enregistrer', SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Adresse::class,
        ]);
    }
}
