xcalib -co 40 -a
xrandr --dpi 125.37
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# japanese input
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'
export DefaultIMModule=fcitx
fcitx

# sway
# xmonad
exec i3

