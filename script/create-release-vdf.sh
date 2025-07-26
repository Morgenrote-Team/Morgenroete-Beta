#!/bin/bash

# Check mod directory
if [ -d "$1" ]
then
  mod_path=$(realpath "$1")
else
  printf 'Missing Mod Directory'
  printf '\n'
  printf 'Usage: ./create-release-vdf.sh MOD_DIR DESC_FILE [MOD_ID]'
  exit 1
fi

title=$(grep -Po '(?<=\s\"name\"\s:\s\").+(?=\",)' "$mod_path/.metadata/metadata.json")

# Read mod id
if [ -n "$2" ]
then
  mod_id="$2"
else
  mod_id='0'
fi

# Clean up old file
printf '' > workshop.vdf

printf '"workshopitem"' >> workshop.vdf
printf '\n' >> workshop.vdf
printf '{' >> workshop.vdf
printf '\n' >> workshop.vdf
printf '\t"appid" "529340"' >> workshop.vdf
printf '\n' >> workshop.vdf
printf '\t"publishedfileid" "%s"' "$mod_id" >> workshop.vdf
printf '\n' >> workshop.vdf
printf '\t"contentfolder" "%s"' "$mod_path" >> workshop.vdf
printf '\n' >> workshop.vdf
printf '\t"previewfile" "%s/thumbnail.png"' "$mod_path" >> workshop.vdf
printf '\n' >> workshop.vdf
printf '\t"title" "%s"' "$title" >> workshop.vdf
printf '\n' >> workshop.vdf
printf '}' >> workshop.vdf

cat workshop.vdf