if [ ! -e ~/.zplug/ ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

if [ -e ~/.zplug/ ]; then
  source ~/.zplug/init.zsh

  zplug 'zsh-users/zsh-autosuggestions'
  zplug 'zsh-users/zsh-completions'
  zplug 'zsh-users/zsh-syntax-highlighting', defer:2
  zplug 'mollifier/anyframe'
  zplug 'Tarrasch/zsh-autoenv'

  if ! zplug check --verbose; then
    printf 'Install? [y/N]: '

    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load --verbose
fi

