
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000
#bindkey -v
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

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias macos=~/OSX-KVM/OpenCore-Boot.sh
PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/tools:/opt/android-sdk/tools/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/jason/.local/bin
alias size="du -sh"
alias offline='unshare -r -n'
alias dir='dir --color=auto'
alias ls='ls --color=auto'
alias vim='nvim'
setopt AUTO_CD
alias yay="paru"
alias history="cat ~/.zsh_history"
alias bluesink='pacmd set-default-sink $(pacmd list-sinks | grep "<bluez_sink" | cut -c9- | tr -d ">")'
export EDITOR=nvim
alias swayconfig="nvim ~/.config/sway/config"
alias obs="QT_QPA_PLATFORM=xcb obs"
alias record='wf-recorder -g $(slurp) -f recording-$(date +"%Y-%m-%d_%H.%M.%S").mp4'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey "^I" autosuggest-accept
bindkey "^ " autosuggest-execute

eval $(thefuck --alias)
export IDEA_JDK=/usr/lib/jvm/java-8-openjdk
export STUDIO_JDK=/usr/lib/jvm/java-8-openjdk
export PYCHARM_JDK=/usr/lib/jvm/java-8-openjdk
export _JAVA_AWT_WM_NONREPARENTING=1
