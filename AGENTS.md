# Clic du Coin — Agent Instructions

## Objectif du projet

Clic du Coin est un site vitrine pour présenter une activité de création de sites internet simples, modernes et utiles pour commerçants, artisans et indépendants locaux.

Le site doit convaincre un commerçant de quartier de contacter Thomas pour créer ou refaire son site.

## Public cible

- Commerçants locaux
- Artisans
- Restaurants
- Coiffeurs
- Indépendants
- Petites structures peu à l’aise avec le numérique

## Message principal

Un site clair, local et utile, sans prise de tête.

## Priorités

1. Clarté immédiate.
2. Design professionnel.
3. Mobile first.
4. Performance.
5. CTA visible.
6. Ton humain, local et crédible.
7. Aucune surcharge technique inutile.

## Stack

- Next.js App Router
- TypeScript
- Tailwind CSS
- shadcn/ui
- Framer Motion avec modération
- Supabase seulement si nécessaire pour formulaire, CRM ou espace admin

## Design

Le site doit être impressionnant mais lisible.
Il doit donner une impression de sérieux, pas de démo technique.

À privilégier :
- belle hiérarchie typographique ;
- sections aérées ;
- cards propres ;
- micro-animations légères ;
- preuve locale ;
- offres simples ;
- contact clair.

À éviter :
- jargon startup ;
- marketplace ;
- SaaS abstrait ;
- animations qui masquent le message ;
- texte trop long.

### 3D

Autorisée depuis 2026-07-10 (validé par Thomas), via Three.js / React Three Fiber (`@react-three/fiber`, `@react-three/drei`).
Contrainte : reste au service du message, ne doit pas nuire à la compréhension en moins de 10 secondes ni au temps de chargement mobile. À charger en lazy/dynamic import, jamais bloquant pour le premier rendu.

## Structure recommandée

1. Hero
2. Problème des commerçants
3. Solution Clic du Coin
4. Services
5. Méthode de travail
6. Pourquoi Thomas
7. Exemples / cas d’usage
8. FAQ
9. Contact

## Commandes de vérification

Toujours utiliser les commandes disponibles du projet :

```bash
npm run lint
npm run build
npm run dev