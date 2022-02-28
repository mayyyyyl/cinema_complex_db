CREATE DATABASE IF NOT EXISTS cinema_complex CHARACTER SET utf8 COLLATE utf8_general_ci;
USE cinema_complex;

/* Création des tables*/

CREATE TABLE account (
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    password VARCHAR(50) NOT NULL
)
ENGINE=InnoDB;

CREATE TABLE admin ( 
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_account INT(100) NOT NULL,
    FOREIGN KEY (id_account) REFERENCES account(id) ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE cinema ( 
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    id_admin INT(100) NOT NULL,
    FOREIGN KEY (id_admin) REFERENCES admin(id) ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE admin_complex ( 
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_account INT(100) NOT NULL,
    id_cinema INT(100) NOT NULL,
    FOREIGN KEY (id_account) REFERENCES account(id) ON DELETE CASCADE,
    FOREIGN KEY (id_cinema) REFERENCES cinema(id) ON DELETE CASCADE  
)
ENGINE=InnoDB;

CREATE TABLE customer ( 
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_account INT(100) NOT NULL,
    FOREIGN KEY (id_account) REFERENCES account(id) ON DELETE CASCADE,
    is_student BOOLEAN NOT NULL,
    price_ticket DECIMAL(4,2) NOT NULL
)
ENGINE=InnoDB;

CREATE TABLE room ( 
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cinema INT(100) NOT NULL,
    FOREIGN KEY (id_cinema) REFERENCES cinema(id) ON DELETE CASCADE,
    nb_place INT(100) NOT NULL
)
ENGINE=InnoDB;

CREATE TABLE movie ( 
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_room INT(100) NOT NULL,
    FOREIGN KEY (id_room) REFERENCES room(id) ON DELETE CASCADE,
    time_start DATETIME NOT NULL,
    movie_title VARCHAR(50) NOT NULL
)
ENGINE=InnoDB;

CREATE TABLE booking ( 
    id INT(100) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_customer INT(100) NOT NULL,
    FOREIGN KEY (id_customer) REFERENCES customer(id) ON DELETE CASCADE,
    id_movie INT(100) NOT NULL,
    FOREIGN KEY (id_movie) REFERENCES movie(id) ON DELETE CASCADE,
    date_booking DATETIME NOT NULL,
    type_payement VARCHAR(50) NOT NULL
)
ENGINE=InnoDB;

/* Peupler les tables */

insert into account (id, firstname, lastname, email, date_of_birth, password) values (1, 'Valeria', 'Astbery', 'vastbery0@discuz.net', '1968/05/15', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (2, 'Noel', 'Robardley', 'nrobardley1@livejournal.com', '1971/02/03', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (3, 'Alix', 'Kaemena', 'akaemena2@github.com', '1976/08/16', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (4, 'Gayle', 'Jan', 'gjan3@oaic.gov.au', '1992/05/05', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (5, 'Brittni', 'Goldingay', 'bgoldingay4@soup.io', '1988/10/09', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (6, 'Alethea', 'Tissiman', 'atissiman5@bravesites.com', '2010/09/18', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (7, 'Guillema', 'Owers', 'gowers6@cdbaby.com', '1994/06/25', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (8, 'Lazaro', 'Sutehall', 'lsutehall7@apache.org', '2001/07/20', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (9, 'Patrice', 'Allsepp', 'pallsepp8@unblog.fr', '1992/12/01', 'd0416558793c000cbc74ae1260153c465734daa6');
insert into account (id, firstname, lastname, email, date_of_birth, password) values (10, 'Giselle', 'Sweating', 'gsweating9@skyrock.com', '2010/03/03', 'd0416558793c000cbc74ae1260153c465734daa6');

insert into admin (id, id_account) values (1, 1);
insert into admin (id, id_account) values (2, 2);
insert into admin (id, id_account) values (3, 3);

insert into customer (id, id_account, is_student, price_ticket) values (1, 4, True, 7.60);
insert into customer (id, id_account, is_student, price_ticket) values (2, 5, False, 9.20);
insert into customer (id, id_account, is_student, price_ticket) values (3, 6, False, 5.90);

insert into cinema (id, name, address, city, id_admin) values (1, 'Les 3 Rivières', '74 Aberg Point', 'Angers', 1);
insert into cinema (id, name, address, city, id_admin) values (2, 'Le Continental', '4 Fallview Plaza', 'Brest', 2);
insert into cinema (id, name, address, city, id_admin) values (3, 'Le Pacifique', '536 Michigan Center', 'Lyon', 3);

insert into admin_complex (id, id_account, id_cinema) values (1, 7, 1);
insert into admin_complex (id, id_account, id_cinema) values (2, 8, 2);
insert into admin_complex (id, id_account, id_cinema) values (3, 9, 3);

insert into room (id, id_cinema, nb_place) values (1, 1, 100);
insert into room (id, id_cinema, nb_place) values (2, 1, 300);
insert into room (id, id_cinema, nb_place) values (3, 2, 250);
insert into room (id, id_cinema, nb_place) values (4, 2, 250);
insert into room (id, id_cinema, nb_place) values (5, 2, 150);
insert into room (id, id_cinema, nb_place) values (6, 3, 300);
insert into room (id, id_cinema, nb_place) values (7, 3, 300);

insert into movie (id, id_room, time_start, movie_title) values (1, 1, '2021-12-08 02:41:08', 'Spiderman: No way home');
insert into movie (id, id_room, time_start, movie_title) values (2, 2, '2021-08-18 00:18:14', 'Amélie Poulain');
insert into movie (id, id_room, time_start, movie_title) values (3, 3, '2021-12-16 10:07:26', 'Fast en Furious 5');
insert into movie (id, id_room, time_start, movie_title) values (4, 4, '2021-02-12 14:17:45', 'Le roi Lion');
insert into movie (id, id_room, time_start, movie_title) values (5, 5, '2021-11-29 08:42:45', 'Scream');
insert into movie (id, id_room, time_start, movie_title) values (6, 6, '2021-07-08 16:57:03', 'The Artist');
insert into movie (id, id_room, time_start, movie_title) values (7, 7, '2021-10-13 04:30:32', 'Forrest Gump');
insert into movie (id, id_room, time_start, movie_title) values (8, 7, '2021-10-20 06:30:32', 'Pretty Woman');

insert into booking (id, id_customer, date_booking, id_movie, type_payement) values (1, 1, '2021-07-11 11:31:20', 8, 'sur place');
insert into booking (id, id_customer, date_booking, id_movie, type_payement) values (2, 2, '2021-04-20 04:03:07', 2, 'en ligne');
insert into booking (id, id_customer, date_booking, id_movie, type_payement) values (3, 3, '2021-06-25 11:49:51', 3, 'sur place');
insert into booking (id, id_customer, date_booking, id_movie, type_payement) values (4, 3, '2021-06-19 09:32:26', 4, 'sur place');
insert into booking (id, id_customer, date_booking, id_movie, type_payement) values (5, 1, '2021-02-03 12:19:45', 5, 'en ligne');
insert into booking (id, id_customer, date_booking, id_movie, type_payement) values (6, 2, '2021-06-12 22:32:34', 6, 'en ligne');
insert into booking (id, id_customer, date_booking, id_movie, type_payement) values (7, 3, '2021-12-11 18:29:57', 7, 'sur place');


/* Voir les séances avec leur date de début et le film  */

SELECT `movie`.`movie_title` AS `film`, `movie`.`time_start` AS `début séance`, `cinema`.`name` AS `cinema`
FROM `cinema`, `movie`
ORDER BY `movie`.`time_start` DESC;


/* Voir les réservations, le moyen de payement et le prix à payer */

SELECT CONCAT(`account`.`firstname`," ",`account`.`lastname`) AS `client`, `customer`.`price_ticket` AS `prix`, `booking`.`type_payement` AS `type`,  `booking`.`date_booking` AS `date de réservation`
FROM `account` 
	LEFT JOIN `customer` ON `customer`.`id_account` = `account`.`id` 
	LEFT JOIN `booking` ON `booking`.`id_customer` = `customer`.`id`
WHERE `booking`.`date_booking` IS NOT NULL
ORDER BY `booking`.`date_booking` DESC;


/* Voir les utilisateurs qui ont les droits d'accès qu'à leur cinéma */

SELECT `admin_complex`.`id_account` AS `admin complex`, `cinema`.`name` AS `cinema`
FROM `admin_complex` 
	LEFT JOIN `cinema` ON `admin_complex`.`id_cinema` = `cinema`.`id`;


/* Utilisation d'un utilitaire de sauvegarde et restauration de la base de données */
mysqldump -u root -p cinema_complex > cinema_complex.sql
