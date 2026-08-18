# Analyse des habitudes de consommation Mobile Money et détection des clients à risque

## Contexte

Ce projet simule le travail d'un data analyst chez un opérateur Mobile Money au Sénégal (Orange Money, Free Money, Wave). L'objectif est d'identifier les clients dont l'activité diminue afin de mettre en place des actions de fidélisation avant qu'ils ne se désengagent.

## Problématique

Comment identifier les clients à risque de désengagement à partir de leurs habitudes de transaction, afin de permettre à l'entreprise d'agir de façon ciblée et prioritaire ?

## Données

- **5 000 clients** répartis sur 3 régions : Dakar, Thiès, Ziguinchor
- **80 000 transactions** couvrant l'année 2025
- 3 opérateurs : Orange Money, Free Money, Wave
- 2 catégories de transactions : achat de crédit, transfert d'argent

Les données brutes contenaient volontairement des anomalies réalistes : doublons, valeurs manquantes, incohérences de casse, formats de date mixtes, clés orphelines — pour reproduire les conditions d'un vrai jeu de données d'entreprise.

## Méthodologie

1. **Power Query** — nettoyage des données brutes : suppression des doublons, correction des formats de date, harmonisation de la casse, gestion des valeurs manquantes
2. **SQL Server** — requêtes d'analyse combinant jointures, regroupements (GROUP BY) et fonctions de fenêtrage (Window Functions) pour calculer le panier moyen par région et détecter l'inactivité client
3. **Power BI** — construction d'un tableau de bord interactif (KPIs, carte régionale, tableau d'alerte, graphiques d'analyse)

## Outils utilisés

- Power Query
- SQL Server (SSMS)
- Power BI Desktop

## Résultats clés

- **Chiffre d'affaires total** : 6,34 millions FCFA
- **2 166 clients** inactifs depuis plus de 30 jours
- **704 clients** n'ont fait aucune transaction depuis plus de 180 jours — le noyau de clients à risque critique
- **Dakar** génère le plus grand volume de transactions, suivi de Thiès puis Ziguinchor
- **Orange Money** représente la plus grande part du chiffre d'affaires, suivi de Wave puis Free Money

## Recommandations

1. Prioriser le contact des 704 clients inactifs depuis plus de 180 jours (appel ou SMS), en cherchant à comprendre la cause de leur désengagement et en leur proposant des offres ciblées
2. Pour les clients inactifs depuis moins de 90 jours, une relance automatique ou une notification promotionnelle peut suffire à réactiver leur usage
3. Approfondir l'analyse en croisant l'inactivité avec la région, pour cibler les actions terrain

## Auteur

Dieu Donné — Data Analyst Junior
