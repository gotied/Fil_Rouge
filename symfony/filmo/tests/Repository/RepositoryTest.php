<?php

namespace App\Tests\Repository;

use App\Repository\DetailsCommandeRepository;
use App\Repository\GenreRepository;
use App\Repository\PersonneRepository;
use App\Repository\ProduitRepository;
use App\Repository\RoleRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class RepositoryTest extends KernelTestCase {
    
    public function test() {

        self::bootKernel();
        $container = self::$kernel->getContainer();
        $repository = $container->get(ProduitRepository::class);
        $result = $repository->recherche('acteur');
        $this->assertIsArray($result);
        dump($result);
    }
}