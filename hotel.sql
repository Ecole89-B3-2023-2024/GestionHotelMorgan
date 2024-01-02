-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 02 jan. 2024 à 09:40
-- Version du serveur : 8.0.35-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int NOT NULL,
  `numero_chambre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_places` int NOT NULL,
  `occupee` tinyint(1) NOT NULL,
  `menage` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id`, `numero_chambre`, `nombre_places`, `occupee`, `menage`) VALUES
(1, '101', 6, 0, 0),
(2, '102', 4, 0, 0),
(3, '103', 2, 0, 0),
(4, '104', 2, 0, 0),
(5, '105', 2, 0, 0),
(6, '106', 3, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `prenom`, `nom`, `email`, `adresse`, `postal`) VALUES
(10, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(11, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(12, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(13, 'momo', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(14, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(15, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(16, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(17, 'Momo', 'Ribou', 'morgan.ribou@fake.com', '17 allée des rougettes', '77600'),
(18, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(19, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600'),
(20, 'Morgan', 'Ribou', 'morgan.ribou@free.fr', '17 allée des rougettes', '77600');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231217115344', '2023-12-17 11:53:58', 67),
('DoctrineMigrations\\Version20231217122433', '2023-12-17 12:24:49', 294),
('DoctrineMigrations\\Version20231217134923', '2023-12-17 13:49:33', 200),
('DoctrineMigrations\\Version20231217135721', '2023-12-17 13:57:26', 46),
('DoctrineMigrations\\Version20231217144952', '2023-12-17 14:50:05', 245),
('DoctrineMigrations\\Version20231217155558', '2023-12-17 15:56:05', 60),
('DoctrineMigrations\\Version20231218102926', '2023-12-18 10:29:34', 120),
('DoctrineMigrations\\Version20231218103807', '2023-12-18 10:38:13', 72);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `chambre_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roles`, `username`) VALUES
(5, 'morgan.ribou@free.fr', '$2y$13$ARDIgxcpWiBwy.OlqvZZV.bBZOl./LhKJJ6nHMe4IS4PwsrlA9ixq', '[\"ROLE_ADMIN\"]', 'Morgan Ribou'),
(6, 'morgan.ribou@gmail.com', '$2y$13$dh67uE.92kwQjV7a61OQGu4RIVwQJDg3/9hi2rz3P2SWEJASbDfmG', '[\"ROLE_RECEP\"]', 'Morgan Ribou'),
(7, 'morgan.ribou@fake.com', '$2y$13$La.1ZJ2i/Zbw7qKKZM5TM.GmFNdWnbpASSrmBmvttspsNZkz.CYqS', '[\"ROLE_MENAGE\"]', 'Morgan Ménage');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_42C8495519EB6921` (`client_id`),
  ADD KEY `IDX_42C849559B177F54` (`chambre_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C8495519EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_42C849559B177F54` FOREIGN KEY (`chambre_id`) REFERENCES `chambre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
