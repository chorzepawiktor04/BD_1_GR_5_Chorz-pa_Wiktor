CREATE DATABASE firma;            --tworzenie bazy danych

USE firma;                        --użycie bazy

CREATE SCHEMA rozliczenia;


CREATE TABLE rozliczenia.pracownicy (                        --NOT NULL nie trzeba wpisywać do zmiennych z primary key, każdy pracownik musi mieć imię i nazwisko oraz adres, ale telefon nie jest konieczny
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    telefon VARCHAR(15)
);

CREATE TABLE rozliczenia.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin DECIMAL(9, 2) NOT NULL,
    id_pracownika INT NOT NULL
);

CREATE TABLE rozliczenia.pensje (
    id_pensji INT PRIMARY KEY,
    stanowisko VARCHAR(50) NOT NULL,
    kwota DECIMAL(10, 2) NOT NULL,
    id_premii INT
);

CREATE TABLE rozliczenia.premie (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(50) NOT NULL,
    kwota DECIMAL(10, 2) NOT NULL
);



ALTER TABLE rozliczenia.godziny.
ADD FOREIGN KEY (id_pracownika)                                       --dodajemy dodatkową wartość do danej tabeli
REFERENCES rozliczenia.pracownicy(id_pracownika);                --referencja rozliczenia.pracownicy, oznacza że wartość id pracownika zostaje przepisana do z "pracownicy" do "godziny"

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie(id_premii);



INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Maciej', 'Kowal', 'ul. Kwiatowa 90', '123456789'),
(2, 'Anna', 'Nowakowski', 'ul. Leśna 12', '987654321'),
(3, 'Paweł', 'Lisicki', 'ul. Szkolna 3', '111222333'),
(4, 'Ewelina', 'Woźna', 'ul. Polna 14', '444555666'),
(5, 'Kamila', 'Królik', 'ul. Ogrodowa 35', '777888999'),
(6, 'Magda', 'Mazurek', 'ul. Rzeczna 6', '222333444'),
(7, 'Tomasz', 'Kaczmarski', 'ul. Młyńska 52', '555666777'),
(8, 'Karolina', 'Adamczyk', 'ul. Krótka 28', '999000111'),
(9, 'Wojciech', 'Wojciechowski', 'ul. Długa 93', '666777888'),
(10, 'Natalia', 'Sienna', 'ul. Zielona 10', '333444555');



INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2023-11-01', 8, 11),
(2, '2023-11-02', 7, 2),
(3, '2023-11-03', 6, 3),
(4, '2023-11-04', 8, 4),
(5, '2023-11-05', 7, 5),
(6, '2023-11-06', 8, 6),
(7, '2023-11-07', 7, 7),
(8, '2023-11-08', 6, 8),
(9, '2023-11-09', 8, 9),
(10, '2023-11-10', 7, 10);

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES
(1, 'Premia za staż', 200),
(2, 'Premia za wyniki', 150),
(3, 'Premia świąteczna', 100),
(4, 'Premia za efektywność', 180),
(5, 'Premia jubileuszowa', 250),
(6, 'Premia motywacyjna', 170),
(7, 'Premia za nadgodziny', 120),
(8, 'Premia uznaniowa', 160),
(9, 'Premia za specjalizację', 190),
(10, 'Premia za osiągnięcia', 140);

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES
(1, 'Kierownik', 3500, 1),
(2, 'Specjalista', 2800, 2),
(3, 'Asystent', 2300, 3),
(4, 'Pracownik fizyczny', 2000, 4),
(5, 'Analityk', 3200, 5),
(6, 'Projektant', 3000, 6),
(7, 'Administrator', 2600, 7),
(8, 'Konsultant', 2900, 8),
(9, 'Technik', 2400, 9),
(10, 'Programista', 3100, 10);


SELECT nazwisko, adres
FROM rozliczenia.pracownicy;

SELECT 
DATEPART(WEEKDAY, data) AS dzien_tygodnia,
DATEPART(MONTH, data) AS miesiac
FROM rozliczenia.godziny;



ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje
ADD kwota_netto DECIMAL(10, 2);

UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto / 1.23;

SELECT * FROM rozliczenia.pensje;

