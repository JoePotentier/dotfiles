echo 'Hello from .zshrc'

# Set Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_REPOSITORY/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_REPOSITORY/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "$HOMEBREW_REPOSITORY/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_REPOSITORY/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export JAVA_HOME="$HOMEBREW_REPOSITORY/opt/openjdk/bin"

# Change ZSH Options

# Create Alisases (Use 'command' to bypass alias)
alias exa='exa -laFh --git'
alias ls='exa'
alias man='batman'
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'
alias rm=trash


# Customize Prompt(s)
PROMPT='
%1~ %L %# '

# Timestamp to the right
RPROMPT='%*'

# Add Locations to $path Array
typeset -U path

path=(
  "$HOMEBREW_REPOSITORY/opt/openjdk/bin"
  $path
  # Add Visual Studio Code (code)
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

## Automatically call nvm use (when entering a directory that has an .nvmrc file) ##
autoload -U add-zsh-hook

function load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
## END nvmrc config ##

# Use ZSH Plugins

# ...and Other Surprises
