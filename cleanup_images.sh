#!/bin/bash
# Script de nettoyage des images inutiles du depot tyrolit-catalogue-client
# A executer dans le terminal de GitHub Codespaces, a la racine du depot,
# avec le fichier img_cleanup_list.txt place a la racine du depot.
set -e

echo "Suppression des images non referencees dans products.json..."
count=0
while IFS= read -r file; do
  if [ -f "$file" ]; then
    git rm -q "$file"
    count=$((count+1))
  fi
done < img_cleanup_list.txt

echo ""
echo "$count images supprimees."
echo ""
echo "Commit et envoi des changements..."
git commit -m "Nettoyage: suppression des images non referencees dans products.json"
git push

echo ""
echo "Termine !"
