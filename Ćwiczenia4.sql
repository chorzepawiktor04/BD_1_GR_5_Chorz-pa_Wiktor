CREATE D
ATABASE firma;
USE firma;
CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (                        --NOT NULL nie trzeba wpisywać do zmiennych z primary key, każdy pracownik musi mieć imię i nazwisko oraz adres, ale telefon nie jest konieczny
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    telefon VARCHAR(15)
);

CREATE TABLE ksiegowosc.godziny (
    id_godziny INT PRIMARY KEY,
    data DATE NOT NULL,
    liczba_godzin DECIMAL(9, 2) NOT NULL,
    id_pracownika INT NOT NULL
);

CREATE TABLE ksiegowosc.pensje (
    id_pensji INT PRIMARY KEY,
    stanowisko VARCHAR(50) NOT NULL,
    kwota DECIMAL(10, 2) NOT NULL,
    id_premii INT
);

CREATE TABLE ksiegowosc.premie (
    id_premii INT PRIMARY KEY,
    rodzaj VARCHAR(50) NOT NULL,
    kwota DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ksiegowosc.wynagrodzenia (
    id_wynagrodzenia PRIMARY KEY,
    data DATE NOT NULL,
    id_pracownika INT NOT NULL,
    id_godziny INT NOT NULL,
    id_pensji INT NOT NULL,
    id_premii INT NULL
);



INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
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



INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
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

INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
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

INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota, id_premii)
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


INSERT INTO ksiegowosc.wynagrodzenia(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
(1, '2023-01-01', 1, 1, 1, 1),
(2, '2023-01-02', 2, 2, 2, 2),
(3, '2023-01-03', 3, 3, 3, 3),
(4, '2023-01-04', 4, 4, 4, 4),
(5, '2023-01-05', 5, 5, 5, 5),
(6, '2023-01-06', 6, 6, 6, 6),
(7, '2023-01-07', 7, 7, 7, 7),
(8, '2023-01-08', 8, 8, 8, 8),
(9, '2023-01-09', 9, 9, 9, 9),
(10, '2023-01-10', 10, 10, 10, 10);

--a
SELECT id_pracownika, nazwisko FROM pracownicy;

--b
SELECT id_pracownika FROM pracownicy 
JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.wynagrodzenia.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji
JOIN ksiegowosc.premie ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii
WHERE (ksiegowosc.pensje.kwota + ksiegowosc.premie.kwota) > 1000;

--c
SELECT id_pracownika FROM pracownicy 
JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.wynagrodzenia.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.premie ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji
WHERE(ksiegowosc.wynagrodzenia.id_premii) ISNULL AND (ksiegowosc.pensje.kwota + ksiegowosc.premie.kwota) > 2000;

--d
SELECT imie, nazwisko FROM pracownicy
WHERE imie LIKE "J%";

--e
SELECT imie, nazwisko FROM pracownicy
WHERE nazwisko LIKE "N%" OR nazwisko LIKE "%n%" OR nazwisko LIKE "%a";

--f
SELECT imie, nazwisko, SUM (liczba_godzin - 160) AS liczba_nadgodzin  FROM pracownicy
JOIN ksiegowosc.wynagrodzenia.id_godzin = ksiegowosc.godziny.id_godzin
GROUP BY liczba_nadgodzin
HAVING(liczba_godzin) > 160;

--g
SELECT imie, nazwisko FROM pracownicy
JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.wynagrodzenia.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji
WHERE kwota BETWEEN 1500 AND 3000;

--h
SELECT imie,nazwisko,SUM(liczba_godzin)
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
GROUP BY ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,ksiegowosc.wynagrodzenie.id_premii
HAVING SUM(liczba_godzin)>10 AND ksiegowosc.wynagrodzenie.id_premii =0

--i
SELECT imie, nazwisko FROM pracownicy
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji
ORDER BY kwota DESC;

--j
SELECT imie, nazwisko FROM pracownicy
JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.wynagrodzenia.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji
JOIN ksiegowosc.premie ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii
ORDER BY (ksiegowosc.pensje.kwota + ksiegowosc.premie.kwota) DESC;


--k
SELECT stanowisko FROM pensje
JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.wynagrodzenia.id_pracownika = ksiegowosc.pensje.id_pensji
JOIN ksiegowosc.pracownicy ON ksiegowosc.pensje.id_pracownika = ksiegowosc.wynagrodzenia.id_ppracownika
SUM (pensje)
FROM pracownicy
GROUP BY stanowisko;

--l
SELECT AVG(kwota) FROM pensje WHERE (stanowisko = 'Kierownik')
SELECT MAX(kwota) FROM pensje WHERE (stanowisko = 'Kierownik')
SELECT MIN(kwota) FROM pensje WHERE (stanowisko = 'Kierownik');

--m
 SELECT SUM(premia.kwota+pensja.kwota) AS suma_wynagrodznia
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
JOIN ksiegowosc.premia ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii

--o)
SELECT stanowisko, COUNT(id_premii) 
FROM ksiegowosc.pensja
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensja.id_pensji
GROUP BY stanowisko;

--p)

DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN(
 SELECT id_pracownika
 FROM ksiegowosc.wynagrodzenie
 JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji =ksiegowosc.wynagrodzenie.id_pensji
 WHERE kwota<1200 );

