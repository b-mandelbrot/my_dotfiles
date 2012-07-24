#!/bin/bash

path=/Users/brunos.barros/Library/Application\ Support/TextMate/Bundles
cd "${path}"
for i in $(ls); do
  if [[ -d $i ]]; then
    cd $i;
    if [[ -d ".git" ]]; then
        echo "atualizando $i"
        git pull;
    fi
    cd .. ;
  fi
done