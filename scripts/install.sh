#!/usr/bin/zsh


print "If you aren't on arch, change the install commands and everything"
print 'Warning!!!! THIS WILL DELETE ALL CONFIGS YOU HAVE FOR SWAY, WAYBAR, ALACRITTY, NVIM, ROFI, AND ZSH ALONG WITH YOUR ~/.fonts FOLDER.'
print -n "Note: This script requires you having access to sudo. Continue? [y/N]: $(tput sgr0)" && read -k1 && print

if [[ $REPLY != 'y' ]]; then
	exit 1;
fi

command -v pacman >/dev/null 2>&1 || { echo >&2 "Non-arch system detected, debian normie."; exit 1; }

command -v pamac >/dev/null 2>&1 && { echo "Manjaro detected, auto-installing paru from repos."; sudo pacman -S paru --needed --noconfirm }

command -v paru >/dev/null 2>&1 || { echo >&2 "I require paru but it's not installed. Aborting."; exit 1; }

function check_answer {
	case $1 in
		[yY]) return 0 ;;
		*)    return 1 ;;
	esac
}

function install_pkg {
	paru -S $@ --needed --noconfirm
}

print 'Installing and enabling tlp'
install_pkg tlp
sudo systemctl enable --now tlp

print 'Generating pkgfile for command-not-found support'
install_pkg pkgfile
sudo pkgfile --update

print 'Installing discord mopidy rich presence and other discord stuff'
install_pkg mpd-rich-presence-discord-git powercord-git discord discord-canary powercord-git nodejs-lts-dubnium

print 'Installing browsers (multiple depending on my mood)' 
install_pkg chromium
install_pkg qutebrowser pass pass-import qt5-webengine-widevine qt5-wayland qt5-webkit

print 'Installing swaywm'
install_pkg sway

print 'Installing python3 and pip' 
install_pkg python python-pip

print 'Installing nvim'
install_pkg neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
chmod +x installer.sh
sh installer.sh ~/.local/share/vim
pip install --user --upgrade pynvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

print 'Installing vlc'
install_pkg vlc

print 'Installing coding stuff'
install_pkg code code-marketplace jetbrains-toolbox

print 'Installing misc stuff'
install_pkg bottom-bin tldr light i3-volume mako swaybg mopidy ncmpcpp swayidle swaylock-effects-git grimshot xorg-xwayland thefuck sunwait wallutils wl-clipboard libnotify exa nodejs bibata-extra-cursor-theme

print 'Installing rofi'
install_pkg rofi-lbonn-wayland-git 

print 'Installing kitty'
install_pkg kitty 

print 'Installing waybar'
install_pkg waybar

print 'Installing p10k and zsh-autosuggestions'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

print 'Installing the kernel thing, best package'
install_pkg kernel-modules-hook
sudo systemctl daemon-reload 
sudo systemctl enable --now linux-modules-cleanup

print 'Installing yadm'
install_pkg yadm

print 'Youtube stuff'
install_pkg youtube-viewer mpv task-spooler 
