#!/bin/bash
arquivo="$1"

while IFS= read -r linha; do
parte1=`echo "$linha" | cut -d ">" -f1`
parte2=`echo "$linha" | cut -d ">" -f2`

parte2_trad=`trans -b "$parte2"`
echo "${parte1}> ${parte2_trad}" >> messages_pt_br.txt
done < "$arquivo"

