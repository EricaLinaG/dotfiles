
#/usr/X11R6/bin/xhost +

# Setup user specific network location specific stuff.
#if [ -z "$user_net_location" ];then
#    export user_net_location="done"
#    /usr/local/etc/user_net_location.sh start
#    . /sastools/com/sdskshrc
#    sdsenv dev/mva -box bsdnd
#
#    ps -ax | grep -v 'grep' | grep '/usr/X11R6/bin/startx' > /dev/null
#
#   if [ $? != 0 ];then
#      echo -n "start X ? [y/n]:"
#      read -q decision
#      if [ $decision -eq 'y' ];then
#          ssh-agent startx
#      fi
#   fi
#fi

 
