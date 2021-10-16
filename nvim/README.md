## Install NeoVim and plugins.
First of all, install neovim:

follow this instructions: https://github.com/neovim/neovim/wiki/Installing-Neovim

after, install vim plug:
`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Find more data in: https://github.com/junegunn/vim-plug;

## Configuration

In `/home/<user>/.config` create a folder `nvim`;

After, copy the `init.vim` and `coc-settings.json` inside the folder.

[Linux]
To install fonts, create a `.fonts` in `/home/<user>/`, copy the font file inside that.

[Mac]
You can install front from [nerd fonts](https://github.com/ryanoasis/nerd-fonts)
(DroidSansMono)

Rerun your terminal and Done.
