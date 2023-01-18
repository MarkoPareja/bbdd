DROP DATABASE IF EXISTS gestio_practiques;
CREATE DATABASE gestio_practiques;
USE gestio_practiques;

CREATE TABLE IF NOT EXISTS alumnat (
	id_alumne INT(50) NOT NULL PRIMARY KEY,
	nom VARCHAR(15) NOT NULL,
	cognoms VARCHAR(20) NOT NULL,
	data_naixement DATE NOT NULL,
	email VARCHAR(30) NOT NULL,
	telefon INT(9) NOT NULL,
	cicle_formatiu VARCHAR(20) NOT NULL,
	curs VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS empresa (
	id_empresa INT(50) NOT NULL PRIMARY KEY,
	nom VARCHAR(15) NOT NULL,
	adreça VARCHAR(30) NOT NULL,
	telefon INT(9) NOT NULL,
	email VARCHAR(30) NOT NULL,
	homologacion ENUM("si","no") NOT NULL
);

CREATE TABLE IF NOT EXISTS homologacion (
	id_homologacion INT(50) NOT NULL,
	id_empresa INT(50) NOT NULL,
	tipo_homologacion ENUM('fct','dual') NOT NULL,
	estudios VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_homologacion, id_empresa),
	FOREIGN KEY (id_empresa) REFERENCES empresa (id_empresa) 
);

CREATE TABLE IF NOT EXISTS practiques (
	id_practica INT(50) NOT NULL,
	id_alumne INT(50) NOT NULL,
	id_empresa INT(50) NOT NULL,
	data_inici DATE NOT NULL,
	data_fi DATE NOT NULL,
	num_hores INT(10) NOT NULL,
	exempcio ENUM("si","no") DEFAULT NULL,
	tipus_exempcio ENUM('25', '50', '100') DEFAULT NULL,
	PRIMARY KEY (id_practica, id_alumne, id_empresa),
	FOREIGN KEY (id_alumne) REFERENCES alumnat (id_alumne),
	FOREIGN KEY (id_empresa) REFERENCES empresa (id_empresa)
);

CREATE TABLE IF NOT EXISTS tutor_practica (
	id_tutor INT(50) NOT NULL,
	id_practica INT(50) NOT NULL,
	nom_tutor VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_tutor, id_practica),
	FOREIGN KEY (id_practica) REFERENCES practiques (id_practica)
);

CREATE TABLE IF NOT EXISTS tutor_empresa (
	id_tutor INT(50) NOT NULL,
	id_empresa INT(50) NOT NULL,
	nom_tutor VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_tutor, id_empresa),
	FOREIGN KEY (id_empresa) REFERENCES empresa (id_empresa)
);

delimiter //
CREATE TRIGGER practica_bi BEFORE INSERT ON practiques
  FOR EACH ROW
  BEGIN
    IF NEW.data_inici < NOW() THEN
    	SIGNAL SQLSTATE '45000' 
    	SET message_text = "Error, la data de inici no por ser anterior a la actual";
    END IF;
  END; //
  
CREATE TRIGGER practica_bu BEFORE UPDATE ON practiques
FOR EACH ROW
  BEGIN
    IF NEW.data_fi < NEW.data_inici THEN
    	SIGNAL SQLSTATE '45000' 
    	SET message_text = "Error, la data de fi no por ser anterior a la data de inici";
    END IF;
  END; //
/*
CREATE TRIGGER practica_bu BEFORE DELETE ON practiques
FOR EACH ROW
  BEGIN
    IF NEW.data_fi < data_inici THEN
    	SIGNAL SQLSTATE '45000' 
    	SET message_text = "Error, la data de fi no por ser anterior a la data de inici";
    END IF;
  END; //
*/  
delimiter ;

INSERT INTO alumnat (id_alumne, nom, cognoms, data_naixement, email, telefon, cicle_formatiu, curs) VALUES
	(1, 'Marko', 'Pareja Bailén', '2004-01-30', 'markoathletic@gmail.com', 666210787, 'DAW', 'Primer'),
	(2, 'Alejandro', 'Garcia Dopico', '1996-02-17', 'a.dopico@gmail.com', 657452452, 'DAW', 'Primer'),
	(3, 'Arnau', 'Cuevas Medina', '2004-09-18', 'a.cuevas@gmail.com', 658652415, 'DAW', 'Segon')
	;

INSERT INTO empresa (id_empresa, nom, adreça, telefon, email, homologacion) VALUES
	(1, 'Plana Fabrega', 'Calle Caracas, 10', 900057769, 'planafabrega@planafabrega.com', 'si'),
	(2, 'CyberCity', 'Calle Olor, 23', 902764874, 'contacto@cybercity.com', 'no'),
	(3, 'Computers INC', 'Carrer de Gos, 3', 685412574, 'computers@outlook.es', 'si')
	;


INSERT INTO homologacion (id_homologacion, id_empresa, tipo_homologacion, estudios) VALUES
	(1, 1, 'fct', 'SMX , DAW , ASIX'),
	(2, 3, 'dual', 'SMX')
	;
	
INSERT INTO practiques (id_practica, id_alumne, id_empresa, data_inici, data_fi, num_hores, exempcio, tipus_exempcio) VALUES
	(1, 1, 1, '2023-01-19', '2023-06-24', 350, 'no', DEFAULT),
	(2, 3, 3, '2023-01-20', '2023-09-14', 845, 'si', '25')
	;
	
INSERT INTO tutor_practica (id_tutor, id_practica, nom_tutor) VALUES
	(1, 1, 'Manuel Garcia Hernandez'),
	(2, 2, 'Raquel Alaman')
	;

INSERT INTO tutor_empresa (id_tutor, id_empresa, nom_tutor) VALUES
	(1, 1, 'Javier Fabo Navarro'),
	(2, 3, 'Xavier Hernandez Morales')
	;
