#!/bin/bash
cd ~/dotfiles

if [[ -n $(git status --porcelain) ]]; then
    echo "$(date): Обнаружены изменения, делаю коммит и пуш..." >> ~/dotfiles/auto-push.log
    
    git add .
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    
    echo "$(date): Пуш выполнен успешно" >> ~/dotfiles/auto-push.log
else
    echo "$(date): Изменений нет, пуш не требуется" >> ~/dotfiles/auto-push.log
fi
