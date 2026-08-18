-- Nettoyage de la table Transactions
-- Suppression des doublons, harmonisation casse, correction format date, conversion Montant

IF OBJECT_ID('Transactions_Clean', 'U') IS NOT NULL
    DROP TABLE Transactions_Clean;

SELECT 
    TransactionID,
    ClientID,
    CASE 
        WHEN Date LIKE '__/__/____' 
        THEN CONVERT(DATE, Date, 103)
        ELSE CONVERT(DATE, Date, 23)
    END AS Date,
    TRY_CAST(Montant AS DECIMAL(10,2)) AS Montant,
    UPPER(Type) AS Type,
    CategorieTransaction
INTO Transactions_Clean
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY TransactionID ORDER BY TransactionID) AS rn
    FROM Transactions
) AS t
WHERE rn = 1;
