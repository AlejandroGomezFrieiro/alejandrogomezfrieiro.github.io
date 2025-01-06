# Quartz

[Quartz](https://quartz.jzhao.xyz/) is a static site generator with integration with [Obsidian](https://obsidian.md/) and [markdown-oxide](https://github.com/Feel-ix-343/markdown-oxide). This lets me edit from anywhere by setting up github permissions and its Github Actions.

# Sync

Linux: Use native 'npx quartz sync'. Alias within a just file as 'just sync'.

Android: Git Sync + Obsidian.  Easy to setup ssh keys and access, syncs every time I open and close the Obsidian app. Single worry: 

Setup:

- [x] Tablet
- [x] Phone
- [x] Laptop

![[Screenshot_20250106_181148_Brave.jpg]]

# Folder organization

PKM organisation has always been an issue for me. I have tried [PARA](https://fortelabs.com/blog/para/) in the past, but having such a structured way of doing things does not go well with me. So far I have decided on a simple structure, and hopefully through practice and iteration it will improve.

```bash
blog
projects
topics
```

For platform cross-usage, I try to avoid Obsidian-only plugins that add functionality.
This way I can keep all of my information in plain markdown.

'markdown-oxide' has good compatibility with Obsidian, but I don't want to make it so that I have a bunch of, for example, Excalidraw diagrams that I won't be able to open in the future if Obsidian dies.


