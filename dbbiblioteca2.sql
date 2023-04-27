DROP DATABASE dbBiblioteca;
CREATE DATABASE dbBiblioteca;
USE dbBiblioteca;

CREATE TABLE tblUtenti(
	eMail VARCHAR(69) PRIMARY KEY NOT NULL,
	pass VARCHAR(64) NOT NULL,
	ifadmin boolean DEFAULT 0
);

/*
CREATE TABLE tblPrestiti(
    idPrestito INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    dataPrestito DATE NOT NULL,
    dataRestituzione DATE NOT NULL,
    utente VARCHAR(69) NOT NULL,
    libro CHAR(16) NOT NULL,
    CONSTRAINT fk_tblPrestiti_tblUtenti FOREIGN KEY (utente) REFERENCES tblUtenti(eMail),
    CONSTRAINT fk_tblPrestiti_tblLibri FOREIGN KEY (libro) REFERENCES tblLibri(ISBN)
);*/

CREATE TABLE tblPrestiti (
  idPrestito INT AUTO_INCREMENT PRIMARY KEY,
  dataPrestito DATE NOT NULL,
  dataRestituzione DATE NOT NULL,
  utente VARCHAR(69) NOT NULL,
  libro VARCHAR(16) NOT NULL,
  FOREIGN KEY (utente) REFERENCES tblUtenti(eMail) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (libro) REFERENCES tblLibri(ISBN) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE tblGeneri(
	nome VARCHAR(16) PRIMARY KEY NOT NULL,
	ubicazione VARCHAR(16) NOT NULL
);

CREATE TABLE tblLibri(
	ISBN VARCHAR(16) PRIMARY KEY NOT NULL,
	titolo VARCHAR(32) NOT NULL,
	genere VARCHAR(16) NOT NULL,
	editore VARCHAR(32) NOT NULL,
	numPagine INTEGER NOT NULL,
	preso BOOLEAN DEFAULT 0,
	FOREIGN KEY (genere) REFERENCES tblGeneri(nome) 
);

INSERT INTO tblUtenti VALUES ("dente.francesco@daronco.edu.it", "4a7d1ed414474e4033ac29ccb8653d9b", 1 );
INSERT INTO tblUtenti VALUES ("vanon.elia@daronco.edu.it", "4a7d1ed414474e4033ac29ccb8653d9b", 1 );
INSERT INTO tblUtenti VALUES ("barazzutti.stefano@daronco.edu.it", "4a7d1ed414474e4033ac29ccb8653d9b", 0 );

INSERT INTO tblGeneri VALUES ("Thriller", "0001");
INSERT INTO tblGeneri VALUES ("Giallo", "0002");
INSERT INTO tblGeneri VALUES ("Romanzo", "0001");

INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8806228860', 'Il Codice Da Vinci', 'Thriller', 'Mondadori', 569, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8850233241', 'La ragazza che giocava con il fuoco', 'Thriller', 'Marsilio', 584, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8804689318', 'Io uccido', 'Thriller', 'Mondadori', 447, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8850209604', 'La verità del ghiaccio', 'Thriller', 'Piemme', 364, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8807888763', 'L amore ai tempi del colera', 'Romanzo', 'Mondadori', 452, 1);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8807882167', 'Cento anni di solitudine', 'Romanzo', 'Mondadori', 380, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8845292276', 'Il vecchio e il mare', 'Romanzo', 'Bompiani', 127, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8804625110', 'Il nome della rosa', 'Giallo', 'Bompiani', 592, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8817081298', 'Il commissario Montalbano', 'Giallo', 'Sellerio', 225, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8817011944', 'Delitto in Piazza del Campo', 'Giallo', 'Garzanti', 160, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8817035360', 'Il cimitero di Praga', 'Thriller', 'Garzanti', 593, 0);
INSERT INTO tblLibri (ISBN, titolo, genere, editore, numPagine, preso) 
VALUES ('978-8804614268', 'Novecento', 'Romanzo', 'Feltrinelli', 125, 0);