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

Bare `tmux` starts or attaches to the `main` session. tmux launches `/bin/zsh`
for new windows and panes. Zsh then loads Oh My Zsh,
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

Neovim uses ALE for linting and formatting. ALE is not a language server
client: add an LSP separately when you need navigation, completion from code
symbols, rename, or hover documentation. For project JavaScript tooling, use
`npm` to install declared local dependencies and `npx` only to run those local
tools:

```sh
npm install --save-dev eslint prettier
npx eslint .
npm ci
```

Commit `package.json` and `package-lock.json`; use `npm ci` for reproducible
installs. Avoid piping an unreviewed remote script into a shell.

For Go, install the Go toolchain and `gopls`:

```sh
sudo apt install golang-go
go install golang.org/x/tools/gopls@latest
```

For Dockerfiles, install the Node language server locally in a project or
user-local tool directory:

```sh
npm install --save-dev dockerfile-language-server-nodejs
```

The current ALE setup can lint shell, YAML, Python, and web files. Full LSP
support for Go and Docker is a separate Neovim configuration step.

The bootstrap also manages user-local tools and integrations when their
dependencies are available, including vim-plug plugins, Oh My Zsh, tmux TPM,
thefuck, Glow, Node.js/npm, and tealdeer cache updates.

## Neovim tools

GitHub Copilot is installed through vim-plug. Run `:Copilot auth` in Neovim;
on a headless VPS it prints a URL and one-time code, which can be completed in
a browser on another device. ALE provides diagnostics and formatting through
the tools available on `PATH` or in a project. Ruff handles Python, ShellCheck
handles shell scripts, and yamllint handles YAML. JavaScript, TypeScript, HTML,
and CSS projects should keep ESLint, Prettier, HTMLHint, and Stylelint as local
development dependencies:

```sh
npm install --save-dev eslint prettier htmlhint stylelint
```

Use `Space an` and `Space ap` to move between diagnostics, `Space ad` to inspect
one, and `Space af` to apply the configured formatter or fix.

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
