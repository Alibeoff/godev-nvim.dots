# Getting Started
At the moment, having looked at and tried personal NeoVim configs for development in the Go language published by YouTubers in GitHub, there is no immediately convenient working config that meets my needs. That is why below is a description of my personal config for working with Golang

## Installation pakcages
### Catppuccin
To use this config with beautiful code highlighting, I use catppuccin. I don't like the new version, so I'll leave my catppuccin here just in case. To use it, unzip the zip file, then enter the command ```bash
mv catppuccin ~/.local/share/nvim/lazy/catppuccin
```
then run neovim
```bash
nvim .
```


### LazyGit - to use LazyGit on nvim you need install it in your system.
[All instructions here](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)

---

## Mappings

| Shortcut         | Description                         | Mode           |
|------------------|-------------------------------------|----------------|
| `sm`             | Run `gomod tidy`                    | Normal         |
| `C-j`            | Move strings down                   | Normal/Visual  |
| `C-k`            | Move strings up                     | Normal/Visual  |
| `mc`             | Go to end of line                   | Normal         |
| `ml`             | Go to first symbol in line          | Normal         |
| `ms`             | Go to start of line                 | Normal         |
| `ee`             | Snippet to add error handler        | Normal         |
| `Tab`            | Next buffer                         | Normal         |
| `S-Tab`          | Previous buffer                     | Normal         |
| `leader + c`     | Close buffer                        | Normal         |
| `gt`             | Go add tag                          | Normal         |
| `gm`             | Go remove tag                       | Normal         |
| `Tab`            | Add tab space at start of line      | Visual         |
| `S-Tab`          | Remove tab space at start of line   | Visual         |
| `leader + w`     | Save file                           | Normal         |
| `leader + q`     | Close Neovim                        | Normal         |
| `jj`             | Switch from Insert to Normal mode   | Insert         |
| `leader + /`     | Comment line                        | Normal/Visual  |
| `leader + ff`    | Telescope: find file                | Normal         |
| `leader + fw`    | Telescope: find word                | Normal         |
| `leader + fb`    | Telescope: find buffer              | Normal         |
| `se`             | Open window to see full error body  | Normal         |
| `sge`            | Telescope window for all errors     | Normal         |

---

## Snacks

| Shortcut       | Description                 |
|----------------|-----------------------------|
| `gr`           | References                  |
| `gI`           | Go to Implementations       |
| `gd`           | Go to Definitions           |
| `;;`           | Open floating terminal      |
| `leader + lg`  | LazyGit                     |
| `leader + cr`  | Rename file                 |

---

## Nvim Tree

| Shortcut       | Description                 |
|----------------|-----------------------------|
| `leader + e`   | Open/close tree             |
| `leader + o`   | Focus window                |
| `leader + h`   | Show/hide dotfiles          |
| `hh`           | Close directory in focus    |
| `h`            | Close directory             |
| `l`            | Open file or directory      |

---

## LSP

| Shortcut       | Description                 |
|----------------|-----------------------------|
| `sa`           | Imports window for Golang   |

---

## Any Mappings

| Shortcut       | Description                                   |
|----------------|-----------------------------------------------|
| `gy`           | Global copy content for SSH connection        |
| `kk`           | Switch to Insert mode + tips                  |
| `sd`           | Telescope window to search/install Go package |
| `ss`           | Auto install Go package in focus              |
| `;s`           | Telescope to run your Go files                |
| `sr`           | Rename word throughout all project            |
| `[[`           | Prev symbol                                   |
| `]]`           | Nex symbol                                    |

---

## Aerial Group

| Action           | Shortcut(s)                |
|------------------|----------------------------|
| Go to location   | `<CR>`, `ll`               |
| Close            | `<Esc>`, `q`               |
| Open / Hide      | `sl`                       |
| Hide subgroup    | `o`                        |
| Hover symbol     | `<S-space>`                |
| Toggle preview   | `K`                        |
| Fold             | `h`                        |
| Unfold           | `l`                        |
| Fold all         | `W`                        |
| Unfold all       | `E`                        |

---
