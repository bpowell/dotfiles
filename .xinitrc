autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xrandr --output LVDS1 --mode 1366x768
xrandr --output VGA1 --left-of LVDS1 --mode 1920x1080
wname LG3D
exec awesome
