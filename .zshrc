if [ -f /etc/gentoo-release -o -f /etc/debian_version ]; then
	source /etc/zsh/zprofile
	[[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
	[[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" down-line-or-history

	[[ "$terminfo[kcuu1]" == ""* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" up-line-or-history
	[[ "$terminfo[kcud1]" == ""* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" down-line-or-history
else
	source /etc/profile
fi

if type -p dircolors >/dev/null ; then
	eval `dircolors -b`
fi

# Set terminal window title
precmd () {
	[[ -t 1 ]] || return
	case $TERM in    
	*xterm*|rxvt|rxvt-unicode*|(dt|k|E|a)term)
		print -Pn "\e]2; %n:%~ - $TERM \a"
	;;
	screen*)
		print -Pn "\e\"[ %n:%~ - $TERM ]\e\134"
	;;
	esac

	setopt PROMPT_SUBST
	vcs_info
}

[[ -t 1 ]] || return
# Prompt
PROMPT="%n@%m%:%~# "
RPROMPT=$'%.%'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dozerl/.zshrc'

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit; prompt gentoo
prompt fade blue
# End of lines added by compinstall
#
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(git):*' branchformat '%b%F{1}:%F{3}%r'
PS1='%F{blue}%B%K{blue}█▓▒░%F{white}%K{blue}%B%n@%m%b%F{blue}%K{black}█▓▒░%F{white}%K{black}%B %D{%a %b %d} %D{%I:%M:%S%P} 
%}%F{fadebar_cwd}%K{black}%B%/%b%k%f${vcs_info_msg_0_} '

alias update-new='sudo emerge --update --deep --ask --newuse world'
alias update='sudo emerge --update --deep --ask world'
alias ls='ls --color'
PATH=${PATH}:/sbin:/home/dozerl/android-sdk-linux/tools:/home/dozerl/android-sdk-linux/platform-tools
fpath=(~/.zsh-completions $fpath)

export ANDROID_SDK=/home/dozerl/android-sdk-linux/

source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-history-substring-search/zsh-history-substring-search.zsh

dircolors=$HOME/.dircolors-$(tput colors)

if [[ -f $dircolors ]]; then
    eval $(dircolors -b $dircolors)
else
    eval $(dircolors)
fi
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
