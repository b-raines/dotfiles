# Path to your oh-my-zsh installation.
export ZSH=/Users/brentraines/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

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
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit
compinit
plugins=(vi-mode git ruby rails heroku brew bundler gem)


eval "$(uv generate-shell-completion zsh)"

# User configuration

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="/Users/brentraines/anaconda/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH="$PATH:$(yarn global bin)"

fpath=(/usr/local/share/zsh-completions $fpath)

export ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
export EDITOR="$VISUAL"

  # Milo project helper function
  milo() {
      local MILO_DIR="$HOME/code/milo"

      case "$1" in
          start)
              if [ -z "$2" ]; then
                  echo "Usage: milo start <issue_id> [--unleashed]"
                  return 1
              fi

              local issue_id="$2"
              local unleashed_flag="$3"

              if [ ! -d "$MILO_DIR" ]; then
                  echo "Error: Milo directory not found at $MILO_DIR"
                  return 1
              fi

              cd "$MILO_DIR"
              git worktree add "../$issue_id" && \
              cd "../$issue_id" && \
              make install && \
              if [ "$unleashed_flag" = "--unleashed" ]; then
                  claude "/workflow:start $issue_id --unleashed"
              else
                  claude "/workflow:start $issue_id"
              fi
              ;;
          go)
              if [ -z "$2" ]; then
                  echo "Usage: milo go <issue_id>"
                  echo "Available worktrees:"
                  cd "$MILO_DIR" && git worktree list | grep -v "$(pwd)" | awk '{print $1}' | xargs
  -I {} basename {}
                  return 1
              fi
              if [ -d "$MILO_DIR/../$2" ]; then
                  cd "$MILO_DIR/../$2"
              else
                  echo "Worktree $2 not found"
                  return 1
              fi
              ;;
          worktrees|wt)
              cd "$MILO_DIR" && git worktree list
              ;;
          clean)
              cd "$MILO_DIR"
              if [ -n "$2" ]; then
                  if [ -d "../$2" ]; then
                      git worktree remove "../$2" 2>/dev/null && echo "✅ Removed worktree $2" ||
  echo "❌ Could not remove worktree $2 (uncommitted changes?)"
                  else
                      echo "Worktree $2 not found"
                  fi
              else
                  echo "Usage: milo clean <issue_id>"
                  echo "Available worktrees:"
                  git worktree list | grep -v "$(pwd)" | awk '{print $1}' | xargs -I {} basename {}
              fi
              ;;
          "")
              cd "$MILO_DIR"
              ;;
          *)
              echo "Milo helper commands:"
              echo "  milo                     - Go to main milo directory"
              echo "  milo start <issue_id>    - Start workflow for issue"
              echo "  milo go <issue_id>       - Switch to worktree"
              echo "  milo worktrees           - List all worktrees"
              echo "  milo clean <issue_id>    - Remove worktree"
              ;;
      esac
  }

  # Helper function to get worktree names
  _milo_get_worktrees() {
      local -a result
      local old_dir="$PWD"

      if cd "$HOME/code/milo" 2>/dev/null; then
          local worktree_output
          worktree_output="$(git worktree list 2>/dev/null)"

          if [[ -n "$worktree_output" ]]; then
              echo "$worktree_output" | while read line; do
                  local path_part="${line%% *}"
                  if [[ "$path_part" != "$HOME/code/milo" ]]; then
                      basename "$path_part"
                  fi
              done
          fi

          cd "$old_dir"
      fi
  }

  # Simple zsh completion
  _milo() {
      case $CURRENT in
          2)
              _values 'milo commands' \
                  'start[Start workflow for issue]' \
                  'go[Switch to worktree]' \
                  'worktrees[List all worktrees]' \
                  'clean[Remove worktree]'
              ;;
          3)
              case $words[2] in
                  go|clean)
                      local -a worktree_names
                      worktree_names=($(_milo_get_worktrees))
                      if [[ ${#worktree_names[@]} -gt 0 ]]; then
                          _values 'worktrees' "${worktree_names[@]}"
                      fi
                      ;;
              esac
              ;;
          4)
              case $words[2] in
                  start)
                      _values 'options' '--unleashed[Enable unleashed mode]'
                      ;;
              esac
              ;;
      esac
  }

  compdef _milo milo

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias paperspace="ssh paperspace@es-dev.precisionnutrition.com"
alias tunnel="ngrok http --region=us --hostname=mydev.website 7000"
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
alias eztilt="/Users/brentraines/Code/eztilt/eztilt"
alias aseprite="/Applications/Aseprite.app/Contents/MacOS/aseprite"
alias gwt="git worktree"
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files'

source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

export PATH="/usr/local/opt/krb5/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PATH:/Users/brentraines/.foundry/bin"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2025-05-24 05:45:05
export PATH="$PATH:/Users/brentraines/.local/bin"
