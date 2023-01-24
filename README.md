![1674518956](https://user-images.githubusercontent.com/125175/214180563-e6b5d961-8d8a-4ab7-9b78-ab33975b32f3.png)

## Prerequisites

* [neovim](https://neovim.io/)
* [packer.nvim](https://github.com/wbthomason/packer.nvim)

## Installation


```bash
git clone https://github.com/compactcode/neovim ~/.config/nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
