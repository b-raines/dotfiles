# Path to your oh-my-zsh installation.
export ZSH=/Users/brent/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git ruby rails heroku brew bundler gem rvm)

# User configuration

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="/Users/brent/Library/Python/2.7/bin:$PATH"
export PATH="/Users/brent/anaconda/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=~/.npm-global/bin:$PATH

fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh
source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
export EDITOR="$VISUAL"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

eval "$(hub alias -s)"

alias paperspace="ssh paperspace@es-dev.precisionnutrition.com"
alias tunnel="ngrok http --region=us --hostname=mydev.website 7000"
alias avd="cd $ANDROID_SDK_ROOT/tools &&  emulator @Nexus_5X_API_23"
alias ngrok10="ngrok http --subdomain 10percenthappier 0.0.0.0:5000"
alias dotfiles="cd ~/dotfiles"
alias dotfiles_update="rcup && cd ~/dotfiles && git add . && git commit -m 'update dotfiles' && git push"
alias zshconfig="vim ~/dotfiles/zshrc"
alias vimconfig="vim ~/dotfiles/vimrc"
alias code="cd ~/code"
alias tenpercent="cd ~/code/tenpercent"
alias migrate="rails db:migrate db:test:prepare"
alias remigrate="staging backup && development restore_from staging && bin/rails db:migrate db:test:prepare"
alias remigrate_prod="production backup && development restore_from production && bin/rails db:migrate db:test:prepare"
alias ctags="`brew --prefix`/bin/ctags"
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files'

export PATH="/usr/local/opt/krb5/bin:$PATH"
. $HOME/.asdf/asdf.sh
