xrandr --output eDP-1 --auto --below HDMI-1 &
slstatus &
picom -b &
pulseaudio --daemonize &
feh --bg-fill background.jpg &
setxkbmap -layout us,ru -variant qwerty -option "grp:alt_shift_toggle" &
exec dwm
