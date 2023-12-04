-- 2) antra lentele

CREATE TABLE uzsakymai (
    uzsakymo_nr bigint PRIMARY KEY AUTO_INCREMENT,
    uzsakymo_kaina decimal(20, 2) NOT NULL,
    uzsakymo_data int NOT NULL,
    kliento_id bigint NOT NULL,
    FOREIGN KEY (kliento_id) REFERENCES klientai(kliento_id)
);

-- 4)

SELECT * 
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id;

-- 5)

SELECT *
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
WHERE uzsakymai.uzsakymo_nr IS NULL;

-- 6)

SELECT klientai.kliento_id, vardas, pavarde, count(uzsakymai.uzsakymo_nr) AS uzsakymu_skaicius
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
GROUP BY klientai.kliento_id;

-- 7)

SELECT klientai.kliento_id, vardas, pavarde, count(uzsakymai.uzsakymo_nr) AS uzsakymu_skaicius
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
GROUP BY klientai.kliento_id
HAVING uzsakymu_skaicius >= 3;

-- 8) -- !!nebaigta

ALTER TABLE uzsakymai

-- 9)

SELECT *
FROM uzsakymai
WHERE uzsakymo_kaina > 100;

-- 10)

SELECT klientai.kliento_id, vardas, pavarde, IFNULL(uzsakymo_nr, 'nera uzsakymu') AS uzsakymo_nr
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id;


-- 11) -- !!nebaigta

-- 12)

SELECT vardas, pavarde, uzsakymo_data
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
WHERE uzsakymo_data <= '2020-01-01';

-- 13)

SELECT klientai.kliento_id, vardas, pavarde, uzsakymo_kaina,
CASE 
    WHEN uzsakymo_kaina > 100 THEN 'priklauso dovana'
END AS pristatymas
FROM klientai
LEFT JOIN uzsakymai
ON klientai.kliento_id = uzsakymai.kliento_id
ORDER BY pristatymas DESC;

-- 14) -- !!nebaigta

