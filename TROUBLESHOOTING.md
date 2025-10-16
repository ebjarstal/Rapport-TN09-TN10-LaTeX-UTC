# Guide de Dépannage

## Problèmes Courants et Solutions

### Erreurs de Compilation

#### "Cannot find reference `fig:XXX`"

**Cause** : Référence utilisée avant que le label soit défini, ou compilation incomplète

**Solutions** :
1. Place `\ref{...}` APRÈS la commande qui crée le label
2. Lance une compilation complète (3 passes pdflatex minimum)
   ```bash
   ./build.sh
   ```

**Exemple INCORRECT** :
```latex
Voir figure \ref{fig:test} : \boxIMAGE{...}{fig:test}
```

**Exemple CORRECT** :
```latex
\boxIMAGE{...}{fig:test}
Comme le montre la figure \ref{fig:test}.
```

---

#### "Illegal unit of measure (pt inserted)"

**Cause** : Paramètre de dimension sans unité dans tcolorbox

**Solution** : Vérifie que tous les paramètres de dimension ont une unité
```latex
% Incorrect
arc = 10

% Correct
arc = 10pt
```

**Fix appliqué** : Ce problème a été corrigé dans `lib/macro.tex`

---

#### "Package biblatex: Please rerun Biber"

**Cause** : La bibliographie n'a pas été générée

**Solution** : Lance la séquence complète de compilation
```bash
./build.sh
```

Ou manuellement :
```bash
pdflatex doc.tex
biber doc          # Cette étape est manquante
pdflatex doc.tex
```

---

#### "Undefined macro 'Nov.'"

**Cause** : Macro non définie dans le fichier `.bib`

**Solution** : Mets les valeurs entre accolades dans `references.bib`
```bibtex
% Incorrect
Month = Nov.

% Correct
Month = {Nov.}
```

---

### Problèmes VS Code

#### LaTeX Workshop ne compile pas automatiquement

**Solutions** :
1. Vérifie que l'extension est installée :
   - Ouvre la palette (Cmd+Shift+P / Ctrl+Shift+P)
   - Tape "Extensions: Show Installed Extensions"
   - Cherche "LaTeX Workshop"

2. Vérifie les paramètres :
   - Ouvre `.vscode/settings.json`
   - Vérifie que `"latex-workshop.latex.autoBuild.run": "onSave"` est présent

3. Redémarre VS Code

---

#### Le PDF ne s'affiche pas

**Solutions** :
1. Vérifie qu'il n'y a pas d'erreurs de compilation dans l'onglet "Problems"
2. Clique sur l'icône "View LaTeX PDF" dans la barre latérale
3. Ouvre manuellement : `Cmd+Shift+P` puis "LaTeX Workshop: View LaTeX PDF"

---

#### "Command not found: pdflatex/biber/makeglossaries"

**Cause** : LaTeX n'est pas installé ou pas dans le PATH

**Solutions** :
- **macOS** : Installe [MacTeX](https://www.tug.org/mactex/)
  ```bash
  # Vérifier l'installation
  which pdflatex
  # Devrait retourner : /Library/TeX/texbin/pdflatex
  ```

- **Linux** : Installe TeX Live
  ```bash
  sudo apt-get install texlive-full
  ```

- **Windows** : Installe [MiKTeX](https://miktex.org/) ou [TeX Live](https://www.tug.org/texlive/)

---

### Problèmes Overleaf

#### "Compilation timeout"

**Cause** : Projet trop lourd ou boucle infinie

**Solutions** :
1. Réduis la qualité/taille des images
2. Commente temporairement les sections non nécessaires
3. Passe sur un compte Overleaf premium (temps de compilation plus long)

---

#### Glossaire non généré

**Cause** : Overleaf peut nécessiter une recompilation

**Solution** : Clique 2-3 fois sur "Recompile" dans Overleaf

---

### Problèmes de Structure

#### "File not found: parts/X-NomDuFichier.tex"

**Cause** : Fichier manquant ou mal nommé

**Solutions** :
1. Vérifie que le fichier existe dans le dossier `parts/`
2. Vérifie l'orthographe exacte dans `doc.tex`
3. N'inclus PAS l'extension `.tex` dans `\include{}`
   ```latex
   % Incorrect
   \include{parts/2-Introduction.tex}
   
   % Correct
   \include{parts/2-Introduction}
   ```

---

#### "Graphics file not found"

**Cause** : Image introuvable ou chemin incorrect

**Solutions** :
1. Place TOUTES les images dans le dossier `assets/`
2. Utilise le chemin relatif : `assets/monimage.png`
3. Vérifie l'extension (`.png`, `.jpg`, `.eps`, `.pdf`)

**Exemple** :
```latex
\boxIMAGE{\textwidth}{0.98\textwidth}{assets/monimage.png}{...}{...}
```

---

## Autres Problèmes

### Réinitialisation complète

Si rien ne fonctionne, nettoie et recompile :
```bash
./clean.sh --all    # Supprime tout (y compris le PDF)
./build.sh          # Recompile depuis zéro
```

### Vérifier les logs

Les fichiers de log contiennent des informations détaillées :
```bash
# Voir les dernières erreurs
tail -50 doc.log
```

### Obtenir de l'aide

1. Consulte les [Issues GitHub](../../issues)
2. Ouvre une [nouvelle issue](../../issues/new) avec :
   - Description du problème
   - Message d'erreur complet
   - Environnement (OS, VS Code/Overleaf)
   - Contenu du fichier `.log` (si applicable)

---

## Checklist de Diagnostic

Avant de signaler un bug, vérifie :

- [ ] J'ai lancé une compilation complète (5 passes)
- [ ] J'ai nettoyé les fichiers auxiliaires (`./clean.sh`)
- [ ] LaTeX est correctement installé (`which pdflatex`)
- [ ] Les fichiers sont bien placés dans les bons dossiers
- [ ] J'ai lu ce guide de dépannage
- [ ] Le problème persiste après redémarrage de VS Code
