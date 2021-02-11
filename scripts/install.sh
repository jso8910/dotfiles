#!/usr/bin/zsh

#print "Hello! This is my install script. Don't delete this folder, because files are symlinked and not moved or copied"
print "If you aren't on arch, change the install commands and everything"
print 'Please disable any display manager you have (eg lightdm) unless it is sddm, because swaywm often breaks a few things on lightdm. Disable it with systemctl disable [name of manager]'
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
cd ..

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
cp -aR .themes/Dracula ~/.themes/
print 'If you want qt apps to use the theme, look that up because I sure cant be bothered to'
print 'This script assumes you will only use sway. I have not modified the settings file of gnome because wayland (and therefore sway) doesnt honor it. Make sure to change the settings if you switch off of sway'

print 'Installing nvim config and nvim'
install_pkg neovim
rm -rf ~/.config/nvim/
cp -aR .config/nvim/ ~/.config/

print 'Installing python3 and pip'
install_pkg python3 python-pip

print 'Installing vlc'
install_pkg vlc



print 'Installing coding stuff'
install_pkg code jetbrains-toolbox

print 'Installing misc stuff'
install_pkg bottom tldr light i3-volume mako swaybg mopidy ncmpcpp swayidle swaylock grimshot
mkdir -p ~/.config
print 'Installing sway config'
rm -rf ~/.config/sway/
cp -aR .config/sway/ ~/.config/
print 'You can put your wallpaper in ~/Pictures/Wallpapers/wallpaper.png'
print 'You can put a blurred version of your wallpaper (for swaylock) in ~/Pictures/Wallpapers/blurredwallpaper.png'
print 'Optionally, my wallpapers are in this repo (relative path Pictures/Wallpapers) and you can copy those (blurred and normal) to the wallpapers dir'

print 'Installing rofi config and rofi'
install_pkg rofi
rm -rf ~/.config/rofi/
cp -aR .config/rofi/ ~/.config/

print 'Installing alacritty config and alacritty'
install_pkg alacritty
rm -rf ~/.config/alacritty/
cp -aR .config/alacritty/ ~/.config/

print 'Installing waybar config and waybar'
install_pkg waybar
rm -rf ~/.config/waybar/
cp -aR .config/waybar/ ~/.config/

rm -rf ~/.zshrc
cp .zshrc ~/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

rm -rf ~/.fonts
cp -aR .fonts ~/
