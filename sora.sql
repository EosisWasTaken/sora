CREATE TABLE `user` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `date_of_registration` datetime NOT NULL
);

CREATE TABLE `phone` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_product` int,
  `id_quality` int,
  `date_of_publication` datetime NOT NULL,
  `is_send` boolean NOT NULL
);

CREATE TABLE `brand` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `product` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product` varchar(255),
  `id_brand` int
);

CREATE TABLE `tarif` (
  `id_brand` int,
  `id_quality` int,
  `price` double
);

CREATE TABLE `quality` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `quality` varchar(255)
);

ALTER TABLE `phone` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `phone` ADD FOREIGN KEY (`id_quality`) REFERENCES `quality` (`id`);

ALTER TABLE `tarif` ADD FOREIGN KEY (`id_quality`) REFERENCES `quality` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`);

ALTER TABLE `phone` ADD FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

ALTER TABLE `tarif` ADD FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`);
