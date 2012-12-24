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

#Prompt
#Right hand side of prompt
RPROMPT=$'%.%'
#Left hand side of prompt
PS1='%F{blue}%B%K{blue}█▓▒░%F{white}%K{blue}%B%n@%m%b%F{blue}%K{black}█▓▒░%F{white}%K{black}%B %D{%a %b %d} %D{%I:%M:%S%P} 
%}%F{fadebar_cwd}%K{black}%B%/%b%k%f${vcs_info_msg_0_} '

export ANDROID_SDK=/home/dozerl/.android-sdk-linux/
export ANDROID_NDK=/home/dozerl/.android-ndk-linux/

PATH=${PATH}:/sbin
PATH=${PATH}:ANDROID_SDK/tools
PATH=${PATH}:ANDROID_SDK/platform-tools

fpath=(~/.shellutils/zsh-completions $fpath)

source ~/.shellutils/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.shellutils/zsh-history-substring-search/zsh-history-substring-search.zsh

#Better colors for ls
dircolors=$HOME/.dircolors-$(tput colors)

if [[ -f $dircolors ]]; then
    eval $(dircolors -b $dircolors)
else
    eval $(dircolors)
fi

#Aliases for commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias update-new='sudo emerge --update --deep --ask --newuse world'
alias update='sudo emerge --update --deep --ask world'
