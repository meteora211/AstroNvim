# AstroNvim Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## ⚡ Requirements

- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)

For fzf installation in unbuntu:
```
apt install -y fzf ripgrep
```

For lazygit:
```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    sudo install lazygit /usr/local/bin && \
    rm lazygit.tar.gz
```

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/meteora211/AstroNvim.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
