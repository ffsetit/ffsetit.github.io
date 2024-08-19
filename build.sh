#!/bin/bash
bundle exec jekyll build
cp _site/en/assets/css/style.css /tmp/classic.css
cp _site/en/assets/css/style.css.map /tmp/classic.css.map
sed -i 's/skin: classic/skin: dark/g' _config.yml
bundle exec jekyll build
sed -i 's/skin: dark/skin: classic/g' _config.yml
cp _site/en/assets/css/style.css /tmp/dark.css
cp _site/en/assets/css/style.css.map /tmp/dark.css.map
cp /tmp/*.css _site/en/assets/css/
cp /tmp/*.css.map _site/en/assets/css/