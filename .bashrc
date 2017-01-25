# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##### PROMPT #####

HOST='\[\033[1;33m\]@\[\033[1;32m\]\h'
PROMPT_COMMAND='RET=$?; history -a'
RETCOLOR='$(if [ $RET != 0 ]; then echo "\e[1;31m"; else echo "\e[1;36m"; fi)'
export PS1="\[\e[1;31m\]\u$HOST \`if [ \"\w\" != \"~\" ]; then echo -e \
  '\[\e[1;36m\]\w ';fi\`\[\e[1;31m\]>>\[$RETCOLOR\]>\[\e[0m\] "
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
