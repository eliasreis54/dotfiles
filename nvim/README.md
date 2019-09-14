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

To install fonts, create a `.fonts` in `/home/<user>/`, copuy the font file inside that.

Rerun your terminal and Done.
