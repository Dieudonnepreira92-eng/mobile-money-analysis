-- Vue pour la détection des clients inactifs
-- Calcule le nombre de jours depuis la dernière transaction de chaque client

CREATE VIEW V_ClientsInactivite AS
SELECT DISTINCT
    ClientID,
    MAX(Date) OVER (PARTITION BY ClientID) AS DerniereTransaction,
    DATEDIFF(DAY, MAX(Date) OVER (PARTITION BY ClientID), (SELECT MAX(Date) FROM Transactions_Clean)) AS JoursInactivite
FROM Transactions_Clean;
