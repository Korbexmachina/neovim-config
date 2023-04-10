![](https://img.shields.io/github/repo-size/korbexmachina/neovim-config?label=size)

# Setup:

Note: These instructions are for Ubuntu

## Install Dependencies
Most of these are for building neovim and mason (The LSP manager)

```
sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl tar git gzip grep ripgrep npm
```

## Build Neovim
Build the current version of neovim from source

```
git clone https://github.com/neovim/neovim

cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install
```

## Clone The Config
Clone the config from my GitHub

```
cd ~/.config

git clone https://github.com/korbexmachina/neovim-config
```

Rename the directory to nvim

```
mv neovim-config nvim
```

That's it!
