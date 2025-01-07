---
title: Eternal recurrence
tags: [blog]
---
Nix is both a blessing and a curse sometimes.

Recently I have been trying to refactor my [[neovim]] setup to use [[nixvim]], and I realized how much of a time-sync it can be to continuously iterate configurations.

There are a few factors that, in my point of view, cause this.

First of all, neovim as as a [[neovim#^dd0d89|personalized development environment]] is incredibly powerful, but it also comes with the responsibility to make sure you are happy with the setup and you don't spend too much time on it. When is it enough?

Secondly, let's talk nix.

Nix...can be hard to read and write. There is some LSP support, but unless I am doing something wrong, it does not really handle all arbitrary flakes I throw at it.
