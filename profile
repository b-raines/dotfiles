
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export VIMRUNTIME=/usr/bin
export EDITOR=/usr/bin/vim

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=~/.npm-global/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
