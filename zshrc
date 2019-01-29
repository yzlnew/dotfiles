# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/r0brew/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# THEME
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_COLOR_SCHEME="light"

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs time)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{white}%k"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{white}%F{yellow} \uf155 %f%F{white}%k\ue0b0%f "
POWERLEVEL9K_USER_ICON="\uF489"
POWERLEVEL9K_ROOT_ICON="\uF09C"
POWERLEVEL9K_SUDO_ICON=$'\uF09C'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_TIME_FOREGROUND='yellow'
POWERLEVEL9K_TIME_BACKGROUND='white'
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0C0'

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d2 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uf296 '
POWERLEVEL9K_VCS_BRANCH_ICON=$''
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='blue'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'

# VCS CONFIG
POWERLEVEL9K_SHOW_CHANGESET=false

# SPACESHIP_BATTERY_SHOW="false"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions autojump osx zsh-syntax-highlighting)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.aliases
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"
alias typora="open -a typora"
eval "$(thefuck --alias)"

# Tokens
source $HOME/.tokens

# VSCode
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
export EDITOR=vim

# Eigen
export EIGEN3_INCLUDE_DIR="/usr/local/Cellar/eigen/3.3.4/include"

# Pipenv
# eval "$(pipenv --completion)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Solarized colors
  export FZF_DEFAULT_OPTS="
    --color fg:#657b83,bg:#fdf6e3,hl:#859900,fg+:#586e75,bg+:#eee8d5,hl+:#859900
    --color info:#dc322f,prompt:#859900,pointer:#859900,marker:#fdf6e3,spinner:#b58900
  "

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH:/usr/local/lib/ruby/gems/2.6.0/bin"
