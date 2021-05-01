#!/bin/bash
text=$(xclip -o)

if [ $? -eq 1 ]
then
    exit
fi

tmpfile="$(mktemp --suffix=-translate)"
trans -tl pt-BR+en-US -hl en-US+en-US -brief "$text" -o $tmpfile

zenity\
    --width=400\
    --height=720\
    --title="Translation"\
    --text-info --filename="$tmpfile"

rm $tmpfile
