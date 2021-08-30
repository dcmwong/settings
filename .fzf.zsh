# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/davidwong/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/davidwong/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/davidwong/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/davidwong/.fzf/shell/key-bindings.zsh"
