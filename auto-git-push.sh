#!/bin/bash
cd ~/dotfiles
if [[ -n $(git status --porcelain) ]]; then
    git add .
    git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "$(date): Push done" >> ~/dotfiles/auto-push.log
else
    echo "$(date): No changes" >> ~/dotfiles/auto-push.log
fi
