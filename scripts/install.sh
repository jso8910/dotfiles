#!/usr/bin/zsh

#print "Hello! This is my install script. Don't delete this folder, because files are symlinked and not moved or copied"
print "If you aren't on arch, change the install commands and everything"
print 'Please disable any display manager you have (eg lightdm) unless it is sddm, because swaywm often breaks a few things on lightdm. Disable it with systemctl disable [name of manager]'
print 'Warning!!!! THIS WILL DELETE ALL CONFIGS YOU HAVE FOR SWAY, WAYBAR, ALACRITTY, NVIM, ROFI, AND ZSH. IT WILL ALSO DOWNLOAD LOTS OF STUFF (INCLUDING OVER 2GB OF FONTS) SO MAKE SURE YOU HAVE A GOOD NETWORK CONNECTION FOR A LONG TIME!'
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


print 'Generating pkgfile for command-not-found support'
install_pkg pkgfile
sudo pkgfile --update

print 'Installing Firefox'
install_pkg firefox

print 'Installing swaywm'
install_pkg sway

print 'Installing sddm and enabling'
install_pkg sddm
sudo systemctl enable sddm

print 'Installing Dracula theme'
cp ../.themes/Dracula ~/.themes/
print 'If you want qt apps to use the theme, look that up because I sure cant be bothered to'
print 'This script assumes you will only use sway. I have not modified the settings file of gnome because wayland (and therefore sway) doesnt honor it. Make sure to change the settings if you switch off of sway'

print 'Installing nvim config and nvim'
install_pkg neovim
mkdir -p ~/.config/nvim
rm -rf ~/.config/nvim/*
cp ../.config/nvim/init.vim ~/.config/nvim/

print 'Installing python3 and pip'
install_pkg python3 python-pip

print 'Installing vlc'
install_pkg vlc

print 'Installing nerd-fonts-complete'
install_pkg nerd-fonts-complete

print 'Installing coding stuff'
install_pkg code jetbrains-toolbox

print 'Installing misc stuff'
install_pkg btm tldr light i3-volume mako swaybg mopidy ncmpcpp swayidle swaylock grimshot

print 'Installing sway config'
mkdir -p ~/.config/sway
rm -rf ~/.config/sway/*
cp ../.config/sway/config ~/.config/sway/
print 'You can put your wallpaper in /Pictures/Wallpapers/wallpaper.png'
print 'You can put a blurred version of your wallpaper (for swaylock) in /Pictures/Wallpapers/blurredwallpaper.png'

print 'Installing rofi config and rofi'
install_pkg rofi
mkdir -p ~/.config/rofi
rm -rf ~/.config/rofi/*
cp ../.config/rofi/* ~/.config/rofi/

print 'Installing alacritty config and alacritty'
install_pkg alacritty

print 'Installing waybar config and waybar'
install_pkg waybar
mkdir -p ~/.config/waybar
rm -rf ~/.config/waybar/*
cp ../.config/waybar/* ~/.config/waybar/

