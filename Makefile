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
	cp xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/

.PHONY: hidpi
hidpi:  zsh
	cat hidpi.txt .Xresources > ~/.Xresources
	cat hidpi_env.txt >> ~/.zshenv

.PHONY: enable-anbox
enable-anbox:
	systemctl enable anbox-container-manager.service
	mkdir -p /etc/systemd/system/anbox-container-manager.service.d/
	cp enable-anbox-bridge.conf /etc/systemd/system/anbox-container-manager.service.d/
	systemctl start anbox-container-manager.service
	systemctl status anbox-container-manager.service
