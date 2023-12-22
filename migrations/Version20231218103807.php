<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231218103807 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE menage DROP FOREIGN KEY FK_D1F20C8A9B177F54');
        $this->addSql('DROP TABLE menage');
        $this->addSql('ALTER TABLE chambre ADD menage TINYINT(1) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE menage (id INT AUTO_INCREMENT NOT NULL, chambre_id INT DEFAULT NULL, done TINYINT(1) NOT NULL, UNIQUE INDEX UNIQ_D1F20C8A9B177F54 (chambre_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE menage ADD CONSTRAINT FK_D1F20C8A9B177F54 FOREIGN KEY (chambre_id) REFERENCES chambre (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE chambre DROP menage');
    }
}
