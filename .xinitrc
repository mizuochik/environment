xrdb .Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
fcitx5 -d
exec awesome
