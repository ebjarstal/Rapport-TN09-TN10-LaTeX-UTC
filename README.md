# Template LaTeX pour Rapport de Stage TN09-TN10

Ce template LaTeX est conçu pour les rapports de stage TN09 ou TN10 à l'Université de technologie de Compiègne. 

Il suit les recommandations du GI pour le plan : [[Structure du rapport](TN09_TN10 GI_ Structure du rapport.pdf)](https://github.com/GuillaumeHERMOSO/Rapport-TN09-TN10-LaTeX-UTC/blob/main/TN09_TN10%20GI_%20Structure%20du%20rapport.pdf)

![](https://github.com/GuillaumeHERMOSO/Rapport-TN09-TN10-LaTeX-UTC/blob/main/rapport.png)

Inspiré par le template de l'UTT (Axel Mousset, Aurélien Labate): [Template UTT ST09/ST10](https://www.overleaf.com/latex/templates/utt-st09-slash-st10/kwpzjqwhtqjt)

---

## Utilisation sur VS Code

### Prérequis

Tu dois avoir installé :

1. **LaTeX Distribution** : [MacTeX](https://www.tug.org/mactex/) (macOS) ou [TeX Live](https://www.tug.org/texlive/) (Linux/Windows)
2. **VS Code** : [Télécharger VS Code](https://code.visualstudio.com/)
3. **Extension LaTeX Workshop** : Elle s'installera automatiquement à l'ouverture du projet

### Installation

```bash
git clone https://github.com/ebjarstal/Rapport-TN09-TN10-LaTeX-UTC.git
cd Rapport-TN09-TN10-LaTeX-UTC
code .
```

### Compilation

- **Automatique** : Le PDF se compile automatiquement à chaque sauvegarde (Cmd+S / Ctrl+S)
- **Manuel** : Clique sur l'icône de compilation dans la barre latérale LaTeX Workshop
- **Nettoyage** : Utilise la commande "LaTeX Workshop: Clean up auxiliary files"

### Visualisation

Le PDF s'ouvre automatiquement dans un onglet VS Code avec :
- Synchronisation bidirectionnelle (clic dans le PDF vers le fichier source)
- Actualisation automatique
- Zoom et navigation intégrés

---

## Utilisation sur Overleaf

Tu peux utiliser ce template directement sur Overleaf : [Open as template](https://www.overleaf.com/latex/templates/utc-tn09-slash-tn10/zbtpffvtkyyp)

**Alternative** : Importe le projet manuellement
1. Télécharge le fichier ZIP de ce template [ici](https://github.com/GuillaumeHERMOSO/Rapport-TN09-TN10-LaTeX-UTC/archive/refs/heads/main.zip)
2. Sur Overleaf, crée un nouveau projet
3. Importe le fichier ZIP en tant que projet existant (Upload Zipped Project)

---

## Structure du Projet

```
doc.tex                 # Fichier principal (compiler celui-ci)
references.bib          # Bibliographie
lib/
  ├── frontpage.tex     # Page de garde (à personnaliser)
  ├── utc-report-template.sty  # Style UTC (NE PAS MODIFIER)
  ├── glossaire.sty     # Définitions du glossaire
  └── macro.tex         # Macros réutilisables
parts/
  ├── 1-Remerciements.tex
  ├── 2-Introduction.tex  # Contient des exemples d'utilisation
  ├── 3-Presentation.tex
  ├── 4-Missions.tex
  ├── 5-Realisations.tex
  ├── 6-Conclusion.tex
  └── 7-Annexes.tex
assets/
  └── UTC.eps           # Logo UTC (ajouter vos images ici)
```

---

## Personnalisation

### 1. Page de Garde

Édite `lib/frontpage.tex` pour modifier :
- Ton nom, semestre, filière (apparaît 2 fois : en haut à droite et en bas)
- Le titre et sous-titre du rapport
- Les dates, encadrants, lieu

### 2. Ajouter des Figures

Place tes images dans `assets/`, puis utilise :
```latex
\boxIMAGE{\textwidth}{0.98\textwidth}{assets/monimage.png}{Légende}{fig:monlabel}
```
Référence ensuite avec `\ref{fig:monlabel}`

### 3. Créer des Encadrés

```latex
\boxTEXTE{Titre de l'encadré}{Contenu de l'encadré}
```

### 4. Glossaire

Dans `lib/glossaire.sty` :
```latex
\newglossaryentry{monterme}{
    name = \underline{Mon Terme},
    description = {Définition du terme}
}
```
Dans le texte : `\gls{monterme}`

### 5. Bibliographie

Ajoute tes références dans `references.bib`, puis cite avec `\cite{cle}`

---

## Exemples d'Utilisation

Consulte `parts/2-Introduction.tex` pour des exemples de :
- Utilisation du glossaire
- Insertion d'images avec `\boxIMAGE`
- Création d'encadrés avec `\boxTEXTE`
- Citations bibliographiques

---

## Compilation Manuelle (Ligne de commande)

### Avec le script de build (recommandé)

```bash
./build.sh           # Compilation complète
./build.sh --open    # Compilation + ouverture du PDF
./clean.sh           # Nettoyer les fichiers auxiliaires
./clean.sh --all     # Nettoyer tout (y compris le PDF)
```

### Compilation complète manuelle

Si tu n'utilises pas VS Code ni Overleaf :
```bash
pdflatex doc.tex
biber doc
makeglossaries doc
pdflatex doc.tex
pdflatex doc.tex
```

---

## Dépannage

**Erreur de compilation** :
- Vérifie que tous les packages LaTeX sont installés (MacTeX/TeX Live complets)
- Nettoie les fichiers auxiliaires : `./clean.sh`
- Consulte le [Guide de Dépannage Complet](TROUBLESHOOTING.md)

**Le PDF ne se met pas à jour** :
- Sauvegarde le fichier `.tex` (Cmd+S / Ctrl+S)
- Vérifie que LaTeX Workshop est bien activé

**Références non trouvées** :
- Lance une compilation complète : `./build.sh`

---

## Licence

Modifie-le selon tes besoins.

