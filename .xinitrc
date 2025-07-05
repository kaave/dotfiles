xcalib -co 40 -a
xrandr --dpi 125.37
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# japanese input
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS='@im=fcitx5'
export DefaultIMModule=fcitx5

# sway
# xmonad
exec i3

