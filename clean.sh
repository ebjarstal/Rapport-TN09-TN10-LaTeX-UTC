#!/bin/bash
# Script de nettoyage des fichiers de compilation LaTeX

echo "Nettoyage des fichiers de compilation..."

# Liste des extensions à supprimer
extensions=(
    "aux" "bbl" "blg" "log" "out" "toc"
    "fls" "fdb_latexmk" "synctex.gz" "synctex.gz(busy)"
    "bcf" "run.xml" "lof" "lot"
    "acn" "acr" "alg" "glg" "glo" "gls" "glsdefs" "ist"
    "idx" "ilg" "ind"
)

# Compter les fichiers supprimés
count=0

for ext in "${extensions[@]}"; do
    files=$(find . -maxdepth 2 -name "*.$ext" 2>/dev/null)
    if [[ -n "$files" ]]; then
        echo "$files" | while read file; do
            echo "  Suppression : $file"
            rm -f "$file"
            ((count++))
        done
    fi
done

# Supprimer les fichiers de conversion EPS
eps_converted=$(find . -name "*-eps-converted-to.pdf" 2>/dev/null)
if [[ -n "$eps_converted" ]]; then
    echo "$eps_converted" | while read file; do
        echo "  Suppression : $file"
        rm -f "$file"
        ((count++))
    done
fi

echo ""
if [[ $count -gt 0 ]]; then
    echo "Nettoyage terminé : $count fichier(s) supprimé(s)"
else
    echo "Aucun fichier à nettoyer"
fi

# Option pour supprimer aussi le PDF
if [[ "$1" == "--all" ]]; then
    if [[ -f "doc.pdf" ]]; then
        rm -f doc.pdf
        echo "PDF supprimé également"
    fi
fi
