export DISPLAY=localhost:0.0
export CLICOLOR="YES"

bindkey -v
setopt menucomplete

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

nd () { $1=$PWD ;  : ~$1 }

lsh() { ls -lt $* | head -20 }

vim() {open -a macvim $*}

alias vi='cvim'

alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'


# get rid of desktop icons.
#defaults write com.apple.finder CreateDesktop -bool false

# command to initiate a growl notification
# ie. growl "make done"
growl() { echo -e $'\e]9;'${1}'\007' ; return  ; }


####################
# sdssas shortcuts  This will be changing to use PM instead of syncpp.
####################

lsl() { 
  syncpp
  /sas/tools/com/sdssas $1 
  syncpp down output
  gl $1.log
}

alias sas=lsl

sl() { 
  syncpp
  sdssas $1 
  syncpp down output
  gl $1.log
}

gl() {
  cat $1 
  echo " "
  echo " "
  echo "________________________________________________________________________________"
  echo "###### Errors #####"; 
  echo "--------------------------------------------------------------------------------"
  egrep -i 'error|lua:|]|:' $1 | egrep -vi 'note|http|The SAS|\[0x'
  echo " "
  echo " "
  echo "________________________________________________________________________________"
  echo "###### ODS STATEMENTS #####"; 
  echo "--------------------------------------------------------------------------------"
  grep -i ods $1 | egrep -vi '\[0x'
  echo " "
  echo " "
  echo "________________________________________________________________________________"
  echo "###### Newest Files #######"; 
  echo "--------------------------------------------------------------------------------"
  ls -lt | head -10 
  echo " "
  echo " "
}

sslt(){
syncpp send
slt $1
syncpp results
}

mslt(){
syncpp minimum send
slt $1
syncpp results
}

slt() { 
  rm slt.sas
  echo ' libname  yyy "./";' > slt.sas
  echo '  ods path(prepend) yyy.templat(update);' >> slt.sas
  ls ods/pgm/en/*.tpl | awk '{printf ("%%inc \"%s\";\n", $0)}' >> slt.sas
  #echo "%inc \"ods/pgm/en/tagsets.tpl\";" > slt.sas
  cat $1.sas >> slt.sas
  sl slt
}

slmt() { 
  ls /sas/dev/mva/ods/pgm/en/*.tpl | awk '{printf ("%%inc \"%s\";\n", $0)}' > slt.sas
  #echo "%inc \"/sas/m901/ods/pgm/en/tagsets.tpl\";" > slt.sas
  cat $1.sas >> slt.sas
  sl slt
}

getfile(){
  rsync -avz lnxlgn:$1 ./
}
putfile(){
  rsync -avz ./$1 lnxlgn:$2 
}

gettst(){
  rsync -avz lnxlgn:/tst/dev/tst-v940/ods/testsrc/$1 ./
}

dvorak(){
  setxkbmap dvorak
}

qwerty(){
  setxkbmap
}

rpdf(){
if [ -z $1 ];then
  acroread -geometry 1200x1100 ~/book/book.pdf &
else
  acroread -geometry 1200x1100 $1 &
fi
}

export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.3/bin:~/bin:/usr/X11R6/bin:/Developer/usr/bin:/usr/local/mysql/bin:/Users/eric/.local/bin
export PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p374/bin
export CDPATH=.:~:~/olderic:~/olderic/Projects/


export DISPLAY=localhost:0.0



