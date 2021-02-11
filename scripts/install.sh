#!/usr/bin/zsh

print "Hello! This is my install script. Don't delete this folder, because files are symlinked and not moved or copied"
print "If you aren't on arch, change the install commands and everything"
print 'Please disable any display manager you have (eg lightdm) unless it is sddm, because swaywm often breaks a few things on lightdm. Disable it with systemctl disable [name of manager]'
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


