<?php

namespace App\Tests\Repository;

use App\Repository\DetailsCommandeRepository;
use App\Repository\ProduitRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class RepositoryTest extends KernelTestCase {
    
    public function test() {

        self::bootKernel();
        $container = self::$kernel->getContainer();
        $repository = $container->get(ProduitRepository::class);
        $result = $repository->WRCNproduitASC('acteur', 'brad', 'pitt');
        $this->assertIsArray($result);
        dump($result);
    }
}