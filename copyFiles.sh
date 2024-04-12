#!/bin/bash

function copy_files() {
	for file in "$@"; do
		cp "$file" .
	done
}

function copy_dirs() {
	for dir in "$@"; do
		rsync -rva --delete --exclude ".git" --exclude ".github" "$dir" .
	done
}

if [[ ! -d ".config" ]]; then
	mkdir .config
fi

echo copying files
copy_files ~/.zshrc ~/.p10k.zsh ~/.tmux.conf

echo copying dirs
cd .config
copy_dirs ~/.config/shell \
	~/.config/nvim \
	~/.config/zellij \
	~/.config/kitty \
	~/.config/wezterm
# ~/.config/nvim.kickstart



cd ..
