# load the zplug function
source $(brew --prefix)/opt/zplug/init.zsh

# my plugin definitions
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
# zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

# install uninstalled plugins
zplug check || zplug install

# update plugins once per week
if [[ ! -f $TMPDIR/zplug_update_timestamp ]]; then
  touch $TMPDIR/zplug_update_timestamp
fi
if (( ( $(date +%s) - $(date -r $TMPDIR/zplug_update_timestamp +%s) ) / 86400 > 7 )); then
  zplug update
  touch $TMPDIR/zplug_update_timestamp
fi

# load the plugins into the shell
zplug load