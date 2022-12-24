PATH="/home/eric/bin:/home/eric/.gem/ruby/2.6.0/bin:${PATH}"
export PATH

export BROWSER=vivaldi-stable

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
   # exec startx xmonad.start ## If you wish to be logged out when you exit X.
    if [ -f ./xmonad.start ]; then
        startx ./xmonad.start
   else
	   startxfce4
   fi
fi
