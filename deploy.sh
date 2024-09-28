#!/bin/bash

curl -s https://bulky-expectations-340118.framer.app/sitemap.xml | grep https | grep -oP '(?<=<loc>).*?(?=</loc>)' | while read -r url; do wget -m -p -E -k "$url"; done

echo "jenny.ngoluong.no" > bulky-expectations-340118.framer.app/CNAME

touch bulky-expectations-340118.framer.app/.nojekyll
