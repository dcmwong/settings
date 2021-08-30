# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/davidwong/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*, dist/*, declarations/*, *publish/packages/data/dist/*, *legacy-data*}"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source <(kubectl completion zsh)

alias k="kubectl"
alias kdev="kubectl -n development"
# echo 'complete -F __start_kubectl kdev' >>~/.zshrc

complete -F __start_kubectl kdev

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
complete -F __start_kubectl kdev

export PATH=$PATH

alias pioneerconnect="export PIONEER_HAYWARD_PASSWORD='FtK4CHgH6DFAmAg8cdKq' PIONEER_BROOKLYN_PASSWORD='PxtpS3z4Dta559sWvLfR' PIONEER_LA_PASSWORD='hNZckSsF4L2eKCEkc5sZ'"
alias recordsyncprod="export RECORDSYNC_MYSQL_USER='postmeds' RECORDSYNC_MYSQL_HOST='db.truepill.com' RECORDSYNC_MYSQL_PASSWORD='ZzqwW33m2h1#aMx__Xy1-2MvliZ79A-1C'"
alias shippoconnect="export SHIPPO_API_KEY=shippo_test_ca4d8d53fdb453f4568040a7dd0211a81aee6641"
alias sandboxelasticsearchconnect="export JARVIS_ES_HOST='https://jarvis-es.falsepill.com' JARVIS_ES_PASSWORD='Vm052gjWKi4Q3UwNU7372MC1'"

alias importorderconnections="pioneerconnect && recordsyncprod && shippoconnect && sandboxelasticsearchconnect"

alias dcoker="docker"
alias doker="docker"
alias dokcer="docker"
alias dk="docker"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/davidwong/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/davidwong/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/davidwong/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/davidwong/google-cloud-sdk/completion.zsh.inc'; fi

export NPM_AUTH_TOKEN=e0d33cbfa08914d88efd813e562aaff99756c8d6

alias python='/Library/Frameworks/Python.framework/Versions/3.9/bin/python3'
