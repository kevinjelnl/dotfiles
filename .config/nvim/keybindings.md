# Neovim keybindings

The leader key is `Space`.

The editor uses the warm orange `gruvbox` dark theme.

## Navigation and files

| Keys | Action |
| --- | --- |
| `Space ?` | Open this reference |
| `Ctrl-n` / `F2` | Toggle the file tree |
| `Ctrl-f` / `F3` | Reveal the current file in the file tree |
| `v` / `Shift-Enter` in NvimTree | Open the selected file in a vertical split |
| `s` in NvimTree | Open the selected file in a horizontal split |
| `Ctrl-w v/s` in NvimTree | Open the selected file right/below |
| `Ctrl-h/j/k/l` | Move between editor panes |
| `Ctrl-\\` | Open a terminal below the current pane |
| `Esc Esc` in terminal mode | Return to normal mode |
| `Space e` | Toggle the file tree (leader-key alternative) |
| `Space f` | Reveal the current file in the file tree (leader-key alternative) |
| `Space ff` | Find files with Telescope |
| `Space fb` | Search open buffers with Telescope |
| `Space fg` | Search text in the project with Telescope |
| `Space mv` | Render the current Markdown file with Glow |
| `Space an` | Jump to the next lint diagnostic |
| `Space ap` | Jump to the previous lint diagnostic |
| `Space ad` | Show details for the current diagnostic |
| `Space af` | Apply the configured linter fix |
| `]h` / `[h` | Next/previous Git hunk |
| `Space hp` | Preview the current Git hunk |
| `Space hs` | Stage the current Git hunk |
| `Space hr` | Reset the current Git hunk |

## Editing

| Keys | Action |
| --- | --- |
| `Space l` | Highlight the current line |
| `Space L` | Clear the line highlight |
| `Space p` | Paste over a visual selection without replacing the register |

## Copilot

| Keys | Action |
| --- | --- |
| `Ctrl-J` | Accept the current suggestion |
| `Ctrl-]` | Dismiss the current suggestion |
| `Alt-]` | Show the next suggestion |
| `Alt-[` | Show the previous suggestion |

Run `:Copilot auth` inside Neovim to authenticate. On a headless VPS, Copilot
prints a URL and one-time code; open the URL on another device and enter the
code there.

## Built-in commands

| Command | Action |
| --- | --- |
| `:Keybindings` | Open this reference |
| `:PlugInstall` | Install configured plugins |
| `:PlugUpdate` | Update configured plugins |
| `:Copilot auth` | Authenticate GitHub Copilot |
| `:ALEInfo` | Show active linters and their status |
| `:Glow` | Render the current file with Glow |

ALE uses tools available in the project or on `PATH`. Python, shell, and YAML
are ready when `ruff`, `shellcheck`, and `yamllint` are installed. For web
projects, add the tools to the project instead of installing them globally:

```sh
npm install --save-dev eslint prettier htmlhint stylelint
```

Then use `Space an`/`Space ap` for diagnostics and `Space af` to format or fix
the current file.

Glow is an external command. Install it through the system package setup, then
use `mdview file.md` from the shell or `Space mv` inside Neovim. The Neovim
preview opens in a full tab; press `q` to leave Glow and return to your editor.

Mappings use normal mode unless marked otherwise. `Space p` is visual mode only.
