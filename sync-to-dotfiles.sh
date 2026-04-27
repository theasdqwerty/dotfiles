#!/bin/bash
set -e

echo "📁 Синхронизация конфигов из ~/ в ~/dotfiles..."

mkdir -p ~/dotfiles/.config/alacritty
mkdir -p ~/dotfiles/.config/conky
mkdir -p ~/dotfiles/.config/autostart

cp ~/.zshrc ~/dotfiles/ && echo "✓ .zshrc" || echo "✗ .zshrc"
cp ~/.vimrc ~/dotfiles/ && echo "✓ .vimrc" || echo "✗ .vimrc"
cp ~/.tmux.conf ~/dotfiles/ && echo "✓ .tmux.conf" || echo "✗ .tmux.conf"
cp ~/.config/alacritty/alacritty.toml ~/dotfiles/.config/alacritty/ && echo "✓ alacritty.toml"
cp ~/.config/conky/conky.conf ~/dotfiles/.config/conky/ && echo "✓ conky.conf"
cp ~/.config/autostart/conky.desktop ~/dotfiles/.config/autostart/ && echo "✓ conky.desktop"

dpkg --get-selections > ~/dotfiles/packages.list 2>/dev/null && echo "✓ packages.list"
pipx list --short > ~/dotfiles/pipx-packages.list 2>/dev/null && echo "✓ pipx-packages.list"

echo "✅ Синхронизация завершена"
