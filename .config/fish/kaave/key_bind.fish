function fish_user_key_bindings
  # bind \cr 'peco_select_history (commandline -b)'
  # fzf_key_bindings
end
# remove fzf's legacy keybindings
set -U FZF_LEGACY_KEYBINDINGS 0
bind \cf -e
