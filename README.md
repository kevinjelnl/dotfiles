# Dotfiles

Personal Unix-like shell and terminal configuration managed with
[yadm](https://yadm.io/).

## Install

On a fresh Ubuntu or Debian machine:

```bash
sudo apt-get update
sudo apt-get install -y yadm
yadm clone https://github.com/kevinjelnl/dotfiles.git
```

Run the bootstrap when prompted by `yadm clone`, or later with:

```bash
yadm bootstrap
```

The bootstrap is safe to run repeatedly. It installs system packages only on
Debian-family Linux systems, and uses the optional executable hook below for
future platforms:

```text
~/.config/yadm/bootstrap.d/$OS_ID
```

Other Unix-like systems currently skip the Debian package installer and report
that no platform installer is configured yet.

## Shell workflow

The account login shell remains Bash. Starting an interactive SSH session does
not automatically attach to tmux. Start tmux explicitly when the Zsh workflow
is wanted:

```bash
tmux
```

tmux launches `/bin/zsh` for new windows and panes. Zsh then loads Oh My Zsh,
the custom theme, aliases, functions, history settings, and other interactive
configuration.

To bypass any future host-specific tmux automation during recovery:

```bash
NO_TMUX_AUTO_ATTACH=1 bash -li
```

## Managed configuration

- `.tmux.conf`: tmux defaults, key bindings, and `/bin/zsh` as the pane shell
- `.zshrc`: Oh My Zsh and interactive Zsh configuration
- `.config/zsh/`: aliases, functions, theme, and shell options
- `.config/yadm/bootstrap`: idempotent bootstrap orchestration and OS detection
- `.config/yadm/install-system-packages`: Debian/Ubuntu apt package installer
- `.config/nvim/init.vim`: Vim and Neovim configuration
- `.config/git/gitconfig`: Git preferences and aliases

The bootstrap also manages user-local tools and integrations when their
dependencies are available, including vim-plug plugins, Oh My Zsh, tmux TPM,
thefuck, and tealdeer cache updates.

## Updating

Pull configuration changes and re-run the bootstrap:

```bash
yadm pull
yadm bootstrap
```

Review changes before committing them:

```bash
yadm status
yadm diff
yadm diff --cached
```

Do not add host-specific credentials, private keys, `.env` files, or other
secrets to this repository.
