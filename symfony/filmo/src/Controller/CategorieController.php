<?php

namespace App\Controller;

use App\Repository\GenreRepository;
use App\Repository\PersonneRepository;
use App\Repository\RoleRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategorieController extends AbstractController
{
    #[Route('/categorie', name: 'app_categorie')]
    public function index(GenreRepository $genreRepo, RoleRepository $roleRepo, PersonneRepository $perRepo, PaginatorInterface $paginator, Request $request): Response
    {
        $genrePa = $paginator->paginate($genreRepo->allGenre(), $request->query->getInt('page', 1), 14, [PaginatorInterface::SORT_FIELD_PARAMETER_NAME => 'page-genre']);
        $rolePa = $paginator->paginate($roleRepo->allRole(), $request->query->getInt('page', 1), 14, [PaginatorInterface::SORT_FIELD_PARAMETER_NAME => 'page-role']);
        $perPa =$paginator->paginate($perRepo->WRper($request->query->get('role', )), $request->query->getInt('page', 1), 12, [PaginatorInterface::SORT_FIELD_PARAMETER_NAME => 'page-cast']);
        return $this->render('categorie/index.html.twig', [
            'genrePa' => $genrePa,
            'rolePa' => $rolePa,
            'perPa' => $perPa    
        ]);
    }
}
