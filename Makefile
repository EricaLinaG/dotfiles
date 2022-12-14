.PHONY: install
install: zsh bin X11

.PHONY: zsh
zsh:
	cp .z* ~/         # install zsh dotfiles.
	cp .ctags ~/      # install ctags config.

.PHONY: bin
bin:
	ln -s bin ~/bin/

.PHONY: X11
X11:
	ln -s .Xresources ~/.Xresources

	mkdir -p ~/.icons/default
	cp xcursor.theme ~/.icons/default/index.theme
	touch ~/.Xauthority

# # Should probably consider just having a .config folder here.
# 	mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml
# 	cp xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/

# turn on rotation if it's not on already
#	cp 20-screen.conf /usr/share/X11/xorg.conf.d/

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

.PHONY: enable-multilib
enable-multilib:
	echo "[multilib]" >> /etc/pacman.conf
	echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
	pacman -Syu
