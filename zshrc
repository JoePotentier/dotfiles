echo 'Hello from .zshrc'

# Set Variables
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Change ZSH Options

# Create Alisases (Use 'command' to bypass alias)
alias exa='exa -laFh --git'
alias ls='exa'
alias man='batman'
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'


# Customize Prompt(s)
PROMPT='
%1~ %L %# '

# Timestamp to the right
RPROMPT='%*'

# Add Locations to $PATH Variables
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# function code() {
#   echo "Can't open ($@) because this function supersedes the original code command."
# }

# Use ZSH Plugins

# ...and Other Surprises
