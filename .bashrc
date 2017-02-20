# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##### PROMPT #####

HOST='\[\033[1;33m\]@\[\033[1;32m\]\h'
PROMPT_COMMAND='RET=$?; history -a'
RETCOLOR='$(if [ $RET != 0 ]; then echo "\e[1;31m"; else echo "\e[1;36m"; fi)'
PREPEND="\[\e[1;31m\]\u$HOST \`if [ \"\w\" != \"~\" ]; then echo -e \
  '\[\e[1;36m\]\w ';fi\`"

APPEND="\[\e[1;31m\]>\[$RETCOLOR\]>\[\e[0m\]"
export PS1="$PREPEND$APPEND"
PS2='> '
PS3='> '
PS4='+ '

HISTCONTROL=ignoreboth:erasedups
export LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
export VISUAL=vim EDITOR=vim

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    SCREENTITLEPROGRAM='\[\ek\e\\\]'
    PS1="${SCREENTITLEPROGRAM}${PS1}" 
    ;;
esac

[[ -n "$TMUX" ]] && export TERM=screen-256color

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s cmdhist
shopt -s extglob

GIT_PROMPT_THEME=dopykuh

[[ -f ~/.bash-git-prompt/gitprompt.sh ]] && . ~/.bash-git-prompt/gitprompt.sh

if [[ ! -h ~/.bash-git-prompt/themes/dopykuh.bgptheme ]]; then
  ln -s ~/.dopykuh.bgptheme ~/.bash-git-prompt/themes/dopykuh.bgptheme
fi

export GOPATH=~/.go 
export GOBIN=${GOPATH}/bin 
export PATH=$PATH:$GOBIN

[[ -f ~/.bash_git.sh ]] && . ~/.bash_git.sh
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local
[[ -f ~/.system_patches/run.sh ]] && . ~/.system_patches/run.sh

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

if [[ ! -f ~/.bashrc.local ]]; then
  echo "[[ -f ~/.bashrc.aliases ]] && . ~/.bashrc.aliases" > ~/.bashrc.local
  . ~/.bashrc.local
fi

if [[ ! -h ~/.fzf/bin/fzf ]]; then
  ln -s ~/.local_bin/fzf ~/.fzf/bin/fzf
fi
if [[ ! "$PATH" == *~/.local_bin* ]]; then
  export PATH="$PATH:~/.local_bin"
fi

