.PHONY: install
install: zsh bin X11 dialog

.PHONY: zsh
zsh:
	cp .z* ~/         # install zsh dotfiles.
	cp .ctags ~/      # install ctags config.

.PHONY: bin
bin:
	ln -s $(PWD)/bin $(HOME)/bin

.PHONY: dialog
dialog:
	ln -s $(PWD)/.dialogrc $(HOME)/.dialogrc

.PHONY: xresources
xresources:
	ln -s $(PWD)/.Xresources $(HOME)/.Xresources

.PHONY: X11
X11: xresources
	mkdir -p ~/.icons/default
	cp xcursor.theme ~/.icons/default/index.theme
	touch ~/.Xauthority

# make it easy to delete and recreate the links.
links:  bin xresources dialog

clean-links:
	rm -f $(HOME)/bin
	rm -f $(HOME)/.dialogrc
	rm -f $(HOME)/.Xresources

# # Should probably consider just having a .config folder here.
# 	mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml
# 	cp xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/

# turn on rotation if it's not on already
#	cp 20-screen.conf /usr/share/X11/xorg.conf.d/

.PHONY: hidpi
hidpi:  zsh
	cat hidpi.txt >> ~/.Xresources
	cat hidpi_env.txt >> ~/.zshenv

.PHONY: enable-anbox
enable-anbox:
	systemctl enable anbox-container-manager.service
	mkdir -p /etc/systemd/system/anbox-container-manager.service.d/
	cp enable-anbox-bridge.conf /etc/systemd/system/anbox-container-manager.service.d/
	systemctl start anbox-container-manager.service
	systemctl status anbox-container-manager.service

.PHONY: enable-multilib
enable-multilib:
	echo "[multilib]" >> /etc/pacman.conf
	echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
	pacman -Syu
