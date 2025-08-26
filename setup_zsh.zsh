#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

# Installation unnecessary; it's in the Brewfile.

HOMEBREW_ZSH_PATH="$HOMEBREW_REPOSITORY/bin/zsh"
SHELLS_PATH='/etc/shells'
if grep -qFx "$HOMEBREW_ZSH_PATH" "$SHELLS_PATH"; then
  echo "Homebrew zsh, already exists in $SHELLS_PATH, skipping\n"
else
  echo "Enter superuser (sudo) password to edit $SHELLS_PATH"
  echo "$HOMEBREW_ZSH_PATH" | sudo tee -a "$SHELLS_PATH">/dev/null
fi  

if [[ "$SHELL" == "$HOMEBREW_ZSH_PATH" ]]; then
  echo "Login shell already set to $HOMEBREW_ZSH_PATH, skipping\n"
else
  echo "Enter user password to change login shell"
  chsh -s "$HOMEBREW_ZSH_PATH"
fi

if eza /private/var/select/sh | grep -q zsh ; then
  echo "Command sh already symlinked to zsh, skipping\n"
else 
  echo "Enter superuser (sudo) password to symlink sh to zsh"
  # Looked cute, might delete later, idk (homebrew zsh was not working)
  sudo ln -sfv /bin/zsh /private/var/select/sh 
fi

