## Prerequisites

* [neovim](https://neovim.io/)
* [packer.nvim](https://github.com/wbthomason/packer.nvim)

## Installation

```bash
git clone https://github.com/compactcode/neovim ~/.config/nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
