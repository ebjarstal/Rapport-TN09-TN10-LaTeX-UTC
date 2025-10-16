# Guide de Contribution

## Objectif du Projet

Ce template LaTeX vise à faciliter la rédaction des rapports de stage TN09/TN10 à l'UTC en fournissant une structure conforme aux recommandations du département GI.

## Comment Contribuer

### Signaler un Bug

1. Vérifie qu'il n'a pas déjà été signalé dans les [Issues](../../issues)
2. Crée une nouvelle issue avec :
   - Une description claire du problème
   - Les étapes pour reproduire
   - Ton environnement (OS, distribution LaTeX, VS Code/Overleaf)
   - Le message d'erreur complet si applicable

### Proposer une Amélioration

1. Ouvre une issue pour discuter de ton idée
2. Attends un retour avant de commencer le développement
3. Forke le projet et crée une branche pour ta fonctionnalité
4. Teste ta modification sur VS Code ET Overleaf
5. Soumets une Pull Request

## Checklist Avant de Soumettre

Avant de soumettre ta contribution, vérifie que :

- [ ] Le projet compile sans erreur sur VS Code
- [ ] Le projet compile sans erreur sur Overleaf
- [ ] Les fichiers auxiliaires ne sont pas committés (`.aux`, `.log`, etc.)
- [ ] Le code LaTeX suit les conventions existantes
- [ ] La documentation est mise à jour si nécessaire

## Modifications à Éviter

**Ne modifie PAS** :
- `lib/utc-report-template.sty` - Contient le branding UTC officiel
- Les couleurs UTC (`jauneUTC`, `grisUTC`) définies dans le fichier de style
- La structure des chapitres imposée par le GI

**Préfère** :
- Ajouter de nouvelles macros dans `lib/macro.tex`
- Améliorer les exemples dans `parts/2-Introduction.tex`
- Clarifier la documentation dans le README

## Conventions de Code

### Structure des Fichiers

- Les fichiers de parties sont numérotés : `X-NomDeLaPartie.tex`
- Le numéro détermine l'ordre d'inclusion
- N'utilise pas d'espaces dans les noms de fichiers

### Style LaTeX

- Indentation : 4 espaces
- Utilise `\include{}` plutôt que `\input{}`
- Privilégie les macros prédéfinies (`\boxTEXTE`, `\boxIMAGE`)
- Commente les sections en français

### Exemples de Bonnes Pratiques

```latex
% Bon : utilisation de la macro existante
\boxIMAGE{\textwidth}{0.98\textwidth}{assets/image.png}{Légende}{fig:label}

% Mauvais : recréer un tcolorbox personnalisé
\begin{tcolorbox}[...]
    \includegraphics{...}
\end{tcolorbox}
```

## Tester Tes Modifications

### Test Local

```bash
# Compilation complète
pdflatex doc.tex && biber doc && makeglossaries doc && pdflatex doc.tex && pdflatex doc.tex

# Vérifier qu'il n'y a pas d'erreurs
echo $?  # Doit retourner 0
```

### Test VS Code

1. Ouvre le projet dans VS Code
2. Sauvegarde `doc.tex` (Cmd+S)
3. Vérifie que le PDF se compile automatiquement
4. Teste la synchronisation PDF vers source

### Test Overleaf

1. Upload le projet en tant que ZIP
2. Compile et vérifie l'absence d'erreurs
3. Vérifie que toutes les images s'affichent

## Questions ?

N'hésite pas à ouvrir une [Discussion](../../discussions) pour toute question !
