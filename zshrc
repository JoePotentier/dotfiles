echo 'Hello from .zshrc'

# Set Variables

# Change ZSH Options

# Create Alisases (Use 'command' to bypass alias)
alias ls='ls -lAFh'

# Customize Prompt(s)
PROMPT='
%1~ %L %# '

# Timestamp to the right
RPROMPT='%*'

# Add Locations to $PATH Variables

# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Use ZSH Plugins

# ...and Other Surprises
