#!/bin/bash
set -e

echo "🔄 Восстановление конфигов из ~/dotfiles..."

cp ~/dotfiles/.zshrc ~/ && echo "✓ .zshrc" || echo "✗ .zshrc"
cp ~/dotfiles/.vimrc ~/ && echo "✓ .vimrc" || echo "✗ .vimrc"
cp ~/dotfiles/.tmux.conf ~/ && echo "✓ .tmux.conf" || echo "✗ .tmux.conf"
mkdir -p ~/.config/alacritty && cp ~/dotfiles/.config/alacritty/alacritty.toml ~/.config/alacritty/ && echo "✓ alacritty.toml"
mkdir -p ~/.config/conky && cp ~/dotfiles/.config/conky/conky.conf ~/.config/conky/ && echo "✓ conky.conf"
mkdir -p ~/.config/autostart && cp ~/dotfiles/.config/autostart/conky.desktop ~/.config/autostart/ && echo "✓ conky.desktop"

# Использовать для получения списка пакетов
# cat ~/dotfiles/packages.list | grep -v deinstall | cut -f1
#
# Восстановление пакетов (закомментировано, так как требует sudo и осторожности)
# dpkg --set-selections < ~/dotfiles/packages.list && apt-get dselect-upgrade -y
# pipx install --short < ~/dotfiles/pipx-packages.list 2>/dev/null

echo "✅ Восстановление завершено. Перезагрузи терминал или выполни 'source ~/.zshrc'"
