<<<<<<< HEAD
PATH="/home/eric/bin:/home/eric/.gem/ruby/2.6.0/bin:${PATH}"
=======
PATH="/home/erica/bin:/home/erica/.gem/ruby/2.6.0/bin:${PATH}"
>>>>>>> 92a32f7abb27d9eb357236260af600369139ab5c
export PATH

export BROWSER=vivaldi-stable

# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#    # exec startx xmonad.start ## If you wish to be logged out when you exit X.
#    if [ -f ./xmonad.start ]; then
#        ssh-agent startx ./xmonad.start
#    else
#        ssh-agent startxfce4
#    fi
# fi

# wm_chooser is a dialog in ~/bin.
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    wm_chooser
fi
