CREATE TABLE `user` (
  `id` int UNIQUE PRIMARY KEY NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `date_of_registration` datetime NOT NULL
);

CREATE TABLE `phone` (
  `id` int PRIMARY KEY,
  `id_user` int NOT NULL,
  `id_product` int,
  `id_quality` int,
  `date_of_publication` datetime NOT NULL,
  `is_send` boolean NOT NULL
);

CREATE TABLE `brand` (
  `id` varchar(255) PRIMARY KEY,
  `brand` varchar(255)
);

CREATE TABLE `product` (
  `id` int PRIMARY KEY,
  `product` varchar(255),
  `id_brand` varchar(255)
);

CREATE TABLE `tarif` (
  `id_brand` varchar(255),
  `id_quality` int,
  `price` double
);

CREATE TABLE `quality` (
  `id` int PRIMARY KEY,
  `quality` varchar(255)
);

ALTER TABLE `phone` ADD FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

ALTER TABLE `phone` ADD FOREIGN KEY (`id_quality`) REFERENCES `quality` (`id`);

ALTER TABLE `tarif` ADD FOREIGN KEY (`id_quality`) REFERENCES `quality` (`id`);

ALTER TABLE `product` ADD FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`);

ALTER TABLE `phone` ADD FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

ALTER TABLE `tarif` ADD FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`);
