# nvim

Personal Neovim config. Plugin manager is [lazy.nvim](https://github.com/folke/lazy.nvim),
which bootstraps itself on first launch — cloning this repo and starting `nvim`
is the whole install.

```sh
git clone git@github.com:ChitreshN/nvim.s.git ~/.config/nvim
nvim
```

`lazy-lock.json` pins every plugin to a known-good commit, so a fresh machine
gets the exact same versions. Commit it after `:Lazy update`.

## Requirements

Neovim **0.12.0 or newer** — the config uses the native `vim.lsp.config` /
`vim.lsp.enable` API and the `main` branch of nvim-treesitter, neither of which
works on 0.11.

| Tool | Why |
| --- | --- |
| `git`, `curl`, `tar`, `unzip` | lazy.nvim and mason downloads |
| C compiler (`gcc`/`cc`) | building tree-sitter parsers |
| `tree-sitter` CLI ≥ 0.26.1 | required by nvim-treesitter `main` (install from your package manager, **not** npm) |
| `node` + `npm` | mason installs `typescript-language-server` |
| `ripgrep` | telescope `<leader>fz` |
| A Nerd Font | nvim-web-devicons glyphs |
| `fd` | optional, faster telescope file finding |
| `wl-clipboard` | optional, Wayland clipboard for `lua/chit/clipboard.lua` |

Arch:

```sh
sudo pacman -S --needed neovim git curl tar unzip gcc tree-sitter-cli nodejs npm ripgrep fd wl-clipboard
```

Debian/Ubuntu (`tree-sitter-cli` is usually not packaged — install it with
`cargo install tree-sitter-cli` or from the tree-sitter releases page):

```sh
sudo apt install neovim git curl tar unzip build-essential nodejs npm ripgrep fd-find wl-clipboard
```

## Language servers

Installed automatically by mason on first launch:

- `lua_ls`
- `ts_ls` (typescript-language-server)

Expected on `$PATH`, installed with the language's own toolchain — the config
enables each one but does not install it:

| Server | Comes from |
| --- | --- |
| `clangd` | `pacman -S clang` / `apt install clangd` |
| `gopls` | `go install golang.org/x/tools/gopls@latest` |
| `rust_analyzer` | `rustup component add rust-analyzer` |
| `hls` | [ghcup](https://www.haskell.org/ghcup/) (`ghcup install hls`) |

Haskell formatting goes through `fourmolu`, so install that too if you write
Haskell (`ghcup install stack` then `stack install fourmolu`, or
`cabal install fourmolu`).

To add a server, put it in `mason_servers` (mason installs it) or
`system_servers` (already on `$PATH`) at the top of
`lua/chit/plugins/lsp.lua`.

## Manual steps after the first launch

1. **Supermaven** — `:SupermavenUseFree` or `:SupermavenUsePro` to authenticate.
   Completion works without it; the `supermaven` cmp source is just empty.
2. **Java** — `:MasonInstall jdtls`, plus a JDK 17+ on `$PATH`. jdtls starts
   per-buffer from `ftplugin/java.lua` and keeps its workspace in
   `stdpath("cache")/jdtls`, never inside the project.
3. **Health check** — `:checkhealth` should come back clean.

On the very first launch mason installs `lua_ls` and `ts_ls` in the background,
which finishes after the first buffer is already open — so LSP will not be
attached to it. Watch `:Mason` for the installs to finish, then reopen the file.
Every later launch attaches immediately.

Treesitter parsers install on demand the first time you open a file of a new
filetype, so the first Python (or whatever) buffer takes a second to compile.

Note that mason deliberately skips `ensure_installed` when Neovim runs headless,
so `nvim --headless` will never install the servers for you.

## Layout

```
init.lua                   entry point, requires lua/chit
lua/chit/
  init.lua                 load order
  options.lua              vim.opt settings, leader
  keymaps.lua              global (non plugin) keymaps
  autocmds.lua             haskell indent, transparent highlight groups
  clipboard.lua            OSC 52 clipboard for tmux/SSH sessions
  lazy.lua                 lazy.nvim bootstrap + setup
  plugins/                 one spec file per concern
ftplugin/java.lua          starts jdtls for java buffers
```

Everything under `lua/chit/plugins/` is imported automatically — dropping a new
file there that returns a lazy spec is all it takes to add a plugin.

## Keymaps

Leader is `<Space>`.

### General

| Key | Action |
| --- | --- |
| `<leader>pv` | netrw (`:Ex`) |
| `-` | oil, parent directory |
| `<leader>y` / `<leader>Y` | yank to system clipboard |
| `<leader>d` | delete without clobbering the register |
| `<leader>p` (visual) | paste over selection, keep register |
| `J` / `K` (visual) | move selection down / up |
| `<C-d>` / `<C-u>` | half page scroll, cursor centered |
| `<leader>bs` | `:wall` |
| `<leader>u` | undotree |
| `<leader>gs` | fugitive `:Git` |

### Telescope

| Key | Action |
| --- | --- |
| `<leader>ff` | find files |
| `<C-p>` | git files |
| `<leader>fz` | grep for a prompted string |

### Harpoon

| Key | Action |
| --- | --- |
| `<leader>a` | add file |
| `<C-e>` | toggle quick menu |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | jump to file 1–4 |

### LSP (buffer-local, set on attach)

| Key | Action |
| --- | --- |
| `K` | hover |
| `gd` / `gD` | definition / declaration |
| `gi` / `go` | implementation / type definition |
| `gr` / `gs` | references / signature help |
| `gl`, `<leader>vd` | line diagnostics |
| `[d` / `]d` | next / previous diagnostic (deliberately reversed) |
| `<F2>`, `<leader>vrn` | rename |
| `<F3>` | format, async |
| `<leader>f` | format |
| `<F4>`, `<leader>vca` | code action |
| `<leader>vrr` | references |
| `<leader>vws` | workspace symbol |
| `<C-h>` (insert) | signature help |

Neovim's own 0.11+ defaults (`grn`, `gra`, `grr`, `gri`, `grt`, `gO`) are still
there on top of these.

### Completion (nvim-cmp)

| Key | Action |
| --- | --- |
| `<C-y>` | confirm |
| `<C-e>` | abort |
| `<Up>` / `<Down>` | select previous / next |
| `<C-p>` / `<C-n>` | select previous / next, opening the menu if closed |

### Supermaven

| Key | Action |
| --- | --- |
| `<C-a>` | accept suggestion |
| `<C-s>` | accept word |
| `<C-x>` | clear suggestion |

## Formatting this config

`stylua.toml` is checked in. Install the formatter with `:MasonInstall stylua`,
then:

```sh
~/.local/share/nvim/mason/bin/stylua lua/ ftplugin/ init.lua
```
