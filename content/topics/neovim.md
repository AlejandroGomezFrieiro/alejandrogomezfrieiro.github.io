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

> [!note]
With one minor caveat: reproducibility. This is now solved thanks to Nix. Trying to improve my setup, you can read about the efforts in [[nixvim]].

[^pde]: https://youtu.be/QMVIJhC9Veg?si=qtJYVT_CFhCtG2Em

