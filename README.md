# dotfiles

I **_learned_** about dotfiles at [dotfiles.eieio.xyz](http://dotfiles.eieio.xyz), and so can you! I highly recommend this course as an intro to dotfiles. You'll also learn a ton about zsh and automation.

## Decommission Computer

[Create a bootable USB installer for macOS](https://support.apple.com/en-us/HT201372).

Software audit:

- Uninstall unwanted software (e.g. GarageBand, iMovie, Keynote, Numbers, Pages)
- Install missing software (look at `/Applications`, panes in System Preferences , maybe `~/Applications`, etc.)

Backup / sync files:

- Commit and Push to remote repositories
- Run `code --list-extensions > vscode_extensions` from `~/.dotfiles` to export [VS Code extensions](vscode_extensions)
- Time Machine
- Google Drive
- Manual Backups (external drives, redundant cloud services)
- Contacts, Photos, Calendar, Messages (Google, iCloud)
- etc.

Deactivate licenses:

- Google Drive (`Sign out`)
- Sign Out of App Store (`Menu > Store > Sign Out`)
- iTunes, etc.

## Restore Instructions

1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. `git clone https://github.com/JoePotentier/dotfiles.git ~/.dotfiles`. We'll start with `https` but switch to `ssh` after everything is installed.
3. `cd ~/.dotfiles`
4. If necessary, `git checkout <another_branch>`.
5. Do one last Software Audit by editing [Brewfile](Brewfile) directly.
6. [`./install`](install)
7. Restart computer.
8. Setup up Google Drive (use multifactor authentication!) and allow files to sync before setting up dependent applications. Alfred settings are stored here. Mackup (not yet installed) depends on this as well (and thus so do Terminal and VS Code).
9. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), add to GitHub, and switch remotes.

   ```zsh
   # Generate SSH key in default location (~/.ssh/config)
   ssh-keygen -t ed25519 -C "9673684+JoePotentier@users.noreply.github.com"

   # Start the ssh-agent
   eval "$(ssh-agent -s)"

   # Create config file with necessary settings
   << EOF > ~/.ssh/config
   Host github.com
     AddKeysToAgent yes
     UseKeychain yes
     IdentityFile ~/.ssh/id_ed25519

   EOF

   # Add private key to ssh-agent
   ssh-add -K ~/.ssh/id_ed25519

   # Copy public key and add to github.com > Settings > SSH and GPG keys
   pbcopy < ~/.ssh/id_ed25519.pub

   # Test SSH connection, then verify fingerprint and username
   # https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
   ssh -T git@github.com

   # Switch from HTTPS to SSH
   git remote set-url origin git@github.com:JoePotentier/dotfiles.git
   ```

### Manual Steps

#### Alfred

1. `System Preferences > Keyboard > Shortcuts > Spotlight > Show Spotlight search (cmd+space)` uncheck.
2. `Alfred Preferences > Powerpack` add License.
3. `Alfred Preferences > General > Request Permissions`.
4. `Alfred Preferences > General > Alfred Hotkey` change to `cmd+space`.
5. `Alfred Preferences > Advanced > Set preferences folder` and set to `~/GOOGLE DRIVE FOLDER TBD/dotfiles/Alfred`.

## Maintenance

### TODO

- Terminal Preferences
- Dock Preferences
- Mission Control Preference (don't rearrange spaces)
- Finder Show Path Bar
- Trackpad (Three Finger Drag and Tap to Click)
- Git (config and SSH - automated)
- Alfred (turn off Spotlight shortcut and use for Alfred)
- Fonts
- Hot corners
- Modifier keys
- Termius
- DbBeaver
- .zprofile (What is this)?
- Desktop Wallpaper
- Screenshot folder
- AWS config file (Sync w/ google)

### Updating Brewfile

```
brew bundle dump --force --describe
```

### Updating Homebrew Apps

```
brew update
brew outdated
brew upgrade
```
