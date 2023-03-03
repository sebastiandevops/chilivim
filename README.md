# Chilivim

Welcome to my fork of the [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) repository, originally created and maintained by Christian Chiarulli. This repository is a tribute to his great work, and I would like to give him special recognition for his contributions to the Neovim community.

When I first came across LunarVim, I was impressed with its comprehensive configuration and how it simplified the process of setting up Neovim. Through Christian's work, I learned about Neovim, the Lua programming language, and how to create a configuration that is understandable and easy to work with.

Since forking the repository, I have added more functionalities, modularized the code, and migrated the plugin manager from Packer to Lazy. Additionally, I am working on improving the user interface to make it look and function more like an IDE. With these changes, I hope to provide an even better development experience for myself and other users.

Thank you for visiting my repository, and I hope that my contributions will help you in your development journey.

The install config of my fork is almost identical to Christian's, so I have quoted his instructions with necessary updates to make it work with my repository. To get started with my fork, please follow these instructions:

## Install Config

Install [Neovim v0.8.0](https://github.com/neovim/neovim/releases) and make sure that it's in your system path.

Clone the repository into the correct location (**NOTE**: make a backup your current `nvim` directory if you want to keep it).

```
git clone https://github.com/sebasvalencia726/chilivim.git ~/.config/nvim
```

Run `nvim` in your terminal and wait for the plugins to be installed. You will notice treesitter pulling in a bunch of language parsers the next time you open Neovim.

**NOTE** [Mason](https://github.com/williamboman/mason.nvim) is used to install and manage LSP servers, DAP servers, linters, and formatters via the `:Mason` command.

**NOTE** [Lazy ](https://github.com/folke/lazy.nvim) is a plugin manager that I have incorporated into my fork to install and update plugins. To add new plugins, you simply need to add them to the `/lua/plugins/init.lua` file. Lazy will automatically install the plugins when you exit and reopen Neovim. For any further plugin configuration, you can create your own config file in the `/lua/user/` directory to keep the configuration modularized.

Finally, it's worth noting that the additional installation steps for this configuration are the same as those in Christian's original repository. Therefore, I will simply quote his instructions:

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```
  
- Wayland users

  [wl-clipboard](https://github.com/bugaevc/wl-clipboard)


Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
---

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

### Upgrade to Neovim v0.8.0

Assuming you [built from source](https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start), `cd` into the folder where you cloned `neovim` and run the following commands. 
```
git pull
make distclean && make CMAKE_BUILD_TYPE=Release
git checkout v0.8.0
sudo make install
nvim -v
```

> The computing scientist's main challenge is not to get confused by the complexities of his own making. 

\- Edsger W. Dijkstra
