PATH="/home/erica/bin:/home/erica/.gem/ruby/2.6.0/bin:${PATH}"
export PATH

export BROWSER=vivaldi-stable

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
   # exec startx xmonad.start ## If you wish to be logged out when you exit X.
   if [ -f ./xmonad.start ]; then
       ssh-agent startx ./xmonad.start
   else
       ssh-agent startxfce4
   fi
fi
