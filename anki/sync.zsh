# re-run anki/sync.sh file when any file in anki/ changes, which:
# 1. copies the latest JS/CSS files into Anki media directory with new version numbers
# 2. updates all card templates in Anki to use the new version numbers 

already_running_count=$(ps aux | grep "fswatch -o $DOTFILES/anki" | grep -c -v grep)
if [ "$already_running_count" -lt 1 ]; then
    # Runs in background & disowns from current zsh session, so it keeps running even after the
    # terminal is closed.
    nohup fswatch -o $DOTFILES/anki | xargs -n1 -I{} $DOTFILES/anki/sync.sh 2>&1 &!
fi
