DROP DATABASE dbBiblioteca;
CREATE DATABASE dbBiblioteca;
USE dbBiblioteca;

CREATE TABLE tblUtenti
(
	eMail VARCHAR(69) PRIMARY KEY NOT NULL,
	pass VARCHAR(64) NOT NULL,
	ifadmin boolean DEFAULT 0
);

CREATE TABLE tblPrestiti
(
	idPrestito INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	dataPrestito DATE NOT NULL,
	dataRestituzione DATE NOT NULL,
	utente VARCHAR(69) NOT NULL,
	FOREIGN KEY (utente) REFERENCES tblUtenti(eMail) 
);

CREATE TABLE tblCode(
	idCoda INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	dataPrenotazione DATE NOT NULL,
	prestito INTEGER NOT NULL,
	utente INTEGER,
	FOREIGN KEY (prestito) REFERENCES tblPrestiti(idPrestito) 
);

CREATE TABLE tblCopie(
	idCopia INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	dataPrenotazione DATE NOT NULL,
	prestito INTEGER NOT NULL,
	FOREIGN KEY (prestito) REFERENCES tblPrestiti(idPrestito) 
);

CREATE TABLE tblCopieInPrestito(
	prestito INTEGER NOT NULL,
	copia INTEGER NOT NULL,
	statoConservazione VARCHAR(64) NOT NULL,
	PRIMARY KEY(prestito,copia),
	FOREIGN KEY (prestito) REFERENCES tblPrestiti(idPrestito),
	FOREIGN KEY (copia) REFERENCES tblCopie(idCopia)
);

CREATE TABLE tblGeneri(
	descrizione VARCHAR(16) PRIMARY KEY NOT NULL,
	ubicazione VARCHAR(16) NOT NULL
	);

CREATE TABLE tblLibri(
	ISBN VARCHAR(16) PRIMARY KEY NOT NULL,
	titolo VARCHAR(32) NOT NULL,
	genere VARCHAR(16) NOT NULL,
	editore VARCHAR(32) NOT NULL,
	numPagine INTEGER NOT NULL,
	FOREIGN KEY (genere) REFERENCES tblGeneri(descrizione) 
);

CREATE TABLE tblAutori(
	idAutore INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nominativo VARCHAR(64) NOT NULL,
	dataNascita DATE NOT NULL,
	dataMorte DATE,
	bibliografia VARCHAR(128) NOT NULL
);

CREATE TABLE tblAutoriScrivonoLibri(
	autore INTEGER NOT NULL,
	libro varchar(16) NOT NULL,
	FOREIGN KEY (autore) REFERENCES tblAutori(idAutore),
	FOREIGN KEY (libro) REFERENCES tblLibri(ISBN)
);

CREATE TABLE tblUtenteInCoda(
	coda INTEGER NOT NULL,
	utente VARCHAR(69),
	FOREIGN KEY (coda) REFERENCES tblCode(idCoda),
	FOREIGN KEY (utente) REFERENCES tblUtenti(eMail)
);