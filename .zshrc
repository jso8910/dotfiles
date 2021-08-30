# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=9223372036854775807
SAVEHIST=9223372036854775807
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS

#bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jason/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export PROMPT="EXIT CODE: %?"" "${NEWLINE}"%* %n @%m %~ %%"$'\n'%b">>> "
export EDITOR=vim
bindkey '\e[OH' beginning-of-line
bindkey '\e[OF' end-of-line

if [ ! "$TERM" = "linux" ]; then
    source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/tools:/opt/android-sdk/tools/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/jason/.local/bin:/var/lib/snapd/snap/bin
alias size="du -sh"
alias sudo="sudo "
alias offline='unshare -r -n'
alias dir='dir --color=auto'
alias ls='exa --color=always --group-directories-first --icons'
alias vim='nvim'
setopt AUTO_CD
alias yay="paru"
alias history="cat ~/.zsh_history"
alias bluesink='pacmd set-default-sink $(pacmd list-sinks | grep "<bluez_sink" | cut -c9- | tr -d ">")'
export EDITOR=nvim
alias swayconfig="nvim ~/.config/sway/config"
alias obs="QT_QPA_PLATFORM=xcb obs"
alias record='wf-recorder -g "$(slurp)" -f recording-$(date +"%Y-%m-%d_%H.%M.%S").mp4'

bindkey "^E" autosuggest-accept
bindkey "^ " autosuggest-execute

eval $(thefuck --alias)
export IDEA_JDK=/usr/lib/jvm/java-8-openjdk
export STUDIO_JDK=/usr/lib/jvm/java-8-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1
. "/home/jason/.local/share/lscolors.sh"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"


# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
export MAKEFLAGS="-j4"
alias lsize="ls -Slhr"
alias neofetch="neofetch --ascii_distro arch"
alias nyarchfetch="neofetch --ascii ~/ascii/nyarch --gap '-250'"
alias virtualenv-create="virtualenv venv"
alias source-venv="source venv/bin/activate"

# opam configuration
test -r /home/jason/.opam/opam-init/init.zsh && . /home/jason/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
newmac() {
  echo $(openssl rand -base64 12)|md5sum|sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/02:\1:\2:\3:\4:\5/'
}
export PATH=/home/jason/.cargo/bin:$PATH
export PATH=/root/.local/share/gem/ruby/*/bin:/home/jason/.gem/ruby/*/bin$PATH

alias gnth="MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session"
#alias gnth="XDG_SESSION_TYPE=wayland dbus-run-session gnome-session"

updateLinuxLogoStart() {
  cd ~/build
  rm -rf linux
  asp update
  asp checkout linux
  cd linux
  cd trunk
  git show
}

updateLinuxLogoLTSStart() {
  cd ~/build
  rm -rf linux-lts
  asp update
  asp checkout linux-lts
  cd linux-lts
  cd trunk
  git show
}

updateAurPackage() {
  makepkg --printsrcinfo > .SRCINFO
  git commit -a
  git push
}
export CCACHE_EXEC=/usr/bin/ccache
export USE_CCACHE=1


[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

alias openaurkey="ssh-add ~/.ssh/aur"
parufind() {
    pkg=$(paru -Sl | awk '{print $2($4=="" ? "" : " *")}' | sk --multi --preview 'paru -Si {1}' | cut -d " " -f 1)
    print -sr -- "paru -S ${pkg%%$'\n'}"
    echo $pkg
    paru -S $pkg
    unset pkg
}

histfind() {
    cmd=$(history | fzf --multi)
    print -sr -- "${cmd%%$'\n'}"
    echo $cmd
    eval $cmd
    unset cmd
}
setopt HIST_FIND_NO_DUPS

help() {
    $(fc -ln -1 | head -n1 | awk '{print $1;}') -h
}

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_SDK=$HOME/Android/Sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH

if [ -f /tmp/autologin ]
then
    rm /tmp/autologin
    sway-run
fi

export PATH=~/.pyenv/shims:$PATH
precmd () {print -Pn "\e]0;%~\a"}
source $HOME/.cargo/env

