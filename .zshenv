#export DISPLAY=localhost:0.0
#export DISPLAY=:0.0
export CLICOLOR="YES"
export BLAS=/usr/local/lib/libfblas.a
export LAPACK=/usr/local/lib/libflapack.a

bindkey -v
setopt menucomplete

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

nd () { $1=$PWD ;  : ~$1 }

lsh() { ls -lt $* | head -20 }

dvorak(){
  setxkbmap dvorak
}

qwerty(){
  setxkbmap
}
