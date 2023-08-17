#!/usr/bin/env bash

dest_dir=$(find ~ ~/Documents/ ~/Documents/1.projects ~/Documents/2.areas ~/Documents/3.resources -type d -mindepth 1 -maxdepth 1 | fzf)
session_name=$(basename "$dest_dir" | tr . _)

if ! tmux has-session -t "$session_name" 2> /dev/null; then
  tmux new-session -s "$session_name" -c "$dest_dir" -d
fi

tmux switch-client -t "$session_name"
