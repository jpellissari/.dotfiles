#!/usr/bin/env bash

languages=$(echo "typescript golang css" | tr " " "\n")
core_utils=$(echo "find sed awk tr" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Query to be searched: " query

if echo "$languages" | grep -qs $selected; then
  tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else 
  tmux split-window -p 40 -h bash -c "curl cht.sh/$selected~$query | less"
fi


