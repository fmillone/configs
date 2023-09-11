#!/bin/bash

function copy_files() {
	for file in $@; do
		cp $file .
	done
}

function copy_dirs() {
	for dir in $@; do
		cp -r $dir .
	done
}

if [[ ! -d ".config" ]]; then
	mkdir .config
fi

echo copying files
copy_files ~/.zshrc ~/.p10k.zsh

echo copying dirs
cd .config
copy_dirs ~/.config/shell ~/.config/nvim ~/.config/zellij
cd ..
