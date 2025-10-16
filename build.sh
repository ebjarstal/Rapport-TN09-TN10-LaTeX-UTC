#!/bin/bash
# Script de compilation du rapport LaTeX UTC TN09/TN10

set -e  # Arrêter en cas d'erreur

echo "Compilation du rapport UTC TN09/TN10..."
echo ""

echo "[1/5] Première passe pdflatex..."
pdflatex -interaction=nonstopmode doc.tex > /dev/null

echo "[2/5] Traitement bibliographie (biber)..."
biber doc 2>&1 | grep -E "(WARN|ERROR|INFO - Output)" || true

echo "[3/5] Génération glossaire (makeglossaries)..."
makeglossaries doc 2>&1 | grep -E "(done|Error)" || true

echo "[4/5] Deuxième passe pdflatex..."
pdflatex -interaction=nonstopmode doc.tex > /dev/null

echo "[5/5] Troisième passe pdflatex (références)..."
pdflatex -interaction=nonstopmode doc.tex > /dev/null

echo ""
echo "Compilation terminée avec succès!"
echo "Fichier généré : doc.pdf"
ls -lh doc.pdf

# Optionnel : ouvrir le PDF
if [[ "$1" == "--open" ]]; then
    echo ""
    echo "Ouverture du PDF..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open doc.pdf
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open doc.pdf
    fi
fi
