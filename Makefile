.PHONY: install
install: zsh bin X11

.PHONY: zsh
zsh:
	cp .z* ~/         # install zsh dotfiles.
	cp .ctags ~/      # install ctags config.

.PHONY: bin
bin:
	mkdir -p ~/bin
	cp bin/* ~/bin/

.PHONY: X11
X11:
	cp .Xresources ~/
	mkdir -p ~/.icons/default
	cp xcursor.theme ~/.icons/default/index.theme
	touch ~/.Xauthority

.PHONY: hidpi
hidpi:
	cat hidpi.txt .Xresources > ~/.Xresources
