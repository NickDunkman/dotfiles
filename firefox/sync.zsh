# re-run firefox/install.sh file when any file in firefox/ changes, which keeps the
# firefox profiles in sync

already_running_count=$(ps aux | grep "fswatch -o $DOTFILES/firefox" | grep -c -v grep)
if [ "$already_running_count" -lt 1 ]; then
    # Runs in background & disowns from current zsh session, so it keeps running even after the
    # terminal is closed.
    nohup fswatch -o $DOTFILES/firefox | xargs -n1 -I{} $DOTFILES/firefox/install.sh 2>&1 &!
fi
