drop database if exists db_ingegneria;
create database db_ingegneria;
use db_ingegneria;

create table citta(
	id int auto_increment,
    nome varchar(30),
    primary key (id)
);

create table utente(
	id int auto_increment,
    email varchar(20) default null,
    password varchar(20) default null,
    tipo_gestore enum('citta','zona','edificio', 'amministratore'),
    id_citta int,
    foreign key (id_citta) references citta (id) on update cascade on delete cascade,
    primary key (id)
);

create table zona(
	id int auto_increment,
	nome enum('A','B','C','D','E','F','G','H'),
    id_utente int,
    foreign key (id_utente) references utente (id) on update cascade on delete cascade,
    id_citta int,
    foreign key (id_citta) references citta (id) on update cascade on delete cascade,
    primary key (id)
);

create table edificio(
	id int auto_increment,
	numero_edificio int(94),
    id_utente int,
    foreign key (id_utente) references utente (id) on update cascade on delete cascade,
    id_zona int not null,
    foreign key (id_zona) references zona (id) on update cascade on delete cascade,
    primary key (id)
);

create table stanza(
	id int auto_increment,
	numero_stanza int(50),
    id_edificio int not null,
    foreign key (id_edificio) references edificio (id) on update cascade on delete cascade,
    primary key (id)
);

create table sensore(
	id int auto_increment,
    tipo enum('temperatura', 'umidita', 'luminosita', 'pressione'),
    lettura real default null,
    id_stanza int not null,
    foreign key (id_stanza) references stanza (id) on update cascade on delete cascade,
    status enum('attivo', 'NON attivo') default 'attivo',
    primary key (id)
);