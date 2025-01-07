---
title: Eternal recurrence
tags: [blog]
---
Nix is both a blessing and a curse sometimes.

Recently I have been trying to refactor my [[neovim]] setup to use [[nixvim]], and I realized how much of a time-sync it can be to continuously iterate configurations.

There are a few factors that, in my point of view, cause this.

First of all, neovim as as a [[neovim#^dd0d89|personalized development environment]] is incredibly powerful, but it also comes with the responsibility to make sure you are happy with the setup and you don't spend too much time on it. When is it enough?

Secondly, let's talk nix.

Nix...can be hard to read and write. There is some LSP support, but unless I am doing something wrong, it does not really handle all arbitrary flakes I throw at it. With other languages, specially typed languages (or type-hinted like Python), the LSP can handle a bunch of the mental overload when handling large codebases.

There's also the fact that there are no proper best-practices I have found so far, as the ecosystem is still evolving. Some recommendations I've seen online include

- https://github.com/hercules-ci/flake-parts which still kinda confuses me, but I can see why it is powerful.
- https://jmgilman.github.io/std-book/
- https://snowfall.org/

And likely more. Having so many different standards makes it hard for newcommers to really write their own, as there are insufficient guidelines on how to use them. Also, many of the good tutorials for nix might be from a few years ago, and so they might be incompatible with current tools.

I also find strange that there is no standardized way to document Nix files, which combined with the lack of a strong type-system makes development feel like improvisation and copy-pasting...

Is it because of my inexperienced with the language, and the broader functional programming paradigm?