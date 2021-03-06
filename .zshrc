# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="intheloop"
#ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages command-not-found sudo zsh-autosuggestions zsh-syntax-highlighting virtualenv)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

# User configuration

OS_ICON=""
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH="/Users/acosta/Library/Android/sdk/platform-tools:/Library/TeX/texbin:/Users/acosta/Qt/5.11.1/clang_64/bin:/usr/local/go/bin:$PATH"
  OS_ICON="\ue711"
  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="/usr/local/opt/node@10/bin:$PATH"
elif [[ "$OSTYPE" == linux-gnu ]]; then
  export PATH="/home/afonso/bin:$PATH"
  OS_ICON="\ue712"
fi
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias vim='nvim'
alias zs='source ~/.zshrc'
export EDITOR='nvim'

alias gtags='git describe --tags $(git rev-list --tags --max-count=5)'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

VCS_FOLDERS="{.bzr,CVS,.git,.hg,.svn,.cache,moc,dist,node_modules}"
GREP_OPTIONS=""
GREP_OPTIONS+="-I --color=auto --exclude-dir=$VCS_FOLDERS --exclude='*.lock'"

alias grep="grep $GREP_OPTIONS"

unset GREP_OPTIONS
unset VCS_FOLDERS

# Powerlevel9k configuration
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CONTEXT_TEMPLATE="%n@$SHORT_HOST"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
POWERLEVEL9K_RAM_ICON="\uf85a"
POWERLEVEL9K_OS_ICON="$OS_ICON"
POWERLEVEL9K_HOME_ICON="\uf7db"
POWERLEVEL9K_HOME_SUB_ICON="\uf74b"
POWERLEVEL9K_FOLDER_ICON="\uf07b"
POWERLEVEL9K_ETC_ICON="\ue5fc"
POWERLEVEL9K_VCS_GIT_ICON="\uf1d3"
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\uf113"
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON="\ue703"
POWERLEVEL9K_VCS_GIT_GITLAB_ICON="\uf296"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_first_and_last"

# Colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator ram dir_writable ssh context dir virtualenv vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true

# fix weird chars in the terminal when 'git diff' is used
export LESS="-erX"

export VIRTUAL_ENV_DISABLE_PROMPT=

# direnv
eval "$(direnv hook zsh)"
