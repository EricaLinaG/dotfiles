#!/bin/bash

chsh -s /bin/zsh

# install zsh dotfiles.
cp .z* ~/

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi

# install Git
brew install git

# install python3
brew install python3
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi

#install macvim.
brew install macvim
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi

# copy cvim and vvim to /usr/local/bin
echo "======================================================================"
echo "Use the commandline mvim to fire up the macvim gui"
echo "Use the commandline cvim to fire up macvim in a terminal without gui"
cp mvim /usr/local/bin/
cp cvim /usr/local/bin/

#install exuberant ctags
brew install ctags-exuberant
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
cp .ctags ~/
echo "ctags is installed installed"

#install wget
brew install wget
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
echo "wget is installed installed"

#Install the ubuntu fonts.
wget -v http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
unzip ubuntu-font-family-0.80.zip -d /Library/fonts/
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
echo "Ubuntu fonts are installed"
echo "The Ubuntu monospace fonts are really nice with Iterm2"

#Install iterm2
wget -v http://iterm2.com/downloads/stable/iTerm2_v1_0_0.zip
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
unzip iTerm2_v1_0_0.zip -d /Applications/
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
echo "Iterm 2 is installed"

cp np /usr/local/bin/
echo "np is installed in /usr/local/bin/"
echo "use np from the command line to open a multipaned Iterm2 window on a project folder.  np <some folder>"

echo "installing spf13 and extras"
# install spf13 for vim.
sh <(curl https://j.mp/spf13-vim3 -L)
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi

cp .vimrc.local ~/
cp .vimrc.bundles.local ~/

wget http://downloads.sourceforge.net/project/pyclewn/pyclewn-1.10/pyclewn-1.10.py2.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpyclewn%2Ffiles%2Flatest%2Fdownload%3Fsource%3Dfiles&ts=1376598447&use_mirror=hivelocity
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi

tar xzf pyclewn*.tar.gz
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
cd pyclewn*.py3
python setup.py install --force
rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi
echo "Pyclewn is installed."
echo " Cmapkeys sets up the key mappings for the debugger."
echo "here are a couple key maps for Pyclewn"
echo "map <silent><leader>db :Pyclewn<cr>"
echo "map <silent><leader>mk :Cmapkeys<cr>"


# Open web page for iterm2
open http://www.iterm2.com/#/section/home

#Open web page for spf13
open https://github.com/spf13/spf13-vi://github.com/spf13/spf13-vim

# Open page on pyclewn debugger
open http://pyclewn.sourceforge.net/index.html

# Open page on macvim FAQ.
open https://github.com/b4winckler/macvim/wiki/FAQ


# Install scientific computing for python
echo "============================================================================="
echo "Installing scientific computing for python"
echo "virtualenv, virtualenvwrapper, numpy, gfortran, scipy, freetype, matplotlib"
echo "ipython, pyqt, zmq, pygments, pandas, statsmodels"
pip install virtualenv
pip install virtualenvwrapper
pip install numpy
brew install gfortran
pip install scipy
brew install freetype
pip install matplotlib
pip install ipython

# install the QT libraries as described
# in the text below before continuing
brew install pyqt
brew install zmq
pip install pyzmq
pip install pygments
pip install pandas
pip install statsmodels

echo "try this:  ipython qtconsole --pylab=inline"

open http://wiki.python.org/moin/NumericAndScientific




