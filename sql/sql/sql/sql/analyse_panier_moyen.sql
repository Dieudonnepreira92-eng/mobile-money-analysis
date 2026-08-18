-- Analyse du panier moyen et volume de transactions par région

SELECT
    c.Region,
    AVG(t.Montant) AS PanierMoyen,
    COUNT(t.TransactionID) AS NombreTransactions,
    SUM(t.Montant) AS ChiffreAffaires
FROM Clients_Clean c
INNER JOIN Transactions_Clean t
    ON c.ClientID = t.ClientID
GROUP BY c.Region
ORDER BY ChiffreAffaires DESC;
