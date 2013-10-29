
BREW_VERSION := $(shell brew --version 2>/dev/null)
GIT_VERSION := $(shell git --version 2>/dev/null)
PYTHON3_VERSION := $(shell python3 --version 2>/dev/null)
MACVIM_VERSION := $(shell mvim --version 2>/dev/null)
CTAGS_VERSION := $(shell ctags --version | grep Exuberant 2>/dev/null)
UBUNTU_FONTS := $(shell ls /Library/fonts/Ubuntu*  2>/dev/null)
LEIN_VERSION := $(shell lein --version 2>/dev/null)

HADOOP_VERSION := $(shell hadoop version 2>/dev/null)
THRIFT_VERSION := $(shell thrift --version 2>/dev/null)
MONGODB_VERSION := $(shell mongodb --version 2>/dev/null)

all: basics vim python clojure

basics: zsh brew git wget 

vim: basics macvim ctags fonts iterm2

python:  misc: basics python pyclewn 

clojure: leiningen

bigdata: hadoop mongodb thrift 


zsh: 
	chsh -s /bin/zsh  # change shell to zsh.
	cp .z* ~/         # install zsh dotfiles.

# install brew
brew:
ifndef BREW_VERSION
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
endif

# install Git
git: brew
ifndef GIT_VERSION
	brew install git
endif

# install python3
python: brew
ifndef PYTHON3_VERSION
	brew install python3
endif

# install leiningen - clojure
leiningen: brew
ifndef LEIN_VERSION
	brew install leiningen
endif

#install macvim.
macvim: brew
ifndef MACVIM_VERSION
	brew install macvim
	# copy cvim and vvim to /usr/local/bin
	@echo "======================================================================"
	@echo "Use the commandline mvim to fire up the macvim gui"
	@echo "Use the commandline cvim to fire up macvim in a terminal without gui"
	cp mvim /usr/local/bin/
	cp cvim /usr/local/bin/
else
	@echo "MacVim already installed"
endif

#install exuberant ctags
ctags:  brew
ifndef CTAGS_VERSION
	brew install ctags-exuberant
endif
	cp .ctags ~/
	@echo "ctags is installed"

#install wget
wget: brew
ifndef WGET_VERSION
	brew install wget
endif
	@echo "wget is installed"

#Install the ubuntu fonts.
fonts: wget
ifndef UBUNTU_FONTS
	wget -v http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip
	unzip ubuntu-font-family-0.80.zip -d /Library/fonts/
	@echo "Ubuntu fonts are installed"
	@echo "The Ubuntu monospace fonts are really nice with Iterm2"
endif

#Install iterm2
iterm2: wget
	wget -v http://iterm2.com/downloads/stable/iTerm2_v1_0_0.zip
	unzip iTerm2_v1_0_0.zip -d /Applications/
	@echo "Iterm 2 is installed"
	cp np /usr/local/bin/
	@echo "np is installed in /usr/local/bin/"
	@echo "use np from the command line to open a multipaned Iterm2 window on a project folder.  np <some folder>"

# install spf13 for vim.
spf13:
	@echo "installing spf13 and extras"
	sh <(curl https://j.mp/spf13-vim3 -L)
	cp .vimrc.local ~/
	cp .vimrc.bundles.local ~/

# install pyclewn
pyclewn: wget python
	wget http://downloads.sourceforge.net/project/pyclewn/pyclewn-1.10/pyclewn-1.10.py2.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpyclewn%2Ffiles%2Flatest%2Fdownload%3Fsource%3Dfiles&ts=1376598447&use_mirror=hivelocity
	tar xzf pyclewn*.tar.gz
	cd pyclewn*.py3
	python setup.py install --force
	@echo "Pyclewn is installed."
	@echo " Cmapkeys sets up the key mappings for the debugger."
	@echo "here are a couple key maps for Pyclewn"
	@echo "map <silent><leader>db :Pyclewn<cr>"
	@echo "map <silent><leader>mk :Cmapkeys<cr>"


doc:
	# Open web page for iterm2
	open http://www.iterm2.com/#/section/home
	#Open web page for spf13
	open https://github.com/spf13/spf13-vi://github.com/spf13/spf13-vim
	# Open page on pyclewn debugger
	open http://pyclewn.sourceforge.net/index.html
	# Open page on macvim FAQ.
	open https://github.com/b4winckler/macvim/wiki/FAQ


# Install scientific computing for python
scipy: python brew
	@echo "============================================================================="
	@echo "Installing scientific computing for python"
	@echo "virtualenv, virtualenvwrapper, numpy, gfortran, scipy, freetype, matplotlib"
	@echo "ipython, pyqt, zmq, pygments, pandas, statsmodels"
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

	@echo "try this:  ipython qtconsole --pylab=inline"

	open http://wiki.python.org/moin/NumericAndScientific


# install hadoop
hadoop: brew
ifndef HADOOP_VERSION
	brew install hadoop
endif

# install mongodb
mongodb: brew
ifndef MONGODB_VERSION
	brew install mongodb
endif
#
# install thrift
thrift: brew
ifndef THRIFT_VERSION
	brew install thrift
endif


