-- 1) 2) 3)

create table klientai (
	kliento_id bigint PRIMARY KEY AUTO_INCREMENT,
	vardas VARCHAR(15) NOT NULL,
	pavarde VARCHAR(15) NOT NULL
);

insert into klientai (vardas, pavarde) values ('Kęstutis', 'Gedgaudas');
insert into klientai (vardas, pavarde) values ('Rokas', 'Žemaitis');
insert into klientai (vardas, pavarde) values ('Vytautas', 'Paulauskas');
insert into klientai (vardas, pavarde) values ('Žygimantas', 'Petrauskas');
insert into klientai (vardas, pavarde) values ('Marius', 'Simkus');
insert into klientai (vardas, pavarde) values ('Žygimantas', 'Rutkauskas');
insert into klientai (vardas, pavarde) values ('Mindaugas', 'Žemaitis');
insert into klientai (vardas, pavarde) values ('Giedrius', 'Navickas');
insert into klientai (vardas, pavarde) values ('Petras', 'Paulauskas');
insert into klientai (vardas, pavarde) values ('Rokas', 'Kavaliauskas');
insert into klientai (vardas, pavarde) values ('Marius', 'Jonaitis');
insert into klientai (vardas, pavarde) values ('Linas', 'Navickas');
insert into klientai (vardas, pavarde) values ('Rokas', 'Kazlauskas');
insert into klientai (vardas, pavarde) values ('Gintaras', 'Lukauskas');
insert into klientai (vardas, pavarde) values ('Kazimieras', 'Vaitkus');
insert into klientai (vardas, pavarde) values ('Kazimieras', 'Navickas');
insert into klientai (vardas, pavarde) values ('Vytautas', 'Žukauskas');
insert into klientai (vardas, pavarde) values ('Petras', 'Jonaitis');
insert into klientai (vardas, pavarde) values ('Vytautas', 'Vaitkus');
insert into klientai (vardas, pavarde) values ('Gintaras', 'Lukauskas');

create table uzsakymai (
	uzsakymo_nr bigint PRIMARY KEY AUTO_INCREMENT,
	saskaitos_data DATE,
	saskaitos_numeris INT(8),
	saskaitos_suma DECIMAL(7, 2) NOT NULL,
	kliento_id bigint NOT NULL,
    FOREIGN KEY (kliento_id) REFERENCES klientai(kliento_id)
);

insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2016-07-26', 98765432, '01.23', 19);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2012-10-30', 98765432, '67.89', 18);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2009-03-31', 87654321, '10.00', 4);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2000-03-09', 98761234, '76.98', 3);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2019-08-09', 98761234, '45.67', 5);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2011-11-23', 98765432, '09.21', 19);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2018-03-17', 98765432, '43.65', 12);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2011-11-23', 23456789, '10.00', 12);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2017-09-21', 87654321, '54.32', 19);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2019-08-09', 98761234, '87.90', 3);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2005-07-12', 98765432, '56.78', 1);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2009-03-31', 87654321, '54.32', 4);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2002-02-18', 87654321, '45.67', 5);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2004-12-01', 98761234, '12.34', 4);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2003-09-05', 87654321, '76.98', 6);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2015-02-10', 98761234, '89.01', 18);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2016-07-26', 34567890, '23.45', 18);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2019-08-09', 98761234, '56.78', 1);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2023-10-12', 98765432, '54.32', 6);
insert into uzsakymai (saskaitos_data, saskaitos_numeris, saskaitos_suma, kliento_id) values ('2017-09-21', 98761234, '09.21', 2);

-- 4)

SELECT MIN(saskaitos_suma) AS minimali_suma
FROM uzsakymai;

-- 5)

SELECT CONCAT(klientai.vardas,' ',klientai.pavarde) AS klientas, SUM(uzsakymai.saskaitos_suma) AS suma
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
WHERE klientai.kliento_id = 2
GROUP BY klientai.kliento_id;

-- 6)

SELECT CONCAT(klientai.vardas,' ',klientai.pavarde) AS klientas, SUM(uzsakymai.saskaitos_suma) AS suma
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
WHERE klientai.vardas = 'Petras' OR klientai.vardas = 'Linas' OR klientai.vardas = 'Vytautas'
GROUP BY klientai.kliento_id
ORDER BY suma DESC;

-- 7)

SELECT CONCAT(klientai.vardas,' ',klientai.pavarde) AS klientas, SUM(uzsakymai.saskaitos_suma) AS suma
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
GROUP BY klientai.kliento_id
HAVING suma BETWEEN 43 and 109;

-- 8)

SELECT DISTINCT vardas
FROM klientai
ORDER BY vardas;

-- 1)

SELECT 
    ROUND(MIN(saskaitos_suma), 2) AS maziausia_saskaita,
    ROUND(AVG(saskaitos_suma), 2) AS vidutine_saskaita,
    ROUND(MAX(saskaitos_suma), 2) AS didziausia_saskaita
FROM uzsakymai;

-- 2)

SELECT kliento_id, vardas, pavarde
FROM klientai
WHERE LENGTH(pavarde) = (SELECT MAX(LENGTH(pavarde)) FROM klientai);

-- 3)

SELECT UPPER(CONCAT(vardas,' ',pavarde)) AS klientas
FROM klientai;

-- 4)

ALTER TABLE klientai
ADD active int NOT NULL;

UPDATE klientai
SET active = 1
WHERE kliento_id BETWEEN 5 AND 15;

SELECT CONCAT(klientai.vardas,' ',klientai.pavarde) AS klientas,
CASE 
    WHEN active = 0 THEN 'neaktyvus'
    WHEN active = 1 THEN 'aktyvus'
END AS kliento_statusas
FROM klientai;

-- 5)

SELECT klientai.kliento_id
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
GROUP BY klientai.kliento_id
HAVING SUM(uzsakymai.saskaitos_suma) > 80;


