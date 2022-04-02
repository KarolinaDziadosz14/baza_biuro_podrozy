/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     09.01.2022 15:19:49                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ATRAKCJE_MIEJSCOWO_MIEJSOWO') then
    alter table ATRAKCJE
       delete foreign key FK_ATRAKCJE_MIEJSCOWO_MIEJSOWO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HOTEL_MIEJSCOWO_MIEJSOWO') then
    alter table HOTEL
       delete foreign key FK_HOTEL_MIEJSCOWO_MIEJSOWO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MIEJSCOW_MIEJSCOWO_TRANSPOR') then
    alter table MIEJSCOWOSC_TRANSPORT
       delete foreign key FK_MIEJSCOW_MIEJSCOWO_TRANSPOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MIEJSCOW_MIEJSCOWO_MIEJSOWO') then
    alter table MIEJSCOWOSC_TRANSPORT
       delete foreign key FK_MIEJSCOW_MIEJSCOWO_MIEJSOWO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MIEJSOWO_REGION_MI_REGION') then
    alter table MIEJSOWOSC
       delete foreign key FK_MIEJSOWO_REGION_MI_REGION
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ODDZIAL_MIEJSCOWO_MIEJSOWO') then
    alter table ODDZIAL
       delete foreign key FK_ODDZIAL_MIEJSCOWO_MIEJSOWO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POBYT_POBYT_POK_POKOJE') then
    alter table POBYT
       delete foreign key FK_POBYT_POBYT_POK_POKOJE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POBYT_TRANSPORT_TRANSPOR') then
    alter table POBYT
       delete foreign key FK_POBYT_TRANSPORT_TRANSPOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POBYT_AT_POBYT_ATR_POBYT') then
    alter table POBYT_ATRAKCJE
       delete foreign key FK_POBYT_AT_POBYT_ATR_POBYT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POBYT_AT_POBYT_ATR_ATRAKCJE') then
    alter table POBYT_ATRAKCJE
       delete foreign key FK_POBYT_AT_POBYT_ATR_ATRAKCJE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POBYT_KL_POBYT_KLI_POBYT') then
    alter table POBYT_KLIENCI
       delete foreign key FK_POBYT_KL_POBYT_KLI_POBYT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POBYT_KL_POBYT_KLI_KLIENCI') then
    alter table POBYT_KLIENCI
       delete foreign key FK_POBYT_KL_POBYT_KLI_KLIENCI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POKOJE_HOTEL_POK_HOTEL') then
    alter table POKOJE
       delete foreign key FK_POKOJE_HOTEL_POK_HOTEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRACOWNI_ODDZIAL_P_ODDZIAL') then
    alter table PRACOWNICY
       delete foreign key FK_PRACOWNI_ODDZIAL_P_ODDZIAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REGION_PANSTWO_R_PANSTWO') then
    alter table REGION
       delete foreign key FK_REGION_PANSTWO_R_PANSTWO
end if;

drop index if exists ATRAKCJE.MIEJSCOWOSC_ATRAKCJE_FK;

drop index if exists ATRAKCJE.ATRAKCJE_PK;

drop table if exists ATRAKCJE;

drop index if exists HOTEL.MIEJSCOWOSC_HOTEL_FK;

drop index if exists HOTEL.HOTEL_PK;

drop table if exists HOTEL;

drop index if exists KLIENCI.KLIENCI_PK;

drop table if exists KLIENCI;

drop index if exists MIEJSCOWOSC_TRANSPORT.MIEJSCOWOSC_TRANSPORT2_FK;

drop index if exists MIEJSCOWOSC_TRANSPORT.MIEJSCOWOSC_TRANSPORT_FK;

drop index if exists MIEJSCOWOSC_TRANSPORT.MIEJSCOWOSC_TRANSPORT_PK;

drop table if exists MIEJSCOWOSC_TRANSPORT;

drop index if exists MIEJSOWOSC.REGION_MIEJSCOWOSC_FK;

drop index if exists MIEJSOWOSC.MIEJSOWOSC_PK;

drop table if exists MIEJSOWOSC;

drop index if exists ODDZIAL.MIEJSCOWOSC_ODDZIAL_FK;

drop index if exists ODDZIAL.ODDZIAL_PK;

drop table if exists ODDZIAL;

drop index if exists PANSTWO.PANSTWO_PK;

drop table if exists PANSTWO;

drop index if exists POBYT.POBYT_POKOJE_FK;

drop index if exists POBYT.TRANSPORT_POBYT_FK;

drop index if exists POBYT.POBYT_PK;

drop table if exists POBYT;

drop index if exists POBYT_ATRAKCJE.POBYT_ATRAKCJE2_FK;

drop index if exists POBYT_ATRAKCJE.POBYT_ATRAKCJE_FK;

drop index if exists POBYT_ATRAKCJE.POBYT_ATRAKCJE_PK;

drop table if exists POBYT_ATRAKCJE;

drop index if exists POBYT_KLIENCI.POBYT_KLIENCI2_FK;

drop index if exists POBYT_KLIENCI.POBYT_KLIENCI_FK;

drop index if exists POBYT_KLIENCI.POBYT_KLIENCI_PK;

drop table if exists POBYT_KLIENCI;

drop index if exists POKOJE.HOTEL_POKOJE_FK;

drop index if exists POKOJE.POKOJE_PK;

drop table if exists POKOJE;

drop index if exists PRACOWNICY.ODDZIAL_PRACOWNICY_FK;

drop index if exists PRACOWNICY.PRACOWNICY_PK;

drop table if exists PRACOWNICY;

drop index if exists REGION.PANSTWO_REGION_FK;

drop index if exists REGION.REGION_PK;

drop table if exists REGION;

drop index if exists TRANSPORT.TRANSPORT_PK;

drop table if exists TRANSPORT;

/*==============================================================*/
/* Table: ATRAKCJE                                              */
/*==============================================================*/
create table ATRAKCJE 
(
   id_atrakcji          integer                        not null,
   id_miejsowosci       integer                        not null,
   rodzaj_atrakcji      char(40)                       not null,
   kod_pocztowy_atrakcji char(5)                        null,
   ulica_atrakcji       char(50)                       null,
   numer_budynku_atrakcji char(8)                        null,
   cena_atrakcji        numeric(6,2)                   not null,
   constraint PK_ATRAKCJE primary key (id_atrakcji)
);

comment on column ATRAKCJE.id_atrakcji is 
'Id atrakcji w miejscu organizowania wycieczek przez biuro podrozy.';

comment on column ATRAKCJE.id_miejsowosci is 
'ID miejsowosci.';

comment on column ATRAKCJE.rodzaj_atrakcji is 
'Rodzaj atrakcji oferowanych przez biuro podrozy, np. basen, aquapark, plaza, muzeum.';

comment on column ATRAKCJE.kod_pocztowy_atrakcji is 
'Kod pocztowy miejsca atrakcji.';

comment on column ATRAKCJE.ulica_atrakcji is 
'Ulica przy ktorej znajduje sie oferowana przez biuro podrozy atrakcja.';

comment on column ATRAKCJE.numer_budynku_atrakcji is 
'Numer budynku, w ktorym mozna skozystac z oferowanej przez biuro podrozy atrakcji.';

comment on column ATRAKCJE.cena_atrakcji is 
'Cena atrakcji za pojedynczy bilet, wyrazona w zl.';

/*==============================================================*/
/* Index: ATRAKCJE_PK                                           */
/*==============================================================*/
create unique index ATRAKCJE_PK on ATRAKCJE (
id_atrakcji ASC
);

/*==============================================================*/
/* Index: MIEJSCOWOSC_ATRAKCJE_FK                               */
/*==============================================================*/
create index MIEJSCOWOSC_ATRAKCJE_FK on ATRAKCJE (
id_miejsowosci ASC
);

/*==============================================================*/
/* Table: HOTEL                                                 */
/*==============================================================*/
create table HOTEL 
(
   id_hotelu            integer                        not null,
   id_miejsowosci       integer                        not null,
   nazwa_hotelu         char(30)                       not null,
   kod_pocztowy_hotelu  char(5)                        not null,
   ulica_hotelu         char(50)                       not null,
   nr_budynku_hotelu    char(8)                        not null,
   siec_hotelu          char(30)                       null,
   liczba_gwiazdek      integer                        null,
   calodobowa_recepcja  binary(3)                      not null,
   obecnosc_restauracji binary(3)                      not null,
   obecnosc_silowni     binary(3)                      not null,
   constraint PK_HOTEL primary key (id_hotelu)
);

comment on table HOTEL is 
'Jest to tabela z informacjami na temat hoteli wspolpracujacych z biurem podrozy.';

comment on column HOTEL.id_hotelu is 
'Id hotelu wspolpracujacego z biurem podrozy..';

comment on column HOTEL.id_miejsowosci is 
'ID miejsowosci.';

comment on column HOTEL.nazwa_hotelu is 
'Nazwa hotelu wspolpracujacego z biurem podrozy.';

comment on column HOTEL.kod_pocztowy_hotelu is 
'Kod pocztowy hotelu wspolpracujacego z biurem podrozy.';

comment on column HOTEL.ulica_hotelu is 
'Ulica hotelu wspolpracujacego z biurem podrozy.';

comment on column HOTEL.nr_budynku_hotelu is 
'Numer budynku hotelu wspolpracujacego z biurem podrozy.';

comment on column HOTEL.siec_hotelu is 
'Nazwa sieci hoteli, w ktorej dzialaja wspolpracujace z biurem podrozy hotele.';

comment on column HOTEL.liczba_gwiazdek is 
'Liczba przyznanych hotelowi gwiazdek.';

comment on column HOTEL.calodobowa_recepcja is 
'Czy hotelowa recepcja jest dostepna przez cala dobe?
TAK - jest dostepna przez cala dobe
NIE - nie jest dostepna przez cala dobe';

comment on column HOTEL.obecnosc_restauracji is 
'Czy w hotelu dostepna jest restauracja?
TAK - jest dostepna 
NIE - nie jest dostepna.';

comment on column HOTEL.obecnosc_silowni is 
'Czy dostepna jest hotelowa silownia?
TAK - jest dostepna 
NIE - nie jest dostepna.';

/*==============================================================*/
/* Index: HOTEL_PK                                              */
/*==============================================================*/
create unique index HOTEL_PK on HOTEL (
id_hotelu ASC
);

/*==============================================================*/
/* Index: MIEJSCOWOSC_HOTEL_FK                                  */
/*==============================================================*/
create index MIEJSCOWOSC_HOTEL_FK on HOTEL (
id_miejsowosci ASC
);

/*==============================================================*/
/* Table: KLIENCI                                               */
/*==============================================================*/
create table KLIENCI 
(
   id_klienta           integer                        not null,
   imie_klienta         char(30)                       not null,
   nazwisko_klienta     char(30)                       not null,
   pesel_klienta        char(11)                       not null,
   wydane_pieniadze_klienta numeric(8,2)                   not null,
   znizka_klienta       float(2)                       null,
   email_klienta        char(50)                       not null,
   nr_telefonu_klienta  char(20)                       not null,
   constraint PK_KLIENCI primary key (id_klienta)
);

comment on table KLIENCI is 
'Tabela zawiera informacje o klientach korzystajacych z biura podrozy. Poza kolumnami zawierajacymi dane osobowe zawiera kwote wczesniej wydana przez klienta.';

comment on column KLIENCI.id_klienta is 
'Id klienta korzystajacego z uslug biura podrozy.';

comment on column KLIENCI.imie_klienta is 
'Imie klienta korzystajacego z uslug biura podrozy.';

comment on column KLIENCI.nazwisko_klienta is 
'Nazwisko klienta korzystajacego z uslug biura podrozy.';

comment on column KLIENCI.pesel_klienta is 
'Pesel klienta korzystajacego z uslug biura podrozy.';

comment on column KLIENCI.wydane_pieniadze_klienta is 
'Pieniadze wydane przez klienta korzystajacego z uslug biura podrozy. Wartosc wyrazana w zl.';

comment on column KLIENCI.znizka_klienta is 
'Znizka dla klienta korzystajacego z uslug biura podrozy. Zalezy od wczesniej wydanych pieniedzy, zniko lojalnosiowa. Wartosc wyrazana w zl.';

comment on column KLIENCI.email_klienta is 
'Email podany przez klienta korzystajacego z uslug biura podrozy.';

comment on column KLIENCI.nr_telefonu_klienta is 
'Numer telefonu podany przez klienta korzystajacego z uslug biura podrozy.';

/*==============================================================*/
/* Index: KLIENCI_PK                                            */
/*==============================================================*/
create unique index KLIENCI_PK on KLIENCI (
id_klienta ASC
);

/*==============================================================*/
/* Table: MIEJSCOWOSC_TRANSPORT                                 */
/*==============================================================*/
create table MIEJSCOWOSC_TRANSPORT 
(
   id_polaczenia        integer                        not null,
   id_miejsowosci       integer                        not null,
   constraint PK_MIEJSCOWOSC_TRANSPORT primary key (id_polaczenia, id_miejsowosci)
);

comment on column MIEJSCOWOSC_TRANSPORT.id_polaczenia is 
'Id polaczenia. Jest to numer odrozniajacy polaczenia realizowane przez roznych przewoznikow, roznymi srodkami transportu, na roznych relacjach, trasach.';

comment on column MIEJSCOWOSC_TRANSPORT.id_miejsowosci is 
'ID miejsowosci.';

/*==============================================================*/
/* Index: MIEJSCOWOSC_TRANSPORT_PK                              */
/*==============================================================*/
create unique index MIEJSCOWOSC_TRANSPORT_PK on MIEJSCOWOSC_TRANSPORT (
id_polaczenia ASC,
id_miejsowosci ASC
);

/*==============================================================*/
/* Index: MIEJSCOWOSC_TRANSPORT_FK                              */
/*==============================================================*/
create index MIEJSCOWOSC_TRANSPORT_FK on MIEJSCOWOSC_TRANSPORT (
id_polaczenia ASC
);

/*==============================================================*/
/* Index: MIEJSCOWOSC_TRANSPORT2_FK                             */
/*==============================================================*/
create index MIEJSCOWOSC_TRANSPORT2_FK on MIEJSCOWOSC_TRANSPORT (
id_miejsowosci ASC
);

/*==============================================================*/
/* Table: MIEJSOWOSC                                            */
/*==============================================================*/
create table MIEJSOWOSC 
(
   id_miejsowosci       integer                        not null,
   id_regionu           integer                        not null,
   nazwa_miejscowosci   char(50)                       not null,
   liczba_mieszkancow   numeric(8,3)                   not null,
   gestosc_zaludnienia  numeric(7,1)                   not null,
   strefa_czasowa       char(10)                       not null,
   srednia_temperatura  numeric(3,1)                   not null,
   dostepnosc_apteki    binary(3)                      not null,
   constraint PK_MIEJSOWOSC primary key (id_miejsowosci)
);

comment on table MIEJSOWOSC is 
'Zbior danych o miejscowosciach w ktorych dziala biuro podrozy lub wspolpracujace z nim podmioty.';

comment on column MIEJSOWOSC.id_miejsowosci is 
'ID miejsowosci.';

comment on column MIEJSOWOSC.id_regionu is 
'Id regionu.';

comment on column MIEJSOWOSC.nazwa_miejscowosci is 
'Informacja o nazwie miejsowosci.';

comment on column MIEJSOWOSC.liczba_mieszkancow is 
'Liczba mieszkancow miejscowowsci wyrazona w tys.';

comment on column MIEJSOWOSC.gestosc_zaludnienia is 
'Gestosc zaludnienia w miescowosci wyrazona w os. na km kw.';

comment on column MIEJSOWOSC.strefa_czasowa is 
'Strefa czasowa obowiazujaca w danej miejscowosci w standardzie GMT.';

comment on column MIEJSOWOSC.srednia_temperatura is 
'Srednia roczna temperatura w danej miejsowosci, podana w st. C.';

comment on column MIEJSOWOSC.dostepnosc_apteki is 
'Wartosc informujaca czy w miescowosci dostepna jest apteka.
TAK - w miejsowosci jest apteka
NIE - w miejscowosci nie ma apteki';

/*==============================================================*/
/* Index: MIEJSOWOSC_PK                                         */
/*==============================================================*/
create unique index MIEJSOWOSC_PK on MIEJSOWOSC (
id_miejsowosci ASC
);

/*==============================================================*/
/* Index: REGION_MIEJSCOWOSC_FK                                 */
/*==============================================================*/
create index REGION_MIEJSCOWOSC_FK on MIEJSOWOSC (
id_regionu ASC
);

/*==============================================================*/
/* Table: ODDZIAL                                               */
/*==============================================================*/
create table ODDZIAL 
(
   id_oddzialu          integer                        not null,
   id_miejsowosci       integer                        not null,
   nazwa_oddzialu       char(20)                       not null,
   kod_pocztowy_oddzialu char(5)                        not null,
   ulica_oddzialu       char(50)                       not null,
   nr_budynku_oddzialu  char(10)                       not null,
   nr_lokalu_oddzialu   char(10)                       null,
   data_otwarcia_oddzialu date                           null,
   constraint PK_ODDZIAL primary key (id_oddzialu)
);

comment on table ODDZIAL is 
'Tabela zawiera informacje o oddzialach biura podrozy. Oddzialy zlokalizowane sa w wielu miastach Polski i Swiata. Ponadto zlokalizowane sa w miejscach docelowych wycieczek.';

comment on column ODDZIAL.id_miejsowosci is 
'ID miejsowosci.';

comment on column ODDZIAL.nazwa_oddzialu is 
'Nazwa danego oddzialu biura podrozy.';

comment on column ODDZIAL.kod_pocztowy_oddzialu is 
'Kod pocztowy dla oddzialu biura podrozy';

comment on column ODDZIAL.ulica_oddzialu is 
'Ulica przy ktorej znajduje sie oddzial biura podrozy.';

comment on column ODDZIAL.nr_budynku_oddzialu is 
'Numer budynku, w ktorym znajduje sie oddzial biura podrozy.';

comment on column ODDZIAL.nr_lokalu_oddzialu is 
'Numer lokalu oddzialu biura podrozy.';

comment on column ODDZIAL.data_otwarcia_oddzialu is 
'Data otarcia danego oddzialu biura podrozy.';

comment on primary key on ODDZIAL is 
'klucz_oddzialu';

/*==============================================================*/
/* Index: ODDZIAL_PK                                            */
/*==============================================================*/
create unique index ODDZIAL_PK on ODDZIAL (
id_oddzialu ASC
);

/*==============================================================*/
/* Index: MIEJSCOWOSC_ODDZIAL_FK                                */
/*==============================================================*/
create index MIEJSCOWOSC_ODDZIAL_FK on ODDZIAL (
id_miejsowosci ASC
);

/*==============================================================*/
/* Table: PANSTWO                                               */
/*==============================================================*/
create table PANSTWO 
(
   id_panstwa           integer                        not null,
   nazwa_panstwa        char(100)                      not null,
   kontynent            char(40)                       not null,
   domena_internetowa   char(5)                        not null,
   waluta               char(40)                       not null,
   skrot_waluty         char(3)                        not null,
   constraint PK_PANSTWO primary key (id_panstwa)
);

comment on table PANSTWO is 
'Tabela zawierajaca informacje dotyczace danego panstwa.';

comment on column PANSTWO.id_panstwa is 
'Id panstwa ';

comment on column PANSTWO.nazwa_panstwa is 
'Nazwa panstwa ';

comment on column PANSTWO.kontynent is 
'Kontynent na ktorym lezy panstwo.';

comment on column PANSTWO.domena_internetowa is 
'Domena internetowa obowiazujaca w danym panstwie.';

comment on column PANSTWO.waluta is 
'Waluta obowiazujaca w danym panstwie.';

comment on column PANSTWO.skrot_waluty is 
'Kod waluty.';

/*==============================================================*/
/* Index: PANSTWO_PK                                            */
/*==============================================================*/
create unique index PANSTWO_PK on PANSTWO (
id_panstwa ASC
);

/*==============================================================*/
/* Table: POBYT                                                 */
/*==============================================================*/
create table POBYT 
(
   id_pobytu            integer                        not null,
   id_polaczenia        integer                        null,
   id_pokoju            integer                        not null,
   dlugosc_pobytu       char(3)                        not null,
   cena_pobytu          numeric(9,2)                   not null,
   sposob_finansowania  char(50)                       not null,
   czy_all_inclusive    binary(3)                      not null,
   constraint PK_POBYT primary key (id_pobytu)
);

comment on table POBYT is 
'Tabela zawierajaca informacje o pobycie klientow w miejscu docelowym. Pobyt organizowany jest przez biuro podrozy.';

comment on column POBYT.id_pobytu is 
'Id pobytu klientow, organizowanym przez biuro podrozy.';

comment on column POBYT.id_polaczenia is 
'Id polaczenia. Jest to numer odrozniajacy polaczenia realizowane przez roznych przewoznikow, roznymi srodkami transportu, na roznych relacjach, trasach.';

comment on column POBYT.dlugosc_pobytu is 
'Dlugosc pobytu klientow w miejscu docelowym, warazone w dniach.';

comment on column POBYT.cena_pobytu is 
'Laczna cena za pobyt, wycieczke, wyrazona w zl.';

comment on column POBYT.sposob_finansowania is 
'Sposob finansowania pobytu, np. na raty, gotowka, odroczona platnoscia, karta podarunkowa.';

comment on column POBYT.czy_all_inclusive is 
'Czy pobyt w standardzie all inclusive?
TAK - w standardzie all inclusive
NIE - nie w standardzie all inclusive';

/*==============================================================*/
/* Index: POBYT_PK                                              */
/*==============================================================*/
create unique index POBYT_PK on POBYT (
id_pobytu ASC
);

/*==============================================================*/
/* Index: TRANSPORT_POBYT_FK                                    */
/*==============================================================*/
create index TRANSPORT_POBYT_FK on POBYT (
id_polaczenia ASC
);

/*==============================================================*/
/* Index: POBYT_POKOJE_FK                                       */
/*==============================================================*/
create index POBYT_POKOJE_FK on POBYT (
id_pokoju ASC
);

/*==============================================================*/
/* Table: POBYT_ATRAKCJE                                        */
/*==============================================================*/
create table POBYT_ATRAKCJE 
(
   id_pobytu            integer                        not null,
   id_atrakcji          integer                        not null,
   constraint PK_POBYT_ATRAKCJE primary key (id_pobytu, id_atrakcji)
);

comment on column POBYT_ATRAKCJE.id_pobytu is 
'Id pobytu klientow, organizowanym przez biuro podrozy.';

comment on column POBYT_ATRAKCJE.id_atrakcji is 
'Id atrakcji w miejscu organizowania wycieczek przez biuro podrozy.';

/*==============================================================*/
/* Index: POBYT_ATRAKCJE_PK                                     */
/*==============================================================*/
create unique index POBYT_ATRAKCJE_PK on POBYT_ATRAKCJE (
id_pobytu ASC,
id_atrakcji ASC
);

/*==============================================================*/
/* Index: POBYT_ATRAKCJE_FK                                     */
/*==============================================================*/
create index POBYT_ATRAKCJE_FK on POBYT_ATRAKCJE (
id_pobytu ASC
);

/*==============================================================*/
/* Index: POBYT_ATRAKCJE2_FK                                    */
/*==============================================================*/
create index POBYT_ATRAKCJE2_FK on POBYT_ATRAKCJE (
id_atrakcji ASC
);

/*==============================================================*/
/* Table: POBYT_KLIENCI                                         */
/*==============================================================*/
create table POBYT_KLIENCI 
(
   id_pobytu            integer                        not null,
   id_klienta           integer                        not null,
   constraint PK_POBYT_KLIENCI primary key (id_pobytu, id_klienta)
);

comment on column POBYT_KLIENCI.id_pobytu is 
'Id pobytu klientow, organizowanym przez biuro podrozy.';

comment on column POBYT_KLIENCI.id_klienta is 
'Id klienta korzystajacego z uslug biura podrozy.';

/*==============================================================*/
/* Index: POBYT_KLIENCI_PK                                      */
/*==============================================================*/
create unique index POBYT_KLIENCI_PK on POBYT_KLIENCI (
id_pobytu ASC,
id_klienta ASC
);

/*==============================================================*/
/* Index: POBYT_KLIENCI_FK                                      */
/*==============================================================*/
create index POBYT_KLIENCI_FK on POBYT_KLIENCI (
id_pobytu ASC
);

/*==============================================================*/
/* Index: POBYT_KLIENCI2_FK                                     */
/*==============================================================*/
create index POBYT_KLIENCI2_FK on POBYT_KLIENCI (
id_klienta ASC
);

/*==============================================================*/
/* Table: POKOJE                                                */
/*==============================================================*/
create table POKOJE 
(
   id_pokoju            integer                        not null,
   id_hotelu            integer                        not null,
   nr_pokoju            char(3)                        not null,
   ilosc_miejsc_w_pokoju integer                        not null,
   cena_pokoju          numeric(7,2)                   not null,
   pietro_budynku       integer                        null,
   obecnosc_balkonu     binary(3)                      null,
   obecnosc_sejfu       binary(3)                      null,
   obecnosc_minibaru    binary(3)                      null,
   constraint PK_POKOJE primary key (id_pokoju)
);

comment on table POKOJE is 
'Tabela zawiera szczegolowe informacje o pokojach znajdujacych sie w hotelach wspolpracujacym z biurem podrozy. Wyroznia rozne poziomy standardu oraz udogodnienia.
';

comment on column POKOJE.id_hotelu is 
'Id hotelu wspolpracujacego z biurem podrozy..';

comment on column POKOJE.nr_pokoju is 
'Numer pokoju w hotelu wspolpracujacym z biurem podrozy.';

comment on column POKOJE.ilosc_miejsc_w_pokoju is 
'Informacja dla ilu osob przeznaczony jest pokoj.';

comment on column POKOJE.cena_pokoju is 
'Cena za osobe za noc w hotelu, wyrazona w zl.';

comment on column POKOJE.pietro_budynku is 
'Pietro hotelu na ktorym znajduje sie pokoj.';

comment on column POKOJE.obecnosc_balkonu is 
'Czy w pokoju jest balkon?
TAK - jezeli w pokoju jest balkon
NIE - w pokoju nie ma balkonu';

comment on column POKOJE.obecnosc_sejfu is 
'Czy w pokoju jest sejf?
TAK - jezeli w pokoju byc sejf
NIE - w pokoju nie ma sejfu.';

comment on column POKOJE.obecnosc_minibaru is 
'Czy w pokoju jest minibar?
TAK - jezeli w pokoju jest minibar
NIE - w pokoju nie ma minibaru';

/*==============================================================*/
/* Index: POKOJE_PK                                             */
/*==============================================================*/
create unique index POKOJE_PK on POKOJE (
id_pokoju ASC
);

/*==============================================================*/
/* Index: HOTEL_POKOJE_FK                                       */
/*==============================================================*/
create index HOTEL_POKOJE_FK on POKOJE (
id_hotelu ASC
);

/*==============================================================*/
/* Table: PRACOWNICY                                            */
/*==============================================================*/
create table PRACOWNICY 
(
   id_pracownika        integer                        not null,
   id_oddzialu          integer                        not null,
   pesel                char(11)                       not null,
   nazwisko             char(20)                       not null,
   imie                 char(20)                       not null,
   stanowisko           char(20)                       not null,
   wynagrodzenie_miesieczne numeric(5,2)                   not null,
   data_zatrudnienia    date                           null,
   data_wygasniecia_umowy date                           null,
   typ_umowy            char(20)                       null,
   nr_konta_pracownika  char(26)                       not null,
   constraint PK_PRACOWNICY primary key (id_pracownika)
);

comment on table PRACOWNICY is 
'Tabela zawiera szereg informacji o pracownikach biura podróŸy. Pracownikami s¹ zarówno przewodnicy, opiekunowie grup wycieczkowych, osoby odpowiedzialne za transport klientów oraz pracownicy oddzia³ów i pionu administacyjnego.';

comment on column PRACOWNICY.id_pracownika is 
'id_pracownika jest to identyfikator kazdego pracownika biura podrozy.';

comment on column PRACOWNICY.pesel is 
'Pesel pracownika biura podrozy.';

comment on column PRACOWNICY.nazwisko is 
'Nazwisko pracownika biura podrozy.';

comment on column PRACOWNICY.imie is 
'Jest to imie pracownika biura podrozy.';

comment on column PRACOWNICY.stanowisko is 
'Jest to stanowisko pracownika biura podrozy.';

comment on column PRACOWNICY.wynagrodzenie_miesieczne is 
'Jest to godzinowe wynagrodzenie pracownika w zl.';

comment on column PRACOWNICY.data_zatrudnienia is 
'Data podpisania umowy z pracownikiem.';

comment on column PRACOWNICY.data_wygasniecia_umowy is 
'Jest to data, kiedy konczy sie umowa podpisana z pracownikiem.';

comment on column PRACOWNICY.typ_umowy is 
'Typ umowy, ktory zostanie zawarty miedzy pracownikiem i pracodawca.';

comment on column PRACOWNICY.nr_konta_pracownika is 
'Nr konta na ktory zostaja przelane wynagrodzenie';

comment on primary key on PRACOWNICY is 
'klucz_pracownika';

/*==============================================================*/
/* Index: PRACOWNICY_PK                                         */
/*==============================================================*/
create unique index PRACOWNICY_PK on PRACOWNICY (
id_pracownika ASC
);

/*==============================================================*/
/* Index: ODDZIAL_PRACOWNICY_FK                                 */
/*==============================================================*/
create index ODDZIAL_PRACOWNICY_FK on PRACOWNICY (
id_oddzialu ASC
);

/*==============================================================*/
/* Table: REGION                                                */
/*==============================================================*/
create table REGION 
(
   id_regionu           integer                        not null,
   id_panstwa           integer                        not null,
   nazwa_regionu        char(50)                       not null,
   rodzaj_regionu       char(50)                       not null,
   jezyk_urzedowy       char(40)                       not null,
   strefa_klimatyczna   char(30)                       null,
   constraint PK_REGION primary key (id_regionu)
);

comment on table REGION is 
'Tabela zawiera informacje o jednostkach podzialu administacyjnego obowiazujacych w danym kraju np. w polskie wojewodztwo. ';

comment on column REGION.id_regionu is 
'Id regionu.';

comment on column REGION.id_panstwa is 
'Id panstwa ';

comment on column REGION.nazwa_regionu is 
'Nazwa regionu.';

comment on column REGION.rodzaj_regionu is 
'Rodzaj regionu to nazwa jednostki administracyjnej obowiazujacej w danym kraju np. wojewodztwa, stany, obwody.';

comment on column REGION.jezyk_urzedowy is 
'Jezyk jaki jest uznany jezykiem urzedowym w danym regionie.';

comment on column REGION.strefa_klimatyczna is 
'Obszar Ziemi, przyjmuj¹cy zazwyczaj postaæ równole¿nikowego pasa, w obrêbie którego podobny przebieg maj¹ elementy klimatu wybrane jako podstawa wydzielenia strefy.';

/*==============================================================*/
/* Index: REGION_PK                                             */
/*==============================================================*/
create unique index REGION_PK on REGION (
id_regionu ASC
);

/*==============================================================*/
/* Index: PANSTWO_REGION_FK                                     */
/*==============================================================*/
create index PANSTWO_REGION_FK on REGION (
id_panstwa ASC
);

/*==============================================================*/
/* Table: TRANSPORT                                             */
/*==============================================================*/
create table TRANSPORT 
(
   id_polaczenia        integer                        not null,
   rodzaj_srodka_transportu char(30)                       not null,
   przewoznik           char(30)                       not null,
   relacja              char(60)                       not null,
   cena_polaczenia      numeric(7,2)                   not null,
   constraint PK_TRANSPORT primary key (id_polaczenia)
);

comment on table TRANSPORT is 
'Tabela TRANSPORT zawiera informacje o polaczeniach realizowanych przez roznych przewoznikow, wieloma srodkami transportu,  Na wielu trasach. Srodkami transportu sa samolot, pociag, statek, autobus. ';

comment on column TRANSPORT.id_polaczenia is 
'Id polaczenia. Jest to numer odrozniajacy polaczenia realizowane przez roznych przewoznikow, roznymi srodkami transportu, na roznych relacjach, trasach.';

comment on column TRANSPORT.rodzaj_srodka_transportu is 
'Radzajami srodkow transportu sa:
autobus, pociag, samolot, statek.';

comment on column TRANSPORT.przewoznik is 
'Przewoznik to firma realizujaca polaczenie na wybranej trasie.';

comment on column TRANSPORT.relacja is 
'Relacja to informacja o punkcie poczatkowym oraz docelowym polaczenia.';

comment on column TRANSPORT.cena_polaczenia is 
'Cena za pojedynczy normalny bilet w jedna strone, wyrazona w zl.';

/*==============================================================*/
/* Index: TRANSPORT_PK                                          */
/*==============================================================*/
create unique index TRANSPORT_PK on TRANSPORT (
id_polaczenia ASC
);

alter table ATRAKCJE
   add constraint FK_ATRAKCJE_MIEJSCOWO_MIEJSOWO foreign key (id_miejsowosci)
      references MIEJSOWOSC (id_miejsowosci)
      on update restrict
      on delete restrict;

alter table HOTEL
   add constraint FK_HOTEL_MIEJSCOWO_MIEJSOWO foreign key (id_miejsowosci)
      references MIEJSOWOSC (id_miejsowosci)
      on update restrict
      on delete restrict;

alter table MIEJSCOWOSC_TRANSPORT
   add constraint FK_MIEJSCOW_MIEJSCOWO_TRANSPOR foreign key (id_polaczenia)
      references TRANSPORT (id_polaczenia)
      on update restrict
      on delete restrict;

alter table MIEJSCOWOSC_TRANSPORT
   add constraint FK_MIEJSCOW_MIEJSCOWO_MIEJSOWO foreign key (id_miejsowosci)
      references MIEJSOWOSC (id_miejsowosci)
      on update restrict
      on delete restrict;

alter table MIEJSOWOSC
   add constraint FK_MIEJSOWO_REGION_MI_REGION foreign key (id_regionu)
      references REGION (id_regionu)
      on update restrict
      on delete restrict;

alter table ODDZIAL
   add constraint FK_ODDZIAL_MIEJSCOWO_MIEJSOWO foreign key (id_miejsowosci)
      references MIEJSOWOSC (id_miejsowosci)
      on update restrict
      on delete restrict;

alter table POBYT
   add constraint FK_POBYT_POBYT_POK_POKOJE foreign key (id_pokoju)
      references POKOJE (id_pokoju)
      on update restrict
      on delete restrict;

alter table POBYT
   add constraint FK_POBYT_TRANSPORT_TRANSPOR foreign key (id_polaczenia)
      references TRANSPORT (id_polaczenia)
      on update restrict
      on delete restrict;

alter table POBYT_ATRAKCJE
   add constraint FK_POBYT_AT_POBYT_ATR_POBYT foreign key (id_pobytu)
      references POBYT (id_pobytu)
      on update restrict
      on delete restrict;

alter table POBYT_ATRAKCJE
   add constraint FK_POBYT_AT_POBYT_ATR_ATRAKCJE foreign key (id_atrakcji)
      references ATRAKCJE (id_atrakcji)
      on update restrict
      on delete restrict;

alter table POBYT_KLIENCI
   add constraint FK_POBYT_KL_POBYT_KLI_POBYT foreign key (id_pobytu)
      references POBYT (id_pobytu)
      on update restrict
      on delete restrict;

alter table POBYT_KLIENCI
   add constraint FK_POBYT_KL_POBYT_KLI_KLIENCI foreign key (id_klienta)
      references KLIENCI (id_klienta)
      on update restrict
      on delete restrict;

alter table POKOJE
   add constraint FK_POKOJE_HOTEL_POK_HOTEL foreign key (id_hotelu)
      references HOTEL (id_hotelu)
      on update restrict
      on delete restrict;

alter table PRACOWNICY
   add constraint FK_PRACOWNI_ODDZIAL_P_ODDZIAL foreign key (id_oddzialu)
      references ODDZIAL (id_oddzialu)
      on update restrict
      on delete restrict;

alter table REGION
   add constraint FK_REGION_PANSTWO_R_PANSTWO foreign key (id_panstwa)
      references PANSTWO (id_panstwa)
      on update restrict
      on delete restrict;

