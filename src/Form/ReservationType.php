<?php

namespace App\Form;

use App\Entity\Client;
use App\Entity\Chambre;
use App\Form\ClientType;
use App\Entity\Reservation;
use App\Repository\ChambreRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReservationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $chambreId = $options['chambre_id'] ?? null;

        $builder
            ->add('chambre', EntityType::class, [
                'class' => Chambre::class,
                'choice_label' => function (Chambre $chambre) {
                    return $chambre->getChambreLabel();
                },
                'query_builder' => function (ChambreRepository $chambreRepository) use ($chambreId) {
                    $queryBuilder = $chambreRepository->createQueryBuilder('c')
                        ->where('c.occupee = :occupee')
                        ->setParameter('occupee', false);

                    if ($chambreId !== null) {
                        $queryBuilder->andWhere('c.id = :id')->setParameter('id', $chambreId);
                    }

                    return $queryBuilder;
                },
            ])
            ->add('client', ClientType::class, [
                'label' => false
            ]);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Reservation::class,
            'chambre_id' => null,
        ]);
    }
}
