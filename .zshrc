#Things to execute before each command
precmd () {
	#Set options
	setopt PROMPT_SUBST 	#Used to set certain variables without recreating prompt
	setopt correctall	#Spelling corrections for commands and arguments
	setopt histignoredups	#Ignore duplicate commands in storing commands
	setopt extendedglob	#weird & wacky pattern matching

	vcs_info
}

#Zsh History information
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

#Disbale stupid audible bell
unsetopt beep

#Set keybindings as VIM
bindkey -v

#Auto completion
autoload -Uz compinit
compinit

#Prompt
autoload -U promptinit
promptinit; 
prompt fade blue

#VC info
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(git):*' branchformat '%b%F{1}:%F{3}%r'

echo $SHELL | grep -q '/nix/store'
if [[ $? -eq 0 ]]
then
   echo "IN NIX SHELL"
   NIX_PS1='%F{green}%K{black}[nix-shell]'
fi

#Prompt
#Right hand side of prompt
RPROMPT=$'%.%'
#Left hand side of prompt
PS1='%F{blue}%B%K{blue}█▓▒░%F{white}%K{blue}%B%n@%m%b%F{blue}%K{black}█▓▒░%F{white}%K{black}%B %D{%a %b %d} %D{%I:%M:%S%P} 
${NIX_PS1}%}%F{fadebar_cwd}%K{black}%B%/%b%k%f${vcs_info_msg_0_} '

PATH=${PATH}:/sbin

fpath=($HOME/.shellutils/zsh-completions $fpath)

source $HOME/.shellutils/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.shellutils/zsh-history-substring-search/zsh-history-substring-search.zsh

#############
# zsh-history-bstring-search
#############
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# ignore dups
setopt HIST_IGNORE_ALL_DUPS
#############

# nix setup
alias nix-shell='nix-shell --command zsh'
