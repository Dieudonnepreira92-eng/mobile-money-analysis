-- =====================================================
-- Script : nettoyage-clients.sql
-- Objectif : Nettoyer la table Clients pour l'analyse
-- Actions : suppression des doublons, harmonisation de 
--           la casse, gestion des valeurs manquantes
-- =====================================================

IF OBJECT_ID('Clients_Clean', 'U') IS NOT NULL
    DROP TABLE Clients_Clean;

-- Création de la table nettoyée
SELECT 
    ClientID,
    Nom,
    -- Harmonisation de la région : mise en majuscules
    -- + remplacement des valeurs vides/nulles par une valeur explicite
    CASE 
        WHEN UPPER(Region) IS NULL OR UPPER(Region) = '' THEN 'NON RENSEIGNE'
        ELSE UPPER(Region)
    END AS Region,
    DateInscription
INTO Clients_Clean
FROM (
    -- Dédoublonnage : on garde une seule ligne par ClientID
    -- ROW_NUMBER() + PARTITION BY identifie les doublons
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY ClientID ORDER BY ClientID) AS rn
    FROM Clients
) AS t
WHERE rn = 1;
