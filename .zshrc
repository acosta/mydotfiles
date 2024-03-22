# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [[ "$OSTYPE" == darwin* ]]; then
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="intheloop"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

#History configuration
HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#fzf configuration
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export DISABLE_FZF_AUTO_COMPLETION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages command-not-found sudo virtualenv fzf)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#ZSH_HIGHLIGHT_STYLES[cursor]='bold'

# User configuration

OS_ICON=""
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH="/Users/$USER/Library/Android/sdk/platform-tools:/Library/TeX/texbin:/Users/$USER/Qt/5.11.1/clang_64/bin:/usr/local/go/bin:$PATH"
  OS_ICON="\ue711"
  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  alias cat='bat'
  alias ls='exa'
  alias ps='procs'

elif [[ "$OSTYPE" == linux-gnu ]]; then
  export PATH="${HOME}/.bin:/opt/nvim-linux64/bin:${PATH}"
  OS_ICON="\ue712"
fi

# enable shell history for iex (elixir shell)
export ERL_AFLAGS="-kernel shell_history enabled"

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
alias gup='git fetch && git rebase origin/main'
alias gsm='git switch main'
alias gsc='git switch -c'
alias cat='bat'
alias ps='procs'

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
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_first_and_last"

# Colors
POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir_writable ssh dir virtualenv vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true

# fix weird chars in the terminal when 'git diff' is used
export LESS="-erX"

export VIRTUAL_ENV_DISABLE_PROMPT=

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
