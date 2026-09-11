#!/bin/bash
# Script de nettoyage et organisation du dépôt tyrolit-catalogue-client
# A executer dans le terminal de GitHub Codespaces, a la racine du depot.
set -e

echo "1. Suppression des photos inutiles..."
while IFS= read -r file; do
  if [ -f "$file" ]; then
    git rm -q "$file"
    echo "  supprimé: $file"
  fi
done < fotos_a_apagar.txt

echo ""
echo "2. Création du dossier img/ et déplacement des photos..."
mkdir -p img
shopt -s nullglob
for f in *.jpg *.jpeg *.JPG *.JPEG *.png *.PNG; do
  git mv "$f" "img/$f"
done
shopt -u nullglob

echo ""
echo "3. Commit et envoi des changements..."
git commit -m "Nettoyage des photos inutiles et organisation dans img/"
git push

echo ""
echo "Termine ! Le depot est maintenant organise."
