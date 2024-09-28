#!/bin/bash

URL="https://bulky-expectations-340118.framer.app"
FOLDER=$(echo "$URL" | sed 's~https://~~')

echo "[+] Download files from sitemap"
rm -rf "$FOLDER"
curl -s "$URL/sitemap.xml" | grep https | grep -oP '(?<=<loc>).*?(?=</loc>)' | while read -r url; do wget -m -p -E -k "$url"; done

echo "[+] Hide framer badge"
find . -type f -exec sed -i 's/id="__framer-badge-container" style="display: none;">/id="__framer-badge-container" style="display: none;">/g' {} \;

echo "[+] Setup github config"
echo "jenny.ngoluong.no" > CNAME
touch .nojekyll
