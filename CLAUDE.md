# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/). The repo root is the stow directory — it mirrors `$HOME`, so running `stow .` from the repo root symlinks everything into `~`.

## Deploying changes

```bash
# From the repo root — symlink all configs into $HOME
stow .
```

After editing config files, no re-deploy is needed (they're symlinked), but new files/directories require re-running `stow .`.

## Key structure

- **Shell**: zsh with Zinit plugin manager. Entry point is `.zshenv` → sets `ZDOTDIR=~/.config/zsh`, so `.config/zsh/.zshrc` is the main rc file. Secrets are sourced from `~/.secrets` (not tracked).
- **Neovim**: Lazy.nvim-based config. Entry point is `.config/nvim/init.lua` → loads modules from `lua/config/` (opts, mappings, autocommands) and plugins from `lua/plugins/` (one file per plugin).
- **Terminal**: Ghostty (`.config/ghostty/`), Kitty (`.config/kitty/`), WezTerm (`.config/wezterm/`).
- **Window management**: AeroSpace (`.config/aerospace/`), with skhd hotkeys (`.config/skhd/`).
- **Other tools**: tmux, starship prompt, btop, yazi, zed, opencode, raycast.

## Conventions

- Git config lives in `.gitconfig` (root) and `.config/git/ignore` (global ignore).
- The `.gitignore` excludes generated/session files (zsh history, zcompdump, .secrets, .claude/).
