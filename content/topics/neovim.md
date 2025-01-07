---
title: Neovim
tags:
    - neovim
    - nix
---

# What is neovim
[Neovim](https://neovim.io/) is a modal text editor, born as a fork of [vim](https://www.vim.org/). A modal editor differs from the popularized modeless editor model which can be seen in apps like Window's Notepad. Neovim has three primary modes
- NORMAL: Navigate with `hjkl`, perform actions on code with the syntax `<MODIFIER><ACTION><TARGET>`. For example, `ciw` will delete the word your cursor is on, and enter INSERT mode.
- INSERT: Equivalent to modeless editing.
- VISUAL: Select text using a visual guide.

Neovim has a strong community and lots of plugins thanks to its extensibility.

I have been using Neovim for a few years now, and the experience has been mostly great. The quasi-gamification of text-editing, and its personalisation makes it such a good way to think about writing.

TJ Devries, one of the main developers of Neovim, called it a Personalized Development Environment [^pde].

# Learning
Coming from a modeless editor can be hard to internalise how vim-like movement works. In my case, I think it took a few months of full-time use to overwrite my muscle memory.

> [!note]
You might like vim so much it might be hard to then go back to modeless editors! I have a hard time sometimes switching to using, for example, Jupyter without vim, since I am so used to vim-motions for code editing.

- https://ofirgall.github.io/learn-nvim/chapters/00-why-should-i-learn.html
- [User manual](https://neovim.io/doc/user/usr_01.html) or just run `nvim +Tutor`
- [Vim Adventures](https://vim-adventures.com/): Game to learn the basics of vim movements.

# My setup


> [!note]- Nixvim
One caveat of the dotfile-style setup: reproducibility. I recently had to install neovim in my personal laptop after installing NixOS and had troubke setting up all the required things...
> This lead me to start using [nixvim](https://github.com/nix-community/nixvim), a Nix-based neovim configuration system.
Currently trying to improve my setup to make it reproducible and more modular, you can read about the efforts in [[nixvim]].

My current best attempt at making a neovim setuo that is easily reproducible and portable is in my [personal repo](https://github.com/AlejandroGomezFrieiro/nixvim_config). As long as the system I'm working on has Nix, I should be able to run

```
nix run github:AlejandroGomezFrieiro/nixvim_config
```
to get myself into a neovim terminal. Of course this is not ideal, so I also setup two template flakes that use this neovim for [[rust]] and

[^pde]: https://youtu.be/QMVIJhC9Veg?si=qtJYVT_CFhCtG2Em

