# Setup fzf
# ---------
if [[ ! "$PATH" == */home/timmy/.fzf/bin* ]]; then
  export PATH="$PATH:/home/timmy/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/timmy/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/timmy/.fzf/shell/key-bindings.bash"

